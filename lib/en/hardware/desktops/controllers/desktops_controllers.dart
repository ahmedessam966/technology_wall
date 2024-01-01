import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../global/models/product_model.dart';

class DekstopsControllers extends ChangeNotifier {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///Variables
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  int _orderFormStep = 0;
  int get orderFormStep => _orderFormStep;

  final TextEditingController _desktopSearchController = TextEditingController();
  TextEditingController get desktopSearchController => _desktopSearchController;
  final List<ProductModel> _desktopsList = [];
  List<ProductModel> get desktopsList => _desktopsList;

  String? _desktopFilterSelection;
  String? get desktopFilterSelection => _desktopFilterSelection;

  DocumentSnapshot? _lastDesktopDocument;

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

  void searchType() {
    _searchByBrand = !_searchByBrand;
    notifyListeners();
  }

  void setDesktopFilter(String? selection) {
    _desktopFilterSelection = selection;
    notifyListeners();
  }

  void setDesktopSearchController(String value) {
    _desktopSearchController.text = value;
    notifyListeners();
  }

  Future<void> getDesktops() async {
    try {
      final db = FirebaseFirestore.instance.collection('Desktops');
      Query<Map<String, dynamic>> query = db.orderBy(FieldPath.documentId).limit(5);

      if (_lastDesktopDocument != null) {
        query = query.startAfterDocument(_lastDesktopDocument!);
      }

      final snapshot = await query.get();
      if (_lastDesktopDocument == null) {
        _desktopsList.clear();
      }

      for (final element in snapshot.docs) {
        final desktop = ProductModel(
            category: 'Desktops',
            id: element.id,
            title: element.data()['Title'],
            brand: element.data()['Brand'],
            cost: element.data()['Cost'],
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

        if (!_desktopsList.any((p) => p.id == desktop.id)) {
          _desktopsList.add(desktop);
        }
      }
      if (snapshot.docs.isNotEmpty) {
        _lastDesktopDocument = snapshot.docs.last;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }

  Future<List<ProductModel>> getBrandFilteredDesktops() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection('Desktops');
    final snapshot = await db.where('Brand', isEqualTo: _desktopFilterSelection?.toLowerCase()).get();
    try {
      for (final element in snapshot.docs) {
        final desktop = ProductModel(
            category: 'Desktops',
            id: element.id,
            title: element.data()['Title'],
            brand: element.data()['Brand'],
            color: element.data()['Colors'],
            cost: element.data()['Cost'],
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

        if (!results.any((p) => p.id == desktop.id)) {
          results.add(desktop);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return results;
  }

  Future<List<ProductModel>> searchDesktops() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection('Desktops');
    final query = _desktopSearchController.text.toLowerCase();
    final String path = _searchByBrand ? 'Brand' : 'Model';
    final snapshot = await db.where(path, isGreaterThanOrEqualTo: query).get();

    for (final element in snapshot.docs) {
      final desktop = ProductModel(
          category: 'Desktops',
          id: element.id,
          title: element.data()['Title'],
          brand: element.data()['Brand'],
          color: element.data()['Colors'],
          cost: element.data()['Cost'],
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

      if (desktop.model!.toLowerCase().contains(query)) {
        results.add(desktop);
      }
      if (desktop.brand.toLowerCase().contains(query)) {
        results.add(desktop);
      }
    }

    return results;
  }

  Future<void> loadMoreItems() async {
    try {
      await getDesktops();
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }
}
