// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;

class MetadataControllers {
  void updateMainMetaData() {
    html.document.head?.append(html.MetaElement()
      ..name = 'description'
      ..content =
          'عضو أعمال موسع في HCC الشرق الأوسط. شركة رائدة في مجال الحلول الرقمية المتكاملة ومقرها الرياض، المملكة العربية السعودية. أجهزة البيع بالتجزئة • حلول البرمجيات | An HCC Middle East Extended Business Memeber. Pioneering digital integrated solutions company based in Riyadh, KSA. Retail Hardware • Software Solutions');

    html.document.head!.append(html.MetaElement()
      ..name = 'viewport'
      ..content = 'width=device-width, initial-scale=1');

    html.document.head!.append(html.MetaElement()
      ..httpEquiv = 'X-UA-Compatible'
      ..content = 'IE=Edge');

    html.document.head!.append(html.MetaElement()
      ..name = 'robots'
      ..content = 'index,follow');

    html.document.head!.append(html.MetaElement()
      ..name = 'og:type'
      ..content = 'website');

    html.document.head!.append(html.MetaElement()
      ..name = 'og:site_name'
      ..content = 'Technology Wall');

    html.document.head!.append(html.MetaElement()
      ..name = 'og:title'
      ..content = 'Technology Wall | Smart Digital Solutions');

    html.document.head!.append(html.MetaElement()
      ..name = 'og:description'
      ..content =
          'عضو أعمال موسع في HCC الشرق الأوسط. شركة رائدة في مجال الحلول الرقمية المتكاملة ومقرها الرياض، المملكة العربية السعودية. أجهزة البيع بالتجزئة • حلول البرمجيات | An HCC Middle East Extended Business Memeber. Pioneering digital integrated solutions company based in Riyadh, KSA. Retail Hardware • Software Solutions');

    html.document.head!.append(html.MetaElement()
      ..name = 'og:image'
      ..content =
          'https://firebasestorage.googleapis.com/v0/b/technology-wall-web.appspot.com/o/Site%20Assets%2Flogo1.png?alt=media&token=3d7475f5-4344-428b-a28b-e2abc0d4998f');
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
        ..innerHtml = '${child.brand} ${child.title} (${child.model})');
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
