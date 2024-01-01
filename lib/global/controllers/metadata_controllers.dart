// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

class MetadataControllers {
  void updateHElement(String h1, String h2, String? h3) {
    html.document.body!.children.removeWhere((element) => element is html.HeadingElement);
    html.document.body?.append(html.HeadingElement.h1()
      ..innerHtml = h1
      ..hidden = true);
    html.document.body?.append(html.HeadingElement.h2()
      ..innerHtml = h2
      ..hidden = true);
    h3 != null
        ? html.document.body?.append(html.HeadingElement.h3()
          ..innerHtml = h3
          ..hidden = true)
        : null;
  }

  void updateMetaData(String title, String content) {
    html.document.head!.children.removeWhere((element) => element is html.MetaElement);
    html.document.head?.append(html.MetaElement()
      ..name = 'description'
      ..title = title
      ..content = content);

    html.document.head!.append(html.MetaElement()
      ..name = 'viewport'
      ..content = 'width=device-width, initial-scale=1');

    html.document.head!.setAttribute('title', title);
  }

  void updateHeaderMetaData() {
    html.document.body!.children.removeWhere((element) => element is html.DivElement);
    final headerElement = html.DivElement()
      ..children = [
        html.Element.header()
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

    final footerElement = html.DivElement()
      ..children = [
        html.Element.footer()
          ..children = [
            html.Element.nav()
              ..id = 'web-footer'
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
    html.document.body!.append(footerElement);
  }

  void injectPageSpecificContent(String paragraph, String lang) {
    html.document.body!.children.removeWhere((element) => element is html.ParagraphElement);

    html.document.body?.append(html.ParagraphElement()
      ..lang = lang
      ..hidden = true
      ..innerHtml = paragraph);
  }

  void injectAllProducts(String lang, List products) {
    html.document.body!.children.removeWhere((element) => element is html.TextAreaElement);
    for (final child in products) {
      html.document.body!.append(html.TextAreaElement()
        ..lang = lang
        ..hidden = true
        ..title = child.title
        ..innerHtml = '${child.title}');
    }
  }

  void injectProductSpecs(String specs, String lang) {
    html.document.body!.children.removeWhere((element) => element is html.SpanElement);
    html.document.body?.append(html.SpanElement()
      ..lang = lang
      ..hidden = true
      ..innerHtml = specs);
  }

  void clearInjectedProduct() {
    html.document.body!.children.removeWhere((element) => element is html.SpanElement);
  }
}
