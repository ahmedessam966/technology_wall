import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technology_wall/config/cookies_manager.dart';
import 'package:technology_wall/global/models/user_model.dart';
import '../models/staff_model.dart';

class AuthControllers extends ChangeNotifier {
  StaffModel? _staffModel;
  StaffModel? get staffModel => _staffModel;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  bool _rememberUser = false;
  bool get rememberUser => _rememberUser;

  void rememberCreds(bool state) {
    _rememberUser = state;
    notifyListeners();
  }

  Future userLogin(String email, String pass) async {
    try {
      final creds = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email.trim().toLowerCase(), password: pass);
      if (creds.user != null) {
        final ref = FirebaseFirestore.instance.collection('Users');
        final snapshot = await ref.where(FieldPath.documentId, isEqualTo: creds.user?.uid).get();
        final CookiesManager cookie = CookiesManager();
        cookie.setCookie('uid', creds.user!.uid);
        if (_rememberUser) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setStringList(creds.user!.uid, [email.trim().toLowerCase(), pass]);
        }
        for (final element in snapshot.docs) {
          final CookiesManager cookie = CookiesManager();
          final String? city = cookie.getCookie('city');
          final String? country = cookie.getCookie('country');
          _userModel = UserModel(
              id: creds.user!.uid,
              email: element.data()['Email Address'],
              name: element.data()['Name'],
              dateCreated: element.data()['Date Created'],
              cart: element.data()['Cart'],
              location: '$city, $country');
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

  Future<void> checkExistingCredentials() async {
    final CookiesManager cookie = CookiesManager();
    final String? uid = cookie.getUIDCookies('uid');
    if (uid != null) {
      final prefs = await SharedPreferences.getInstance();
      final List? info = prefs.getStringList(uid);
      if (info != null) {
        final UserCredential currentUser =
            await FirebaseAuth.instance.signInWithEmailAndPassword(email: info[0], password: info[1]);
        final ref = FirebaseFirestore.instance.collection('Users');
        final snapshot = await ref.where(FieldPath.documentId, isEqualTo: currentUser.user?.uid).get();
        for (final element in snapshot.docs) {
          _userModel = UserModel(
              id: currentUser.user!.uid,
              email: element.data()['Email Address'],
              name: element.data()['Name'],
              dateCreated: element.data()['Date Created'],
              cart: element.data()['Cart'],
              location: element.data()['Location']);
        }
        notifyListeners();
      }
    }
  }

  void logOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userModel!.id);
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.code);
        print(e.message);
      }
    }
    notifyListeners();
  }
}
