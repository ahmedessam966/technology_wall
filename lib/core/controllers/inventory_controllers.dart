import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:technology_wall/core/models/printer_model.dart';
import 'package:technology_wall/core/models/product_model.dart';

class InventoryControllers extends ChangeNotifier {
  int _orderFormStep = 0;
  int get orderFormStep => _orderFormStep;

  final List<PrinterModel> _printersList = [];
  List<PrinterModel> get printersList => _printersList;

  String? _printerFilterSelection;
  String? get printerFilterSelection => _printerFilterSelection;

  DocumentSnapshot? _lastDocument;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

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
        final printer = PrinterModel(
            id: element.id,
            brand: element.data()['Brand'],
            model: element.data()['Model'],
            price: element.data()['Selling Price'],
            cost: element.data()['Cost'],
            discounted: element.data()['Max Discounted Price'],
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

  Future<List> getBrandFilteredPrinters(String? brand) async {
    final List<ProductModel> brandedPrinters = [];
    try {
      final db = FirebaseFirestore.instance.collection('Printers');
      final snapshot = await db.where("Brand", isEqualTo: '$brand').get();
      for (final element in snapshot.docs) {
        final printer = ProductModel(
            id: element.id,
            brand: element.data()['Brand'],
            model: element.data()['Model'],
            serial: element.data()['Serial Number'],
            specs: element.data()['Description'],
            price: element.data()['Selling Price'],
            discounted: element.data()['Max Discounted Price'],
            cost: element.data()['Cost'],
            firstPath: element.data()['Snapshot']);
        brandedPrinters.add(printer);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
    return brandedPrinters;
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
