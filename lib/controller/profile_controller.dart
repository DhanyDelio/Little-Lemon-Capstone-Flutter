import 'package:flutter/cupertino.dart';
import 'package:little_lemon_flutter/models/profile_dashboard.dart';
import 'package:little_lemon_flutter/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController extends ChangeNotifier {
  final _service = FirestoreService();
  final _auth = FirebaseAuth.instance;

  ProfileDashboard? userProfile;
  bool isLoading = true;

  Future<void> fetchProfile() async {
    isLoading = true;
    notifyListeners();

    final uid = _auth.currentUser?.uid ?? '';
    userProfile = await _service.getUserProfile(uid);

    isLoading = false;
    notifyListeners();
  }
}
