import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:little_lemon_flutter/screen/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:little_lemon_flutter/widget/Auth/auth_input.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

// Helper to find AuthInput widgets by their hint text.
Finder findAuthInputByHint(String hintText) {
  return find.byWidgetPredicate(
    (Widget widget) => widget is AuthInput && widget.hint == hintText,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // Use this mock, it's simpler and supports Pigeon
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/firebase_core'),
      (MethodCall methodCall) async {
        if (methodCall.method == 'Firebase#initializeApp') {
          return {
            'name': '[DEFAULT]',
            'options': {
              'apiKey': '123',
              'appId': '123',
              'messagingSenderId': '123',
              'projectId': '123',
            },
            'pluginConstants': {},
          };
        }
        return null;
      },
    );

    // This trick is sometimes needed for Pigeon:
    // We force a bypass of the native initialization
    await Firebase.initializeApp();
  });

  testWidgets('LoginScreen validation test', (WidgetTester tester) async {
    final mockGoRouter = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (_, __) => const LoginScreen()),
        GoRoute(
          path: '/homescreen',
          builder: (_, __) => const Scaffold(body: Text('HomeScreen')),
        ),
        GoRoute(
          path: '/register',
          builder: (_, __) => const Scaffold(body: Text('RegisterScreen')),
        ),
      ],
    );
    // Build our app with the mocked router.
    await tester.pumpWidget(MaterialApp.router(routerConfig: mockGoRouter));

    // Find the widgets we need to interact with.
    final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    final emailFieldFinder = find.descendant(
      of: findAuthInputByHint('Email Address'),
      matching: find.byType(TextFormField),
    );
    final passwordFieldFinder = find.descendant(
      of: findAuthInputByHint('Password'),
      matching: find.byType(TextFormField),
    );

    // --- Test Case 1: Empty Fields ---
    // Tap the login button without entering any text.
    await tester.tap(loginButton);
    // Let the UI rebuild to show error messages.
    await tester.pumpAndSettle();

    // Verify that the 'error' property on AuthInput widgets is now populated.
    AuthInput emailInput = tester.widget(findAuthInputByHint('Email Address'));
    AuthInput passwordInput = tester.widget(findAuthInputByHint('Password'));
    expect(
      emailInput.error,
      isNotNull,
      reason: "Error message should be shown for empty email",
    );
    expect(
      passwordInput.error,
      isNotNull,
      reason: "Error message should be shown for empty password",
    );

    // --- Test Case 2: Invalid Email ---
    // Enter an invalid email and a valid password.
    await tester.enterText(emailFieldFinder, 'not-an-email');
    await tester.enterText(passwordFieldFinder, 'a-valid-password');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Verify the error message is shown only for the email field.
    emailInput = tester.widget(findAuthInputByHint('Email Address'));
    passwordInput = tester.widget(findAuthInputByHint('Password'));
    expect(
      emailInput.error,
      isNotNull,
      reason: "Error message should be shown for invalid email",
    );
    expect(
      passwordInput.error,
      isNull,
      reason: "Password is valid, so no error message should be shown",
    );

    // --- Test Case 3: Short Password ---
    // Enter a valid email and a short password.
    await tester.enterText(emailFieldFinder, 'valid@email.com');
    await tester.enterText(passwordFieldFinder, '123');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    // Verify the error message is shown only for the password field.
    emailInput = tester.widget(findAuthInputByHint('Email Address'));
    passwordInput = tester.widget(findAuthInputByHint('Password'));
    expect(
      emailInput.error,
      isNull,
      reason: "Email is valid, so no error message should be shown",
    );
    expect(
      passwordInput.error,
      isNotNull,
      reason: "Error message should be shown for a short password",
    );
  });
}