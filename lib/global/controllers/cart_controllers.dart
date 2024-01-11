import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:technology_wall/global/models/product_model.dart';

class CartControllers extends ChangeNotifier {
  final ref = FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser?.uid);

  final Map<String, dynamic> _dbCart = {};
  Map<String, dynamic> get dbCart => _dbCart;

  Future<void> addToCart(dynamic item) async {
    _dbCart.putIfAbsent(item.id, () => item);
    notifyListeners();
    final date = DateTime.now();
    final time = TimeOfDay.now();
    final snapshot = await ref.get();
    final Map<String, dynamic> cartMap = snapshot.data()?['Cart'] as Map<String, dynamic>;
    _dbCart.forEach((key, value) {
      final item = ProductModel(
          category: value.category,
          id: key,
          title: value.title,
          brand: value.brand,
          price: value.price,
          cost: value.cost,
          maxDiscounted: value.maxDiscounted,
          snapshot: value.snapshot);
      cartMap.putIfAbsent(
          key,
          () => {
                "Category": item.category,
                "Product ID": item.id,
                "Product": item.title,
                "Price": item.price,
                "Brand": item.brand,
                "Cost": item.cost,
                "Max Discounted Price": item.maxDiscounted,
                "Snapshot": item.snapshot
              });
    });
    await ref.update({'Cart': cartMap});
  }

  Future<void> removeFromCart(String id) async {
    if (_dbCart.containsKey(id)) {
      try {
        final snapshot = await ref.get();
        final Map<String, dynamic> cartMap = snapshot.data()?['Cart'] as Map<String, dynamic>;
        _dbCart.remove(id);
        cartMap.remove(id);
        notifyListeners();
        await ref.update({'Cart': cartMap});
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> getCartFromDB() async {
    final snapshot = await ref.get();
    if (snapshot.data()?['Cart'] != null) {
      final fetched = snapshot.data()?['Cart'] as Map<String, dynamic>;
      fetched.forEach((key, value) {
        final item = ProductModel(
            category: value['Category'],
            id: key,
            title: value['Product'],
            brand: value['Brand'],
            price: value['Price'],
            cost: value['Cost'],
            maxDiscounted: value['Max Discounted Price'],
            snapshot: value['Snapshot']);
        _dbCart.putIfAbsent(key, () => item);
      });
    }
  }
}
