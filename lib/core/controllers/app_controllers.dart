import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:technology_wall/config/themes/app_theme.dart';

class AppControllers extends ChangeNotifier {
  String _pageTitle = 'Technology Wall | Home';
  String get pageTitle => _pageTitle;

  bool _isHovered = false;
  bool get isHovered => _isHovered;

  bool _isEnglish = true;
  bool get isEnglish => _isEnglish;

  void changeLocale(bool isEnglish) {
    _isEnglish = isEnglish;
    notifyListeners();
  }

  void changePage(String page) async {
    if (page == 'Sap') {
      _pageTitle = 'Technology Wall | SAP';
    } else if (page == 'Contact-us') {
      _pageTitle = 'Technology Wall | Contact Us';
    } else {
      _pageTitle = 'Technology Wall | $page';
    }
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

  static Future<void> showAppBanner(BuildContext context, double sh, double sw) async {
    if (kIsWeb && sw < 700) {
      await Flushbar(
        title: 'Technology Wall Mobile App',
        titleColor: Colors.black,
        margin: const EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(10),
        backgroundColor: AppTheme.darkest.withOpacity(0.9),
        messageText: SizedBox(
          height: sh * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/app-store.png',
                width: sw * 0.2,
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                'assets/images/play-store.png',
                width: sw * 0.2,
              ),
            ],
          ),
        ),
        mainButton: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Later'),
        ),
      ).show(context);
    }
  }
}
