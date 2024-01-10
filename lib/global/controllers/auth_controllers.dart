import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:technology_wall/global/models/user_model.dart';
import '../models/staff_model.dart';

class AuthControllers extends ChangeNotifier {
  StaffModel? _staffModel;
  StaffModel? get staffModel => _staffModel;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  Future userLogin(String email, String pass) async {
    try {
      final creds = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim().toLowerCase(), password: pass);
      if (creds.user != null) {
        final ref = FirebaseFirestore.instance.collection('Users');
        final snapshot = await ref.where(FieldPath.documentId, isEqualTo: creds.user?.uid).get();
        for (final element in snapshot.docs) {
          final Map? cart = element.data()['Cart'] as Map;
          _userModel = UserModel(
              id: creds.user!.uid,
              email: element.data()['Email Address'],
              name: element.data()['Name'],
              dateCreated: element.data()['Date Created'],
              cart: cart ?? {},
              location: element.data()['Location']);
        }
        notifyListeners();
        return 200;
      } else {
        return 500;
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
}
