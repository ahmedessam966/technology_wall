import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../global/models/product_model.dart';

class PrintersControllers extends ChangeNotifier {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///Variables
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  int _orderFormStep = 0;
  int get orderFormStep => _orderFormStep;

  final TextEditingController _printerSearchController = TextEditingController();
  TextEditingController get printerSearchController => _printerSearchController;
  final List<ProductModel> _printersList = [];
  List<ProductModel> get printersList => _printersList;

  String? _printerFilterSelection;
  String? get printerFilterSelection => _printerFilterSelection;

  DocumentSnapshot? _lastDocument;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _searchByBrand = false;
  bool get searchByBrand => _searchByBrand;

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///Methods
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void changeFormStep(int index) {
    _orderFormStep = index;
    notifyListeners();
  }

  void setFilter(String? selection) {
    _printerFilterSelection = selection;
    notifyListeners();
  }

  void setPrinterSearchController(String value) {
    _printerSearchController.text = value;
    notifyListeners();
  }

  void searchType() {
    _searchByBrand = !_searchByBrand;
    notifyListeners();
  }

  Future<void> getPrinters() async {
    try {
      final db = FirebaseFirestore.instance.collection('Printers');
      Query<Map<String, dynamic>> query = db.orderBy(FieldPath.documentId).limit(5);

      if (_lastDocument != null) {
        query = query.startAfterDocument(_lastDocument!);
      }

      final snapshot = await query.get();
      if (_lastDocument == null) {
        _printersList.clear();
      }

      for (final element in snapshot.docs) {
        final printer = ProductModel(
            category: 'Printers',
            id: element.id,
            title: element.data()['Title'],
            brand: element.data()['Brand'],
            model: element.data()['Model'],
            price: element.data()['Selling Price'],
            cost: element.data()['Cost'],
            maxDiscounted: element.data()['Max Discounted Price'],
            stock: element.data()['Stock'],
            family: element.data()['Family'],
            toner: element.data()['Toners'],
            ppm: element.data()['PPM'],
            type: element.data()['Type'],
            utility: element.data()['Utility'],
            snapshot: element.data()['Snapshot'],
            network: element.data()['Network']);
        if (!_printersList.any((p) => p.id == printer.id)) {
          _printersList.add(printer);
        }
      }
      if (snapshot.docs.isNotEmpty) {
        _lastDocument = snapshot.docs.last;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }

  Future<List<ProductModel>> getBrandFilteredPrinters(String? brand) async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection('Printers');
    final snapshot = await db.where('Brand', isEqualTo: _printerFilterSelection?.toLowerCase()).get();
    try {
      for (final element in snapshot.docs) {
        final printer = ProductModel(
            category: 'Printers',
            id: element.id,
            title: element.data()['Title'],
            brand: element.data()['Brand'],
            model: element.data()['Model'],
            price: element.data()['Selling Price'],
            cost: element.data()['Cost'],
            maxDiscounted: element.data()['Max Discounted Price'],
            stock: element.data()['Stock'],
            family: element.data()['Family'],
            toner: element.data()['Toners'],
            ppm: element.data()['PPM'],
            type: element.data()['Type'],
            utility: element.data()['Utility'],
            snapshot: element.data()['Snapshot'],
            network: element.data()['Network']);
        if (!results.any((p) => p.id == printer.id)) {
          results.add(printer);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return results;
  }

  Future<List<ProductModel>> searchPrinters() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection('Printers');
    final query = _printerSearchController.text.toLowerCase();
    final String path = _searchByBrand ? 'Brand' : 'Model';
    final snapshot = await db.where(path, isGreaterThanOrEqualTo: query).get();

    for (final element in snapshot.docs) {
      final printer = ProductModel(
          category: 'Printers',
          id: element.id,
          title: element.data()['Title'],
          brand: element.data()['Brand'],
          model: element.data()['Model'],
          price: element.data()['Selling Price'],
          cost: element.data()['Cost'],
          maxDiscounted: element.data()['Max Discounted Price'],
          stock: element.data()['Stock'],
          family: element.data()['Family'],
          toner: element.data()['Toners'],
          ppm: element.data()['PPM'],
          type: element.data()['Type'],
          utility: element.data()['Utility'],
          snapshot: element.data()['Snapshot'],
          network: element.data()['Network']);

      // Convert field value to lowercase and check for a case-insensitive match
      if (printer.model!.toLowerCase().contains(query)) {
        results.add(printer);
      }
      if (printer.brand.toLowerCase().contains(query)) {
        results.add(printer);
      }
    }

    return results;
  }

  Future<void> loadMoreItems() async {
    try {
      await getPrinters();
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }
}
