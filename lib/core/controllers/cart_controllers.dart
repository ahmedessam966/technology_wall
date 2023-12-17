import 'package:flutter/material.dart';

class CartControllers extends ChangeNotifier {
  final Map<String, dynamic> _cart = {};
  Map<String, dynamic> get cart => _cart;

  void addToCart(dynamic item) {
    _cart.putIfAbsent(item.id, () => item);
    notifyListeners();
  }

  void removeFromCart(String id) {
    if (_cart.containsKey(id)) {
      _cart.remove(id);
      notifyListeners();
    }
  }
}
