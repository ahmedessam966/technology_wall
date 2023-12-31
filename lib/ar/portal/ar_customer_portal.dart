import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import '../../core/controllers/metadata_controllers.dart';

class ARCustomerPortal extends StatefulWidget {
  const ARCustomerPortal({super.key});

  @override
  State<ARCustomerPortal> createState() => _ARCustomerPortalState();
}

class _ARCustomerPortalState extends State<ARCustomerPortal> {
  final PlatformWebViewController _controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse(
            'https://books.zoho.com/accounts/signin?_sh=false&hideidp=true&dcc=true&portal=10054731280&client_portal=true&servicename=ZohoBooks&serviceurl=https://books.zoho.com/portal/technologywallforcomputers/index&service_language=en'),
      ),
    );
  final MetadataControllers metadataFunctions = MetadataControllers();
  @override
  void initState() {
    super.initState();
    metadataFunctions.updateMetaData('Technology Wall | بوابة عملاء Zoho',
        'هذه صفحة عملاء Zoho اصحاب التراخيص والمعاملات مع شركة سور التكنولوجيا.');
    metadataFunctions.updateHeaderMetaData();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PopScope(
        canPop: true,
        onPopInvoked: (value) {
          if (value) {
            return;
          } else {
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white54,
          body: sw >= 1280
              ? Center(
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 6, offset: Offset(0, 0))]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/logo1.png',
                              height: 100,
                            ),
                          ),
                          const Divider(),
                          Center(
                            child: Text(
                              'تسجيل الدخول',
                              style: context.titleMedium,
                            ),
                          ),
                          Center(
                            child: Text(
                              'عرض وإدارة معاملاتك مع سور التكنولوجيا',
                              style: context.displayMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 320,
                            child: PlatformWebViewWidget(
                              PlatformWebViewWidgetCreationParams(controller: _controller),
                            ).build(context),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ليس لديك حساب؟',
                                style: context.displayLarge,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                onPressed: () {
                                  html.window.open(
                                      'https://books.zoho.com/portal/technologywallforcomputers/signup#/send-invite',
                                      '_blank');
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'تسجيل',
                                      style: context.displayLarge?.copyWith(color: Colors.blue.shade700),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_sharp,
                                      color: Colors.blue.shade700,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                html.window.open(
                                    'https://books.zoho.com/portal/technologywallforcomputers/forgetpassword',
                                    '_blank');
                              },
                              child: Text(
                                'نسيت كلمة المرور؟',
                                style: context.displayLarge?.copyWith(color: Colors.blue.shade700),
                              ),
                            ),
                          ),
                        ]),
                  ),
                )
              : sw < 1280 && sw >= 768
                  ? const SizedBox()
                  : const SizedBox(),
        ),
      ),
    );
  }
}
