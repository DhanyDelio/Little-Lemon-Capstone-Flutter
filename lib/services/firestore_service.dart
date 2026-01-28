import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:little_lemon_flutter/models/profile_dashboard.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<ProfileDashboard?> getUserProfile(String uid) async {
    try {
      var doc = await _db.collection('user').doc(uid).get();

      if (doc.exists && doc.data() != null) {
        return ProfileDashboard.fromMap(doc.data()!);
      }
    } catch (e) {
      debugPrint("Error Firestore: $e");
    }
    return null;
  }
}
