import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../global/models/product_model.dart';

class ARDesktopsControllers extends ChangeNotifier {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///Variables
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  int _arOrderFormStep = 0;
  int get arOrderFormStep => _arOrderFormStep;

  final TextEditingController _arDesktopSearchController = TextEditingController();
  TextEditingController get arDesktopSearchController => _arDesktopSearchController;
  final List<ProductModel> _arDesktopsList = [];
  List<ProductModel> get arDesktopsList => _arDesktopsList;

  String? _arDesktopFilterSelection;
  String? get arDesktopFilterSelection => _arDesktopFilterSelection;

  DocumentSnapshot? _arLastDesktopDocument;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _searchByBrand = false;
  bool get searchByBrand => _searchByBrand;

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///Variables
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void arChangeFormStep(int index) {
    _arOrderFormStep = index;
    notifyListeners();
  }

  void arSetDesktopFilter(String? selection) {
    _arDesktopFilterSelection = selection;
    notifyListeners();
  }

  void arSetDesktopSearchController(String value) {
    _arDesktopSearchController.text = value;
    notifyListeners();
  }

  void searchType() {
    _searchByBrand = !_searchByBrand;
    notifyListeners();
  }

  Future<void> arGetDesktops() async {
    try {
      final db = FirebaseFirestore.instance.collection('الحواسب المكتبية');
      Query<Map<String, dynamic>> query = db.orderBy(FieldPath.documentId).limit(5);

      if (_arLastDesktopDocument != null) {
        query = query.startAfterDocument(_arLastDesktopDocument!);
      }

      final snapshot = await query.get();
      if (_arLastDesktopDocument == null) {
        _arDesktopsList.clear();
      }

      for (final element in snapshot.docs) {
        final desktop = ProductModel(
            category: 'الحواسب المكتبية',
            id: element.id,
            title: element.data()['العنوان'],
            brand: element.data()['الماركة'],
            cost: element.data()['التكلفة'],
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
            warranty: element.data()['الضمان'],
            stock: element.data()['المخزون']);

        if (!_arDesktopsList.any((p) => p.id == desktop.id)) {
          _arDesktopsList.add(desktop);
        }
      }
      if (snapshot.docs.isNotEmpty) {
        _arLastDesktopDocument = snapshot.docs.last;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }

  Future<List<ProductModel>> arGetBrandFilteredDesktops() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection('الحواسب المكتبية');
    final snapshot = await db.where('الماركة', isEqualTo: _arDesktopFilterSelection?.toLowerCase()).get();
    try {
      for (final element in snapshot.docs) {
        final desktop = ProductModel(
            category: 'الحواسب المكتبية',
            id: element.id,
            title: element.data()['العنوان'],
            brand: element.data()['الماركة'],
            cost: element.data()['التكلفة'],
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
            warranty: element.data()['الضمان'],
            stock: element.data()['المخزون']);

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

  Future<List<ProductModel>> arSearchDesktops() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection('الحواسب المكبية');
    final query = _arDesktopSearchController.text.toLowerCase();
    final String path = _searchByBrand ? 'الماركة' : 'الموديل';
    final snapshot = await db.where(path, isGreaterThanOrEqualTo: query).get();

    for (final element in snapshot.docs) {
      final desktop = ProductModel(
          category: 'الحواسب المكتبية',
          id: element.id,
          title: element.data()['العنوان'],
          brand: element.data()['الماركة'],
          cost: element.data()['التكلفة'],
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
          warranty: element.data()['الضمان'],
          stock: element.data()['المخزون']);

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
      await arGetDesktops();
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }
}
