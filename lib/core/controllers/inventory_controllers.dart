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

  String? _hardwareFilterSelection;
  String? get hardwareFilterSelection => _hardwareFilterSelection;

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

  void setGeneralSearchController(String value) {
    _generalHardwareSearchController.text = value;
    notifyListeners();
  }

  void searchType() {
    _searchByBrand = !_searchByBrand;
    notifyListeners();
  }

  Future<List<ProductModel>> searchInventory() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection(_hardwareFilterSelection.toString());
    final query = _generalHardwareSearchController.text.toLowerCase();
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

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<void> loadMoreItems(dynamic function) async {
    try {
      await function;
    } catch (e) {
      if (kDebugMode) {
        print("Error retrieving data: $e");
      }
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

  String? _arHardwareFilterSelection;
  String? get arHardwareFilterSelection => _arHardwareFilterSelection;

  void arChangeFormStep(int index) {
    _arOrderFormStep = index;
    notifyListeners();
  }

  void arSetHardwareFilter(String? selection) {
    _arHardwareFilterSelection = selection;
    notifyListeners();
  }

  void arSetGeneralSearchController(String value) {
    _arGeneralHardwareSearchController.text = value;
    notifyListeners();
  }

  Future<List<ProductModel>> arSearchInventory() async {
    final List<ProductModel> results = [];
    final db = FirebaseFirestore.instance.collection(_arHardwareFilterSelection.toString());
    final query = _arGeneralHardwareSearchController.text.toLowerCase();
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

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
            model: element.data()['الموديل'],
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
        "الماركة": "dell",
        "التكلفة": 2370,
        "عرض": false,
        "الرسومات": "Intel® UHD Graphics مدمج",
        "سعر الخصم": 2310,
        "الذاكرة": "8 GB - DDR4",
        "الموديل": "optiplex 7010",
        "نظام التشغيل": "DOS",
        "المعالج": "13th Gen Intel® Core™ i7-13700",
        "سعر البيع": 2450,
        "السلسلة": "OptiPlex",
        "الصورة":
            "https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FDesktops%2FDell%2Fdell-7010.webp?alt=media&token=ff54a1f5-9933-4651-9176-e65376a5ae8a",
        "المخزون": 10,
        "التخزين": "512 GB SSD",
        "العنوان": "Dell OpitPlex 7010 Small Form Factor vPro",
        "الضمان": "ضمان الوكيل المحدود لمدة 1 سنة"
      },
      "OPTI–7000–I7": {
        "الماركة": "dell",
        "التكلفة": 2270,
        "عرض": false,
        "الرسومات": "Intel® UHD Graphics مدمج",
        "سعر الخصم": 2385,
        "الذاكرة": "8 GB - DDR4",
        "الموديل": "optiplex 7000",
        "نظام التشغيل": "DOS",
        "المعالج": "12th Gen Intel® Core™ i7-12700",
        "سعر البيع": 2500,
        "السلسلة": "Optiplex",
        "الصورة":
            "https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FDesktops%2FDell%2Fdell-7000.webp?alt=media&token=6e27e8c6-9a8f-464c-ba8a-8878dc234e49",
        "المخزون": 12,
        "التخزين": "512GB SSD",
        "العنوان": "Dell OptiPlex 7000 Small Form Factor",
        "الضمان": "لا يوجد"
      },
      "N011O7000MT_AC_EM_VP": {
        "الماركة": "dell",
        "التكلفة": 2270,
        "عرض": false,
        "الرسومات": "Intel® UHD Graphics مدمج",
        "سعر الخصم": 2385,
        "الذاكرة": "8 GB - DDR4",
        "الموديل": "optiplex 7000",
        "نظام التشغيل": "DOS",
        "المعالج": "12th Gen Intel® Core™ i7-12700",
        "سعر البيع": 2500,
        "السلسلة": "Optiplex",
        "الصورة":
            "https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FDesktops%2FDell%2Fdell-mt-7000.webp?alt=media&token=64694194-c851-4dfd-a040-855f604b5ad5",
        "المخزون": 14,
        "التخزين": "512GB SSD",
        "العنوان": "Dell OptiPlex 7000 Micro Tower",
        "الضمان": "لا يوجد"
      },
      "N7305VDT3910EMEA01": {
        "الماركة": "dell",
        "التكلفة": 2100,
        "عرض": true,
        "الرسومات": "Intel® UHD Graphics مدمج",
        "سعر الخصم": 2205,
        "الذاكرة": "8 GB - DDR4",
        "الموديل": "vostro 3910",
        "نظام التشغيل": "DOS",
        "المعالج": "12th Gen Intel® Core™ i7-12700",
        "سعر البيع": 2640,
        "السلسلة": "Vostro",
        "الصورة":
            "https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FDesktops%2FDell%2Fdell%20vostro%203910.png?alt=media&token=c4f59ab7-658c-4b60-a56d-98becc6e2f4c",
        "المخزون": 14,
        "التخزين": "512 GB SSD",
        "العنوان": "Dell Vostro Tower 3910 ",
        "الضمان": "لا يوجد"
      },
      "41024400": {
        "الماركة": "dell",
        "التكلفة": 1700,
        "عرض": false,
        "الرسومات": "Intel® UHD Graphics مدمج",
        "سعر الخصم": 1785,
        "الذاكرة": "8 GB - DDR4",
        "الموديل": "optiplex 3000",
        "نظام التشغيل": "DOS",
        "المعالج": "12th Gen Intel® Core™ i5-12500",
        "سعر البيع": 1870,
        "السلسلة": "OptiPlex",
        "الصورة":
            "https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FDesktops%2FDell%2Fdell-opt-3000.webp?alt=media&token=5079268b-f709-475b-9dee-0a8250b0173f",
        "المخزون": 8,
        "التخزين": "512 GB SSD",
        "العنوان": "Dell OptiPlex 3000",
        "الضمان": "ضمان الوكيل المحدود لمدة 1 سنة"
      },
      "41024399": {
        "الماركة": "dell",
        "التكلفة": 1520,
        "عرض": true,
        "الرسومات": "Intel® UHD Graphics مدمج",
        "سعر الخصم": 1600,
        "الذاكرة": "4 GB - DDR4",
        "الموديل": "optiplex 3000",
        "نظام التشغيل": "DOS",
        "المعالج": "12th Gen Intel® Core™ i5-12500",
        "سعر البيع": 1675,
        "السلسلة": "OptiPlex",
        "الصورة":
            "https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Products%2FDesktops%2FDell%2Fdell-opt-3000.webp?alt=media&token=5079268b-f709-475b-9dee-0a8250b0173f",
        "المخزون": 8,
        "التخزين": "256 GB SSD",
        "العنوان": "Dell OptiPlex 3000",
        "الضمان": "لا يوجد"
      },
    };

    CollectionReference collection = FirebaseFirestore.instance.collection('الحواسب المكتبية');
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
