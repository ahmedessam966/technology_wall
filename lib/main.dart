import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/config/routing_maps.dart';
import 'package:technology_wall/config/routing_transition_services.dart';
import 'package:technology_wall/core/controllers/software_controllers.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'en/controller_index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/firebase_options.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WebViewPlatform.instance = WebWebViewPlatform();
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
        ChangeNotifierProvider(create: (_) => HomePageControllers()),
        ChangeNotifierProvider(create: (_) => CartControllers()),
        ChangeNotifierProvider(create: (_) => SAPPageControllers()),
        ChangeNotifierProvider(create: (_) => SoftwareControllers()),
      ],
      builder: (context, _) {
        final themeNotifier = context.watch<ThemeModeServices>();
        final themeConstants = context.watch<AppTheme>();
        final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

        return ResponsiveSizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
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
    );
  }
}
