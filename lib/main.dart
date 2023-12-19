import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/routing_transition_services.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'package:easy_localization/easy_localization.dart';
import 'controller_index.dart';
import 'pages_index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WebViewPlatform.instance = WebWebViewPlatform();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUrlStrategy(PathUrlStrategy());
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
      path: 'assets/lang', // <-- change the path of the translation files
      fallbackLocale: const Locale('ar', 'SA'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeNotifier.selectedTheme,
            theme: themeNotifier.selectedTheme == ThemeMode.light
                ? themeConstants.lightTheme
                : themeConstants.darkTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            navigatorObservers: [TitleObserver(context.read<AppControllers>())],
            onGenerateTitle: (context) => context.watch<AppControllers>().pageTitle,
            initialRoute: '/',
            routes: {
              '/': (context) => const HomePage(),
              '/about': (context) => const AboutPage(),
              '/about/accreditation': (context) => const AccreditationPage(),
              '/contact-us': (context) => const ContactPage(),
              '/hardware': (context) => const InventoryPage(),
              '/hardware/cabinets': (context) => const CabinetsPage(),
              '/hardware/cctv': (context) => const CCTVPage(),
              '/hardware/desktops': (context) => const DesktopsPage(),
              '/hardware/firewalls': (context) => const FirewallsPage(),
              '/hardware/notebooks': (context) => const NotebooksPage(),
              '/hardware/printers': (context) => const PrintersPage(),
              '/hardware/routers': (context) => const RoutersPage(),
              '/hardware/scanners': (context) => const ScannersPage(),
              '/hardware/servers': (context) => const ServersPage(),
              '/hardware/switches': (context) => const SwitchesPage(),
              '/hardware/ups': (context) => const UPSPage(),
              '/portal': (context) => const CustomerPortal(),
              '/software': (context) => const SoftwarePage(),
              '/software/fortinet': (context) => const FortinetSoftwarePage(),
              '/software/microsoft': (context) => const MicrosoftSoftwarePage(),
              '/software/sap': (context) => const SAPPage(),
              '/software/sage': (context) => const SagePage(),
              '/software/tally': (context) => const TallyPage(),
              '/software/zoho': (context) => const ZohoPage(),
              '/privacy': (context) => const PrivacyPolicyPage(),
              '/not-found': (context) => const NotFoundPage(),
            },
            onGenerateRoute: (settings) {
              TitleObserver.updateJsonKeywordMap();
              return MaterialPageRoute(
                builder: (context) => RoutingTransitionServices.generateRoute(settings),
              );
            },
          );
        },
      ),
    );
  }
}
