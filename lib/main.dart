import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/core/controllers/inventory_controllers.dart';
import 'package:technology_wall/pages_index.dart';

import 'config/themes/app_theme.dart';
import 'config/themes/theme_mode_services.dart';
import 'core/controllers/app_controllers.dart';
import 'core/controllers/auth_controllers.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppControllers()),
        ChangeNotifierProvider(create: (_) => AuthControllers()),
        ChangeNotifierProvider(create: (_) => AppTheme()),
        ChangeNotifierProvider(create: (_) => ThemeModeServices()),
        ChangeNotifierProvider(create: (_) => InventoryControllers()),
      ],
      builder: (context, _) {
        final String page = context.watch<AppControllers>().pageTitle;
        final themeNotifier = context.watch<ThemeModeServices>();
        final themeConstants = context.watch<AppTheme>();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: page,
          themeMode: themeNotifier.selectedTheme,
          theme: themeNotifier.selectedTheme == ThemeMode.light
              ? themeConstants.lightTheme
              : themeConstants.darkTheme,
          initialRoute: '/home',
          routes: {
            '/': (context) => const HomePage(),
            '/home': (context) => const HomePage(),
            '/about': (context) => const AboutPage(),
            '/about/accreditation': (context) => const AccreditationPage(),
            '/contact-us': (context) => const ContactPage(),
            '/hardware/cabinets': (context) => const CabinetsPage(),
            '/hardware/cctv': (context) => const CCTVPage(),
            '/hardware/desktops': (context) => const DekstopsPage(),
            '/hardware/firewalls': (context) => const FirewallsPage(),
            '/hardware/notebooks': (context) => const NotebooksPage(),
            '/hardware/printers': (context) => const PrintersPage(),
            '/hardware/routers': (context) => const RoutersPage(),
            '/hardware/scanners': (context) => const ScannersPage(),
            '/hardware/servers': (context) => const ServersPage(),
            '/hardware/switches': (context) => const SwitchesPage(),
            '/hardware/ups': (context) => const UPSPage(),
            '/hardware': (context) => const InventoryPage(),
            '/login': (context) => const LoginPage(),
            '/request': (context) => const RequestsPage(),
            '/software': (context) => const SoftwarePage(),
            '/software/fortinet': (context) => const FortinetSoftwarePage(),
            '/software/microsoft': (context) => const MicrosoftSoftwarePage(),
            '/software/sage': (context) => const SagePage(),
            '/software/sap': (context) => const SAPPage(),
            '/software/tally': (context) => const TallyPage()
          },
        );
      },
    );
  }
}
