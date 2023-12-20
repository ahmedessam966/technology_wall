import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/routing_maps.dart';
import 'package:technology_wall/config/routing_transition_services.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'en/controller_index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/firebase_options.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WebViewPlatform.instance = WebWebViewPlatform();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Future.delayed(const Duration(seconds: 1));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return Semantics(
      label:
          'Technology Wall, a leading IT company based in Riyadh, KSA. Offering integrated, smart, and digitized solutions',
      value:
          "tech-wall, tech-wall.me, techwall.me, techwall, techwallme, techwall co., tech-wall co., SAP Business One, SAP, Tally ERP, ERP, erp, tally, sap, sap business one, sage, Sage, Sage ERP, sage erp, s4/hana, sap4, sap4/hana, s4hana, s4hana erp, hp, dell, canon, hp printers, dell printers, hp servers, dell servers, dell pc, hp pc, dell laptop, dell notebook, hp notebook,contact us",
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppControllers()),
          ChangeNotifierProvider(create: (_) => AuthControllers()),
          ChangeNotifierProvider(create: (_) => AppTheme()),
          ChangeNotifierProvider(create: (_) => ThemeModeServices()),
          ChangeNotifierProvider(create: (_) => InventoryControllers()),
          ChangeNotifierProvider(create: (_) => HomePageControllers()),
          ChangeNotifierProvider(create: (_) => CartControllers()),
          ChangeNotifierProvider(create: (_) => SAPPageControllers()),
        ],
        builder: (context, _) {
          final themeNotifier = context.watch<ThemeModeServices>();
          final themeConstants = context.watch<AppTheme>();
          final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

          return ResponsiveSizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              title: context.watch<AppControllers>().pageTitle,
              navigatorKey: navigatorKey,
              scaffoldMessengerKey: scaffoldKey,
              debugShowCheckedModeBanner: false,
              themeMode: themeNotifier.selectedTheme,
              theme: themeNotifier.selectedTheme == ThemeMode.light
                  ? themeConstants.lightTheme
                  : themeConstants.darkTheme,
              navigatorObservers: [TitleObserver(context.read<AppControllers>())],
              onGenerateTitle: (context) => context.watch<AppControllers>().pageTitle,
              initialRoute: '/en',
              routes: RoutingMaps.routingMap,
              onGenerateRoute: (settings) {
                TitleObserver.updateJsonKeywordMap();
                return MaterialPageRoute(
                  builder: (context) => RoutingTransitionServices.generateRoute(settings),
                );
              },
            );
          });
        },
      ),
    );
  }
}
