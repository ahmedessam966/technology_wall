import 'package:flutter/material.dart';

import '../core/controllers/app_controllers.dart';

class TitleObserver extends NavigatorObserver {
  final AppControllers appControllers;

  TitleObserver(this.appControllers);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    updateTitle(route.settings.name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    updateTitle(previousRoute?.settings.name);
  }

  void updateTitle(String? routeName) {
    if (routeName != null) {
      List<String> pathSegments = routeName.split('/');
      String pageTitle = pathSegments.isNotEmpty ? pathSegments.last : 'Home';
      pageTitle = capitalize(pageTitle);
      appControllers.changePage(pageTitle);
    }
  }

  String capitalize(String s) {
    return s.isNotEmpty ? s[0].toUpperCase() + s.substring(1) : '';
  }
}
