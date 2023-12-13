import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppControllers extends ChangeNotifier {
  String _pageTitle = 'Technology Wall | Home';
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

  void changePage(String page) async {
    _pageTitle = 'Technology Wall | $page';
    notifyListeners();
  }

  void showSubMenu() {
    _isHovered = !_isHovered;
    notifyListeners();
  }

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
