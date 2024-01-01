import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../global/models/product_model.dart';

class ARPrintersControllers extends ChangeNotifier {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///Variables
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  int _arOrderFormStep = 0;
  int get arOrderFormStep => _arOrderFormStep;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _arPrinterSearchController = TextEditingController();
  TextEditingController get arPrinterSearchController => _arPrinterSearchController;
  final List<ProductModel> _arPrintersList = [];
  List<ProductModel> get arPrintersList => _arPrintersList;

  String? _arPrinterFilterSelection;
  String? get arPrinterFilterSelection => _arPrinterFilterSelection;

  bool _searchByBrand = false;
  bool get searchByBrand => _searchByBrand;

  DocumentSnapshot? _arLastDocument;

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///Methods
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void arChangeFormStep(int index) {
    _arOrderFormStep = index;
    notifyListeners();
  }

  void arSetFilter(String? selection) {
    _arPrinterFilterSelection = selection;
    notifyListeners();
  }

  void searchType() {
    _searchByBrand = !_searchByBrand;
    notifyListeners();
  }

  void arSetPrinterSearchController(String value) {
    _arPrinterSearchController.text = value;
    notifyListeners();
  }

  Future<void> arGetPrinters() async {
    try {
      final db = FirebaseFirestore.instance.collection('الطابعات');
      Query<Map<String, dynamic>> query = db.orderBy(FieldPath.documentId).limit(5);

      if (_arLastDocument != null) {
        query = query.startAfterDocument(_arLastDocument!);
      }

      final snapshot = await query.get();
      if (_arLastDocument == null) {
        _arPrintersList.clear();
      }

      for (final element in snapshot.docs) {
        final printer = ProductModel(
            category: 'الطابعات',
            id: element.id,
            title: element.data()['العنوان'],
            brand: element.data()['الماركة'],
            model: element.data()['الموديل'],
            price: element.data()['سعر البيع'],
            cost: element.data()['التكلفة'],
            maxDiscounted: element.data()['سعر الخصم'],
            stock: element.data()['المخزون'],
            family: element.data()['العائلة'],
            toner: element.data()['الاحبار'],
            ppm: element.data()['السرعة'],
            type: element.data()['النوع'],
            utility: element.data()['الاستخدام'],
            snapshot: element.data()['الصورة'],
            network: element.data()['الشبكة']);
        if (!_arPrintersList.any((p) => p.id == printer.id)) {
          _arPrintersList.add(printer);
        }
      }
      if (snapshot.docs.isNotEmpty) {
        _arLastDocument = snapshot.docs.last;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }

  Future<List<ProductModel>> arGetBrandFilteredPrinters(String? brand) async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection('الطابعات');
    final snapshot = await db.where('Brand', isEqualTo: _arPrinterFilterSelection?.toLowerCase()).get();
    try {
      for (final element in snapshot.docs) {
        final printer = ProductModel(
            category: 'الطابعات',
            id: element.id,
            title: element.data()['العنوان'],
            brand: element.data()['الماركة'],
            model: element.data()['الموديل'],
            price: element.data()['سعر البيع'],
            cost: element.data()['التكلفة'],
            maxDiscounted: element.data()['سعر الخصم'],
            stock: element.data()['المخزون'],
            family: element.data()['العائلة'],
            toner: element.data()['الاحبار'],
            ppm: element.data()['السرعة'],
            type: element.data()['النوع'],
            utility: element.data()['الاستخدام'],
            snapshot: element.data()['الصورة'],
            network: element.data()['الشبكة']);
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

  Future<List<ProductModel>> arSearchPrinters() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection('الطابعات');
    final query = _arPrinterSearchController.text.toLowerCase();
    final String path = _searchByBrand ? 'الماركة' : 'الموديل';
    final snapshot = await db.where(path, isGreaterThanOrEqualTo: query).get();

    for (final element in snapshot.docs) {
      final printer = ProductModel(
          category: 'الطابعات',
          id: element.id,
          title: element.data()['العنوان'],
          brand: element.data()['الماركة'],
          model: element.data()['الموديل'],
          price: element.data()['سعر البيع'],
          cost: element.data()['التكلفة'],
          maxDiscounted: element.data()['سعر الخصم'],
          stock: element.data()['المخزون'],
          family: element.data()['العائلة'],
          toner: element.data()['الاحبار'],
          ppm: element.data()['السرعة'],
          type: element.data()['النوع'],
          utility: element.data()['الاستخدام'],
          snapshot: element.data()['الصورة'],
          network: element.data()['الشبكة']);

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
      await arGetPrinters();
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }
}
