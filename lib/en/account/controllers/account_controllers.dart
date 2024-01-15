import 'package:flutter/material.dart';

class AccountControllers extends ChangeNotifier {
  bool _isContactReadOnly = true;
  bool get isContactReadOnly => _isContactReadOnly;

  void enableContactEdit() {
    _isContactReadOnly = !_isContactReadOnly;
    notifyListeners();
  }
}
