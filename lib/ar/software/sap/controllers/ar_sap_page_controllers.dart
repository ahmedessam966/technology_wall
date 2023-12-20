import 'package:flutter/material.dart';

class ARSAPPageControllers extends ChangeNotifier {
  bool _isHovered = false;
  bool get isHovered => _isHovered;

  void setHovering(bool state) {
    _isHovered = state;
    notifyListeners();
  }
}
