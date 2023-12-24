import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';

import '../../../config/cookie_jars.dart';

class CookieConsentPopup extends StatelessWidget {
  const CookieConsentPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Cookie Consent'),
      content: const Text('This website uses cookies to ensure you get the best experience.'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            CookieManager.cookieJar.saveFromResponse(Uri.parse('https://techwall.com.sa'), [
              Cookie('cart', 'empty'),
            ]);
          },
          child: const Text('Accept'),
        ),
      ],
    );
  }
}
