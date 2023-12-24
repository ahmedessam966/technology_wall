// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import '../core/controllers/app_controllers.dart';

class TitleObserver extends NavigatorObserver {
  final AppControllers appControllers;

  TitleObserver(this.appControllers);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateTitle(route.settings.name);
      updateJsonKeywordMap();
    });
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateTitle(previousRoute?.settings.name);
      updateJsonKeywordMap();
    });
  }

  void updateTitle(String? routeName) {
    if (routeName != null) {
      List<String> pathSegments = routeName.split('/');
      String pageTitle = '';
      if (pathSegments.isEmpty || pathSegments.last == 'en' || pathSegments.last == 'ar') {
        pageTitle = 'Home';
      } else {
        pageTitle = pathSegments.last;
      }
      pageTitle = capitalize(pageTitle);
      appControllers.changePage(pageTitle);
    }
  }

  String capitalize(String s) {
    return s.isNotEmpty ? s[0].toUpperCase() + s.substring(1) : '';
  }

  static void updateJsonKeywordMap() {
    String currentPageUrl = window.location.href;
    String currentPageTitle = document.title;
    String jsonLdData = '''''';

    switch (currentPageUrl) {
      case 'https://techwall.com.sa':
        jsonLdData = '''
    {
      "@context": "https://schema.org",
      "@type": "WebPage",
      "name": "$currentPageTitle",
      "keywords": ["HCC ME","HCC","IT solutions","SAP","Sage ERP","retail hardware","HP","Dell","Apple","Canon","SAP Business One","HP Printers","HP Laptops","HP Desktop","HP Server","HP Scanners","HP Notebooks","HP All-In-One","MacBook","Zoho CRM","Zoho Books","Zoho ERP","Dell Desktop","Dell Notebooks","Dell Laptops","Dell Desktop","Dell Optiplex","Dell Servers","Dell PowerEdge","Intel Core","network","سور","سور التكنولوجيا","sap tech wall","sap techwall", "sap technology wall", "tech wall dell", "كومبيوتر", "شبكات", "سرفر", "كاميرات مراقبة","cctv","cameras","surveillance","خوادم","خادم"],
      "alternateName": "tech-wall",
      "url" : "$currentPageUrl",
      "email": "info@techwall.com.sa",
      "memberOf":{"@type":"Organization", "name":"HCC Middle East","url":"https://hcc-me.com"},
      "subOrganization":{"@type":"Organization", "name":"Prorays"},
      "location": [{"@type":"Place","name":"Riyadh, Saudi Arabia"},{"@type":"Place","name":"Medina, Saudi Arabia"},{"@type":"Place","name":"Dubai, United Arab Emirates"}],
      "description": "An HCC Middle East Extended Business Member, Technology Wall is an IT integrated solutions provider supporting SAP and Sage ERP Solutions. Offering retail hardware services for HP, Dell, Apple, Canon, and much more.",
      "sponsor":{"@type": "Organization","name": "HCC ME","url": "https://www.hcc-me.com/"},
      "contactPoint" : [{"@type" : "ContactPoint","telephone" : "+966542575808","contactType" : "Pre-Sales"}],
      "brand": [{"@type": "Brand","name": "SAP Business One"},{"@type": "Brand","name": "Cisco"}, {"@type": "Brand","name": "GrandStream"},{"@type": "Brand","name": "Hik-Vision"},{"@type": "Brand","name": "TP-Link"},{"@type": "Brand","name": "D-Link"},{"@type": "Brand","name": "Canon"},{"@type": "Brand","name": "Sage ERP"},{"@type": "Brand","name": "Dell Notebooks"},{"@type": "Brand","name": "HP Notebooks"}]
    }
  ''';

        break;
      ////////////////////////////////////////////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////////////////////////////////////////////
      case 'https://techwall.com.sa/hardware':
        jsonLdData = '''
          {
            "@context": "https://schema.org",
            "@type": "WebPage",
            "name": "$currentPageTitle",
            "alternateName":"Hardware Page",
            "url": "$currentPageUrl",
            "mainEntityOfPage": {
              "@type": "WebSite",
              "url": "https://techwall.com.sa"
            },
            "description": "Technology Wall Hardware Main Page. All the digital inventory needed can be explored here. Computers, laptops, servers, routers, switches, printers, scanners, and firewalls.",
            "keywords":["printers","desktop pc","laptop","scanner","server","firewall","ups","notebook","hp computer","hp laptop","dell computers","hp server","hp workstation","dell server","dell poweredge","hp printer","hp all-in-one","canon printer","canon scanner", "fortinet","fortigate","inspiron","envy","macbook","vostro","latitude"]
          }
        ''';
        break;
    }

    final jsonLdScript = querySelector('#json-ld-map');
    if (jsonLdScript != null) {
      jsonLdScript.innerHtml = jsonLdData;
    }
  }
}
