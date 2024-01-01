import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../global/models/product_model.dart';

class NotebooksControllers extends ChangeNotifier {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///Variables
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  int _orderFormStep = 0;
  int get orderFormStep => _orderFormStep;

  final TextEditingController _notebookSearchController = TextEditingController();
  TextEditingController get notebookSearchController => _notebookSearchController;
  final List<ProductModel> _notebooksList = [];
  List<ProductModel> get notebooksList => _notebooksList;

  String? _notebookFilterSelection;
  String? get notebookFilterSelection => _notebookFilterSelection;

  DocumentSnapshot? _lastNBDocument;

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

  void setNBFilter(String? selection) {
    _notebookFilterSelection = selection;
    notifyListeners();
  }

  void setNBSearchController(String value) {
    _notebookSearchController.text = value;
    notifyListeners();
  }

  void searchType() {
    _searchByBrand = !_searchByBrand;
    notifyListeners();
  }

  Future<void> getNotebooks() async {
    try {
      final db = FirebaseFirestore.instance.collection('Notebooks');
      Query<Map<String, dynamic>> query = db.orderBy(FieldPath.documentId).limit(5);

      if (_lastNBDocument != null) {
        query = query.startAfterDocument(_lastNBDocument!);
      }

      final snapshot = await query.get();
      if (_lastNBDocument == null) {
        _notebooksList.clear();
      }

      for (final element in snapshot.docs) {
        final notebook = ProductModel(
            category: 'Notebooks',
            id: element.id,
            title: element.data()['Title'],
            brand: element.data()['Brand'],
            color: element.data()['Colors'],
            cost: element.data()['Cost'],
            display: element.data()['Display'],
            graphics: element.data()['Graphics'],
            maxDiscounted: element.data()['Max Discounted Price'],
            memory: element.data()['Memory'],
            model: element.data()['Model'],
            os: element.data()['Operating System'],
            processor: element.data()['Processor'],
            series: element.data()['Series'],
            snapshot: element.data()['Snapshot'],
            storage: element.data()['Storage'],
            price: element.data()['Selling Price'],
            warranty: element.data()['Warranty']);

        if (!_notebooksList.any((p) => p.id == notebook.id)) {
          _notebooksList.add(notebook);
        }
      }
      if (snapshot.docs.isNotEmpty) {
        _lastNBDocument = snapshot.docs.last;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }

  Future<List<ProductModel>> getBrandFilteredNotebooks() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection('Notebooks');
    final snapshot = await db.where('Brand', isEqualTo: _notebookFilterSelection?.toLowerCase()).get();
    try {
      for (final element in snapshot.docs) {
        final notebook = ProductModel(
            category: 'Notebooks',
            id: element.id,
            title: element.data()['Title'],
            brand: element.data()['Brand'],
            color: element.data()['Colors'],
            cost: element.data()['Cost'],
            display: element.data()['Display'],
            graphics: element.data()['Graphics'],
            maxDiscounted: element.data()['Max Discounted Price'],
            memory: element.data()['Memory'],
            model: element.data()['Model'],
            os: element.data()['Operating System'],
            processor: element.data()['Processor'],
            series: element.data()['Series'],
            snapshot: element.data()['Snapshot'],
            storage: element.data()['Storage'],
            price: element.data()['Selling Price'],
            warranty: element.data()['Warranty']);

        if (!results.any((p) => p.id == notebook.id)) {
          results.add(notebook);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return results;
  }

  Future<List<ProductModel>> searchNotebooks() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection('Notebooks');
    final query = _notebookSearchController.text.toLowerCase();
    final String path = _searchByBrand ? 'Brand' : 'Model';
    final snapshot = await db.where(path, isGreaterThanOrEqualTo: query).get();

    for (final element in snapshot.docs) {
      final notebook = ProductModel(
          category: 'Notebooks',
          id: element.id,
          title: element.data()['Title'],
          brand: element.data()['Brand'],
          color: element.data()['Colors'],
          cost: element.data()['Cost'],
          display: element.data()['Display'],
          graphics: element.data()['Graphics'],
          maxDiscounted: element.data()['Max Discounted Price'],
          memory: element.data()['Memory'],
          model: element.data()['Model'],
          os: element.data()['Operating System'],
          processor: element.data()['Processor'],
          series: element.data()['Series'],
          snapshot: element.data()['Snapshot'],
          storage: element.data()['Storage'],
          price: element.data()['Selling Price'],
          warranty: element.data()['Warranty']);

      if (notebook.model!.toLowerCase().contains(query)) {
        results.add(notebook);
      }
      if (notebook.brand.toLowerCase().contains(query)) {
        results.add(notebook);
      }
    }

    return results;
  }

  Future<void> loadMoreItems() async {
    try {
      await getNotebooks();
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }
}
