import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> signIn(String phone) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    QuerySnapshot snapshot = await _firestore
        .collection("users")
        .where("phone", isEqualTo: phone)
        .get();

    final userSnap = snapshot.docs.firstOrNull;
    if (userSnap != null) {
      final user = userSnap.data() as Map;
      Map obj = {
        "name": user['name'],
        "role": user['role'],
        "phone": user['phone']
      };
      await preferences.setString("user", jsonEncode(obj));
      return true;
    }
    return false;
  }

  Future<bool> signUp(Map<String, dynamic> data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (data["role"] == "owner") {
      data.remove("shop");
    }
    DocumentReference reference =
        await _firestore.collection("users").add(data);
    final userSnap = await reference.get();
    final user = userSnap.data() as Map;
    if (user.isNotEmpty) {
      Map obj = {
        "name": user['name'],
        "role": user['role'],
        "phone": user['phone']
      };
      await preferences.setString("user", jsonEncode(obj));
      return true;
    }
    return false;
  }

  Future<bool> signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove("user");
  }
}
