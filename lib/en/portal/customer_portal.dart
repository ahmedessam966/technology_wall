import 'package:flutter/material.dart';
import 'package:technology_wall/config/themes/text_varaiants.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class CustomerPortal extends StatefulWidget {
  const CustomerPortal({super.key});

  @override
  State<CustomerPortal> createState() => _CustomerPortalState();
}

class _CustomerPortalState extends State<CustomerPortal> {
  final PlatformWebViewController _controller = PlatformWebViewController(
    const PlatformWebViewControllerCreationParams(),
  )..loadRequest(
      LoadRequestParams(
        uri: Uri.parse(
            'https://books.zoho.com/accounts/signin?_sh=false&hideidp=true&dcc=true&portal=10054731280&client_portal=true&servicename=ZohoBooks&serviceurl=https://books.zoho.com/portal/technologywallforcomputers/index&service_language=en'),
      ),
    );

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    return PopScope(
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
        body: sw >= 1080
            ? Center(
                child: Container(
                  width: 500.h,
                  padding: EdgeInsets.all(20.px),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 6, offset: Offset(0, 0))]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/logo1.webp',
                            height: 20.h,
                          ),
                        ),
                        const Divider(),
                        Center(
                          child: Text(
                            'Sign In',
                            style: context.headlineMedium,
                          ),
                        ),
                        Center(
                          child: Text(
                            'View and manage your transactions with Technology Wall',
                            style: context.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                          child: PlatformWebViewWidget(
                            PlatformWebViewWidgetCreationParams(controller: _controller),
                          ).build(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: context.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.resolveWith(
                                    (states) => states.contains(MaterialState.hovered)
                                        ? LinearBorder.bottom(
                                            side: const BorderSide(color: Colors.blue),
                                          )
                                        : null),
                                overlayColor: MaterialStateProperty.resolveWith((states) =>
                                    states.contains(MaterialState.hovered) ? Colors.grey.shade200 : null),
                              ),
                              onPressed: () {
                                html.window.open(
                                    'https://books.zoho.com/portal/technologywallforcomputers/signup#/send-invite',
                                    '_blank');
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Sign Up',
                                    style: context.bodyLarge?.copyWith(color: Colors.blue.shade700),
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_sharp,
                                    color: Colors.blue.shade700,
                                    size: 20.px,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.resolveWith(
                                  (states) => states.contains(MaterialState.hovered)
                                      ? LinearBorder.bottom(
                                          side: const BorderSide(color: Colors.blue),
                                        )
                                      : null),
                              overlayColor: MaterialStateProperty.resolveWith((states) =>
                                  states.contains(MaterialState.hovered) ? Colors.grey.shade200 : null),
                            ),
                            onPressed: () {
                              html.window.open(
                                  'https://books.zoho.com/portal/technologywallforcomputers/forgetpassword',
                                  '_blank');
                            },
                            child: Text(
                              'Forgot Password?',
                              style: context.bodyLarge?.copyWith(color: Colors.blue.shade700),
                            ),
                          ),
                        ),
                      ]),
                ),
              )
            : sw < 1080 && sw >= 568
                ? const SizedBox()
                : const SizedBox(),
      ),
    );
  }
}
