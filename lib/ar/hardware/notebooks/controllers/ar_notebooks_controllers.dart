import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/product_model.dart';

class ARNotebooksControllers extends ChangeNotifier {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///Variables
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  int _arOrderFormStep = 0;
  int get arOrderFormStep => _arOrderFormStep;

  final TextEditingController _arNotebookSearchController = TextEditingController();
  TextEditingController get arNotebookSearchController => _arNotebookSearchController;
  final List<ProductModel> _arNotebooksList = [];
  List<ProductModel> get arNotebooksList => _arNotebooksList;

  String? _arNotebookFilterSelection;
  String? get arNotebookFilterSelection => _arNotebookFilterSelection;

  DocumentSnapshot? _arLastNBDocument;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _searchByBrand = false;
  bool get searchByBrand => _searchByBrand;

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///Methods
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void arChangeFormStep(int index) {
    _arOrderFormStep = index;
    notifyListeners();
  }

  void searchType() {
    _searchByBrand = !_searchByBrand;
    notifyListeners();
  }

  void setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void arSetNBFilter(String? selection) {
    _arNotebookFilterSelection = selection;
    notifyListeners();
  }

  void arSetNBSearchController(String value) {
    _arNotebookSearchController.text = value;
    notifyListeners();
  }

  Future<void> arGetNotebooks() async {
    try {
      final db = FirebaseFirestore.instance.collection('الحواسب المحمولة');
      Query<Map<String, dynamic>> query = db.orderBy(FieldPath.documentId).limit(5);

      if (_arLastNBDocument != null) {
        query = query.startAfterDocument(_arLastNBDocument!);
      }

      final snapshot = await query.get();
      if (_arLastNBDocument == null) {
        _arNotebooksList.clear();
      }

      for (final element in snapshot.docs) {
        final notebook = ProductModel(
            category: 'الحواسب المحمولة',
            id: element.id,
            title: element.data()['العنوان'],
            brand: element.data()['الماركة'],
            color: element.data()['الالوان'],
            cost: element.data()['التكلفة'],
            display: element.data()['العرض'],
            graphics: element.data()['الرسومات'],
            maxDiscounted: element.data()['سعر الخصم'],
            memory: element.data()['الذاكرة'],
            model: element.data()['الموديل'],
            os: element.data()['نظام التشغيل'],
            processor: element.data()['المعالج'],
            series: element.data()['السلسلة'],
            snapshot: element.data()['الصورة'],
            storage: element.data()['التخزين'],
            price: element.data()['سعر البيع'],
            warranty: element.data()['الضمان']);

        if (!_arNotebooksList.any((p) => p.id == notebook.id)) {
          _arNotebooksList.add(notebook);
        }
      }
      if (snapshot.docs.isNotEmpty) {
        _arLastNBDocument = snapshot.docs.last;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }

  Future<List<ProductModel>> arGetBrandFilteredNotebooks() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection('الحواسب المحمولة');
    final snapshot = await db.where('الماركة', isEqualTo: _arNotebookFilterSelection?.toLowerCase()).get();
    try {
      for (final element in snapshot.docs) {
        final notebook = ProductModel(
            category: 'الحواسب المحمولة',
            id: element.id,
            title: element.data()['العنوان'],
            brand: element.data()['الماركة'],
            color: element.data()['الالوان'],
            cost: element.data()['التكلفة'],
            display: element.data()['العرض'],
            graphics: element.data()['الرسومات'],
            maxDiscounted: element.data()['سعر الخصم'],
            memory: element.data()['الذاكرة'],
            model: element.data()['الموديل'],
            os: element.data()['نظام التشغيل'],
            processor: element.data()['المعالج'],
            series: element.data()['السلسلة'],
            snapshot: element.data()['الصورة'],
            storage: element.data()['التخزين'],
            price: element.data()['سعر البيع'],
            warranty: element.data()['الضمان']);

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

  Future<List<ProductModel>> arSearchNotebooks() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection('الحواسب المحمولة');
    final query = _arNotebookSearchController.text.toLowerCase();
    final String path = _searchByBrand ? 'الماركة' : 'الموديل';
    final snapshot = await db.where(path, isGreaterThanOrEqualTo: query).get();

    for (final element in snapshot.docs) {
      final notebook = ProductModel(
          category: 'الحواسب المحمولة',
          id: element.id,
          title: element.data()['العنوان'],
          brand: element.data()['الماركة'],
          color: element.data()['الالوان'],
          cost: element.data()['التكلفة'],
          display: element.data()['العرض'],
          graphics: element.data()['الرسومات'],
          maxDiscounted: element.data()['سعر الخصم'],
          memory: element.data()['الذاكرة'],
          model: element.data()['الموديل'],
          os: element.data()['نظام التشغيل'],
          processor: element.data()['المعالج'],
          series: element.data()['السلسلة'],
          snapshot: element.data()['الصورة'],
          storage: element.data()['التخزين'],
          price: element.data()['سعر البيع'],
          warranty: element.data()['الضمان']);

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
      await arGetNotebooks();
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }
}
