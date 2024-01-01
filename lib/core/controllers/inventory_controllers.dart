import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:technology_wall/core/models/product_model.dart';

class InventoryControllers extends ChangeNotifier {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///English Database Controllers
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  int _orderFormStep = 0;
  int get orderFormStep => _orderFormStep;

  final TextEditingController _generalHardwareSearchController = TextEditingController();
  TextEditingController get generalHardwareSearchController => _generalHardwareSearchController;

  final TextEditingController _printerSearchController = TextEditingController();
  TextEditingController get printerSearchController => _printerSearchController;
  final List<ProductModel> _printersList = [];
  List<ProductModel> get printersList => _printersList;

  final TextEditingController _notebookSearchController = TextEditingController();
  TextEditingController get notebookSearchController => _notebookSearchController;
  final List<ProductModel> _notebooksList = [];
  List<ProductModel> get notebooksList => _notebooksList;

  String? _hardwareFilterSelection;
  String? get hardwareFilterSelection => _hardwareFilterSelection;

  String? _printerFilterSelection;
  String? get printerFilterSelection => _printerFilterSelection;

  String? _notebookFilterSelection;
  String? get notebookFilterSelection => _notebookFilterSelection;

  DocumentSnapshot? _lastDocument;
  DocumentSnapshot? _lastNBDocument;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _searchByBrand = false;
  bool get searchByBrand => _searchByBrand;

  void setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void changeFormStep(int index) {
    _orderFormStep = index;
    notifyListeners();
  }

  void setHardwareFilter(String? selection) {
    _hardwareFilterSelection = selection;
    notifyListeners();
  }

  void setFilter(String? selection) {
    _printerFilterSelection = selection;
    notifyListeners();
  }

  void setNBFilter(String? selection) {
    _notebookFilterSelection = selection;
    notifyListeners();
  }

  void setGeneralSearchController(String value) {
    _generalHardwareSearchController.text = value;
    notifyListeners();
  }

  void setNBSearchController(String value) {
    _notebookSearchController.text = value;
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

  Future<List<ProductModel>> searchInventory() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection(_hardwareFilterSelection.toString());
    final query = _printerSearchController.text.toLowerCase();
    final snapshot = await db.where('Model', isGreaterThanOrEqualTo: query).get();
    for (final element in snapshot.docs) {
      final product = ProductModel(
          category: _hardwareFilterSelection.toString(),
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

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

  Future<void> loadMoreItems(dynamic function) async {
    try {
      await function;
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }

  Future<List<ProductModel>> getFeaturedProducts() async {
    final List<ProductModel> feeatured = [];
    try {
      final db = await FirebaseFirestore.instance.collection('Index').get();
      for (final category in db.docs) {
        final subcat = FirebaseFirestore.instance.collection(category.id);
        final entry = await subcat.where('Featured', isEqualTo: true).get();
        for (final element in entry.docs) {
          final product = ProductModel(
            category: category.id,
            id: element.id,
            title: element.data()['Title'],
            brand: element.data()['Brand'],
            cost: element.data()['Cost'],
            maxDiscounted: element.data()['Max Discounted Price'],
            model: element.data()['Model'].toString().toUpperCase(),
            snapshot: element.data()['Snapshot'],
            price: element.data()['Selling Price'],
            /////////////////////////////////////////////////////////
            ///Variable Data Based On Fetched Product Type
            /////////////////////////////////////////////////////////
            ppm: element.data()['PPM'],
            family: element.data()['Family'],
            network: element.data()['Network'],
            type: element.data()['Type'],
            utility: element.data()['Utility'],
            color: element.data()['Color'],
            display: element.data()['Display'],
            graphics: element.data()['Graphics'],
            memory: element.data()['Memory'],
            os: element.data()['Operating System'],
            processor: element.data()['Processor'],
            series: element.data()['Series'],
            storage: element.data()['Storage'],
            toner: element.data()['Toner'],
            warranty: element.data()['Warranty'] ?? 'Not Applicable',
          );
          feeatured.add(product);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return feeatured;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///Arabic Database Controllers
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  int _arOrderFormStep = 0;
  int get arOrderFormStep => _arOrderFormStep;

  final TextEditingController _arGeneralHardwareSearchController = TextEditingController();
  TextEditingController get arGeneralHardwareSearchController => _arGeneralHardwareSearchController;

  final TextEditingController _arPrinterSearchController = TextEditingController();
  TextEditingController get arPrinterSearchController => _arPrinterSearchController;
  final List<ProductModel> _arPrintersList = [];
  List<ProductModel> get arPrintersList => _arPrintersList;

  final TextEditingController _arNotebookSearchController = TextEditingController();
  TextEditingController get arNotebookSearchController => _arNotebookSearchController;
  final List<ProductModel> _arNotebooksList = [];
  List<ProductModel> get arNotebooksList => _arNotebooksList;

  String? _arHardwareFilterSelection;
  String? get arHardwareFilterSelection => _arHardwareFilterSelection;

  String? _arPrinterFilterSelection;
  String? get arPrinterFilterSelection => _arPrinterFilterSelection;

  String? _arNotebookFilterSelection;
  String? get arNotebookFilterSelection => _arNotebookFilterSelection;

  DocumentSnapshot? _arLastDocument;
  DocumentSnapshot? _arLastNBDocument;

  void arChangeFormStep(int index) {
    _arOrderFormStep = index;
    notifyListeners();
  }

  void arSetHardwareFilter(String? selection) {
    _arHardwareFilterSelection = selection;
    notifyListeners();
  }

  void arSetFilter(String? selection) {
    _arPrinterFilterSelection = selection;
    notifyListeners();
  }

  void arSetNBFilter(String? selection) {
    _arNotebookFilterSelection = selection;
    notifyListeners();
  }

  void arSetGeneralSearchController(String value) {
    _arGeneralHardwareSearchController.text = value;
    notifyListeners();
  }

  void arSetNBSearchController(String value) {
    _arNotebookSearchController.text = value;
    notifyListeners();
  }

  void arSetPrinterSearchController(String value) {
    _arPrinterSearchController.text = value;
    notifyListeners();
  }

  Future<List<ProductModel>> arSearchInventory() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection(_arHardwareFilterSelection.toString());
    final query = _arPrinterSearchController.text.toLowerCase();
    final snapshot = await db.where('الموديل', isGreaterThanOrEqualTo: query).get();
    for (final element in snapshot.docs) {
      final product = ProductModel(
          category: _arHardwareFilterSelection.toString(),
          id: element.id,
          title: element.data()['العنوان'],
          brand: element.data()['الماركة'],
          cost: element.data()['التكلفة'],
          maxDiscounted: element.data()['سعر الخصم'],
          model: element.data()['الموديل'],
          snapshot: element.data()['الصورة'],
          price: element.data()['سعر البيع']);
      if (product.model!.toLowerCase().contains(query)) {
        results.add(product);
      }
    }
    return results;
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
        if (!_printersList.any((p) => p.id == printer.id)) {
          _printersList.add(printer);
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

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<void> arGetNotebooks() async {
    try {
      final db = FirebaseFirestore.instance.collection('الحواسب المحمولة');
      Query<Map<String, dynamic>> query = db.orderBy(FieldPath.documentId).limit(5);

      if (_arLastNBDocument != null) {
        query = query.startAfterDocument(_arLastNBDocument!);
      }

      final snapshot = await query.get();
      if (_arLastNBDocument == null) {
        _notebooksList.clear();
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

  Future<List<ProductModel>> arGetFeaturedProducts() async {
    final List<ProductModel> feeatured = [];
    try {
      final db = await FirebaseFirestore.instance.collection('الفهرس').get();
      for (final category in db.docs) {
        final subcat = FirebaseFirestore.instance.collection(category.id);
        final entry = await subcat.where('عرض', isEqualTo: true).get();
        for (final element in entry.docs) {
          final product = ProductModel(
            category: category.id,
            id: element.id,
            title: element.data()['العنوان'],
            brand: element.data()['الماركة'],
            cost: element.data()['التكلفة'],
            maxDiscounted: element.data()['سعر الخصم'],
            model: element.data()['المزديل'],
            snapshot: element.data()['الصورة'],
            price: element.data()['سعر البيع'],
            /////////////////////////////////////////////////////////
            ///Variable Data Based On Fetched Product Type
            /////////////////////////////////////////////////////////
            ppm: element.data()['السرعة'],
            family: element.data()['العائلة'],
            network: element.data()['الشبكة'],
            type: element.data()['النوع'],
            utility: element.data()['الاستخدام'],
            color: element.data()['الالوان'],
            display: element.data()['العرض'],
            graphics: element.data()['الرسومات'],
            memory: element.data()['الذاكرة'],
            os: element.data()['نظام التشغيل'],
            processor: element.data()['المعالج'],
            series: element.data()['السلسلة'],
            storage: element.data()['التخزين'],
            toner: element.data()['الاحبار'],
            warranty: element.data()['الضمان'] ?? 'لا يوجد',
          );
          feeatured.add(product);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return feeatured;
  }

  Future<void> bulkPush() async {
    final Map data = {
      "N014O7010MTPEMEA_VP": {
        "Brand": "dell",
        "Cost": 2370,
        "Featured": false,
        "Graphics": "Integrated Intel® Graphics",
        "Max Discounted Price": 2310,
        "Memory": "8 GB - DDR4",
        "Model": "optiplex 7010",
        "Operating System": "DOS",
        "Processor": "13th Gen Intel® Core™ i7-13700",
        "Selling Price": 2450,
        "Series": "OptiPlex",
        "Snapshot":
            "https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FDesktops%2FDell%2Fdell-7010.webp?alt=media&token=ff54a1f5-9933-4651-9176-e65376a5ae8a",
        "Stock": 10,
        "Storage": "512 GB SSD",
        "Title": "Dell OpitPlex 7010 Small Form Factor vPro",
        "Warranty": "1 Year Limited Warranty"
      },
      "OPTI–7000–I7": {
        "Brand": "dell",
        "Cost": 2270,
        "Featured": false,
        "Graphics": "Integrated Intel® UHD Graphics",
        "Max Discounted Price": 2385,
        "Memory": "8 GB - DDR4",
        "Model": "optiplex 7000",
        "Operating System": "DOS",
        "Processor": "12th Gen Intel® Core™ i7-12700",
        "Selling Price": 2500,
        "Series": "Optiplex",
        "Snapshot":
            "https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FDesktops%2FDell%2Fdell-7000.webp?alt=media&token=6e27e8c6-9a8f-464c-ba8a-8878dc234e49",
        "Stock": 12,
        "Storage": "512GB SSD",
        "Title": "Dell OptiPlex 7000 Small Form Factor",
        "Warranty": "N/A"
      },
      "N011O7000MT_AC_EM_VP": {
        "Brand": "dell",
        "Cost": 2270,
        "Featured": false,
        "Graphics": "Integrated Intel® UHD Graphics",
        "Max Discounted Price": 2385,
        "Memory": "8 GB - DDR4",
        "Model": "optiplex 7000",
        "Operating System": "DOS",
        "Processor": "12th Gen Intel® Core™ i7-12700",
        "Selling Price": 2500,
        "Series": "Optiplex",
        "Snapshot":
            "https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FDesktops%2FDell%2Fdell-mt-7000.webp?alt=media&token=64694194-c851-4dfd-a040-855f604b5ad5",
        "Stock": 14,
        "Storage": "512GB SSD",
        "Title": "Dell OptiPlex 7000 Micro Tower",
        "Warranty": "N/A"
      },
      "N7305VDT3910EMEA01": {
        "Brand": "dell",
        "Cost": 2100,
        "Featured": true,
        "Graphics": "Integrated Intel® UHD Graphics",
        "Max Discounted Price": 2205,
        "Memory": "8 GB - DDR4",
        "Model": "vostro 3910",
        "Operating System": "DOS",
        "Processor": "12th Gen Intel® Core™ i7-12700",
        "Selling Price": 2640,
        "Series": "Vostro",
        "Snapshot":
            "https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FDesktops%2FDell%2Fdell%20vostro%203910.png?alt=media&token=c4f59ab7-658c-4b60-a56d-98becc6e2f4c",
        "Stock": 14,
        "Storage": "512 GB SSD",
        "Title": "Dell Vostro Tower 3910 ",
        "Warranty": "N/A"
      },
      "41024400": {
        "Brand": "dell",
        "Cost": 1700,
        "Featured": false,
        "Graphics": "Integrated Intel® UHD Graphics",
        "Max Discounted Price": 1785,
        "Memory": "8 GB - DDR4",
        "Model": "optiplex 3000",
        "Operating System": "DOS",
        "Processor": "12th Gen Intel® Core™ i5-12500",
        "Selling Price": 1870,
        "Series": "OptiPlex",
        "Snapshot":
            "https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FDesktops%2FDell%2Fdell-opt-3000.webp?alt=media&token=5079268b-f709-475b-9dee-0a8250b0173f",
        "Stock": 8,
        "Storage": "512 GB SSD",
        "Title": "Dell OptiPlex 3000",
        "Warranty": "1 Year Limited Warranty"
      },
      "41024399": {
        "Brand": "dell",
        "Cost": 1520,
        "Featured": true,
        "Graphics": "Integrated Intel® UHD Graphics",
        "Max Discounted Price": 1600,
        "Memory": "4 GB - DDR4",
        "Model": "optiplex 3000",
        "Operating System": "DOS",
        "Processor": "12th Gen Intel® Core™ i5-12500",
        "Selling Price": 1675,
        "Series": "OptiPlex",
        "Snapshot":
            "https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FDesktops%2FDell%2Fdell-opt-3000.webp?alt=media&token=5079268b-f709-475b-9dee-0a8250b0173f",
        "Stock": 8,
        "Storage": "256 GB SSD",
        "Title": "Dell OptiPlex 3000",
        "Warranty": "N/A"
      },
    };

    CollectionReference collection = FirebaseFirestore.instance.collection('Desktops');
    WriteBatch batch = FirebaseFirestore.instance.batch();
    data.forEach((customId, printerData) {
      DocumentReference docRef = collection.doc(customId);

      // Set the data if the document doesn't exist, otherwise use update
      batch.set(docRef, printerData, SetOptions(merge: true));
    });
    try {
      await batch.commit();
      print("Bulk push completed successfully.");
    } catch (e) {
      print("Error during bulk push: $e");
    }
  }
}
