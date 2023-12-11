import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppControllers extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  String _pageTitle = 'Home';
  String get pageTitle => _pageTitle;

  bool _isHovered = false;
  bool get isHovered => _isHovered;

  final GlobalKey<ScaffoldState> _nonWebScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get nonWebScaffoldKey => _nonWebScaffoldKey;

  void drawerController() {
    if (_nonWebScaffoldKey.currentState!.isDrawerOpen) {
      _nonWebScaffoldKey.currentState?.closeDrawer();
      notifyListeners();
    } else {
      _nonWebScaffoldKey.currentState?.openDrawer();
      notifyListeners();
    }
  }

  void changePage(int index, String page) {
    _pageIndex = index;
    _pageTitle = page;
    notifyListeners();
  }

  void showSubMenu() {
    _isHovered = !_isHovered;
    notifyListeners();
  }

  static String hindiNumeralConverter(String origin) {
    final template = NumberFormat('hi_IN');
    return template.format(origin);
  }

  // static Future<int> sendEmail(String name, String subject, String body, String email, String phone) async {
  //   Map<String, dynamic> templateParams = {
  //     'to_name': name,
  //     'topic': subject,
  //     'message': body,
  //     'to_email': email,
  //     'phone': phone
  //   };

  //   try {
  //     await EmailJS.send(
  //       'service_bgk8ypf',
  //       'template_2dg6eft',
  //       templateParams,
  //       const Options(
  //         publicKey: 'cuMpj4ocv-pxCqyvM',
  //         privateKey: 'Zl4tblay6B7U9O51XwnZ7',
  //       ),
  //     );
  //     return 200;
  //   } catch (error) {
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //     return 400;
  //   }
  // }

  Future<List<String>> getClientThumbs() async {
    final List<String> thumbs = [];
    final db = FirebaseStorage.instance.ref('Clients');
    final results = await db.listAll();
    for (final element in results.items) {
      final String path = await element.getDownloadURL();
      thumbs.add(path);
    }
    return thumbs;
  }
}
