import 'package:go_router/go_router.dart';
import 'package:little_lemon_flutter/screen/home_screen.dart';
import '../screen/login_screen.dart';
import '../screen/register_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/homescreen',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
