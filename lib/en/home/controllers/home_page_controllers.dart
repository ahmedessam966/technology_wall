import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:technology_wall/global/models/product_model.dart';

class HomePageControllers extends ChangeNotifier {
  int _orderFormStep = 0;
  int get orderFormStep => _orderFormStep;

  final TextEditingController _productSearchController = TextEditingController();
  TextEditingController get productSearchController => _productSearchController;

  void changeFormStep(int index) {
    _orderFormStep = index;
    notifyListeners();
  }

  void setSearchController(String value) {
    _productSearchController.text = value;
    notifyListeners();
  }

  Future<List<ProductModel>> generalFormSearch() async {
    final List<ProductModel> results = [];
    final query = _productSearchController.text.toLowerCase();
    final db = FirebaseFirestore.instance.collection('');
    final snapshot = await db.where('Title', isGreaterThanOrEqualTo: query).get();
    for (final element in snapshot.docs) {
      final product = ProductModel(
          category: _productSearchController.text,
          id: element.id,
          title: element.data()['Title'],
          brand: element.data()['Brand'],
          cost: element.data()['Cost'],
          maxDiscounted: element.data()['Max Discounted Price'],
          model: element.data()['Model'],
          snapshot: element.data()['Snapshot'],
          price: element.data()['Selling Price']);
      if (product.model!.toLowerCase().contains(query)) {
        results.add(product);
      }
    }
    return results;
  }
}
