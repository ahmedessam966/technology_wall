// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

class MetadataControllers {
  void updateMetaData(String title, String content) {
    html.document.head!.children.removeWhere((element) => element is html.MetaElement);
    html.document.body!.children.removeWhere((element) => element is html.HeadingElement);
    html.document.body?.append(html.HeadingElement.h1()
      ..title = title
      ..hidden = true);
    html.document.head?.append(html.MetaElement()
      ..name = 'description'
      ..title = title
      ..content = content);

    html.document.head!.append(html.MetaElement()
      ..name = 'viewport'
      ..content = 'width=device-width, initial-scale=1');
  }

  void updateHeaderMetaData() {
    html.document.body!.children.removeWhere((element) => element == html.Element.header());
    final headerElement = html.Element.header()
      ..children = [
        html.Element.div()
          ..children = [
            html.Element.nav()
              ..id = 'web-navbar'
              ..lang = 'en'
              ..children = [
                html.AnchorElement()
                  ..href = 'https://techwall.com.sa/en'
                  ..title = 'Homepage URL',
                html.AnchorElement()
                  ..href = 'https://techwall.com.sa/en/hardware'
                  ..title = 'Hardware URL',
                html.AnchorElement()
                  ..href = 'https://techwall.com.sa/en/software'
                  ..title = 'Software URL',
                html.AnchorElement()
                  ..href = 'https://techwall.com.sa/en/sap'
                  ..title = 'SAP ERP URL',
                html.AnchorElement()
                  ..href = 'https://techwall.com.sa/en/about'
                  ..title = 'About URL',
                html.AnchorElement()
                  ..href = 'https://techwall.com.sa/en/contact-us'
                  ..title = 'Contact Us URL',
                html.ButtonElement()
                  ..value = 'portal_login'
                  ..name = 'portal_button'
                  ..title = 'Contact Us URL',
              ]
          ]
      ];
    html.document.body!.append(headerElement);
  }
}
