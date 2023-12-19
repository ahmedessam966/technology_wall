import 'package:flutter/material.dart';

class SAPPageControllers extends ChangeNotifier {
  bool _isHovered = false;
  bool get isHovered => _isHovered;

  void setHovering(bool state) {
    _isHovered = state;
    notifyListeners();
  }
}
