import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:provider/provider.dart';
import 'package:technology_wall/en/shared/web/cookie_popup.dart';
import 'package:technology_wall/config/routing_maps.dart';
import 'package:technology_wall/config/routing_transition_services.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'controller_index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/firebase_options.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WebViewPlatform.instance = WebWebViewPlatform();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load();
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
        ChangeNotifierProvider(create: (_) => MicrosoftControllers()),
        ChangeNotifierProvider(create: (_) => DekstopsControllers()),
        ChangeNotifierProvider(create: (_) => NotebooksControllers()),
        ChangeNotifierProvider(create: (_) => ARDesktopsControllers()),
        ChangeNotifierProvider(create: (_) => ARNotebooksControllers()),
        ChangeNotifierProvider(create: (_) => ARPrintersControllers()),
        ChangeNotifierProvider(create: (_) => PrintersControllers()),
      ],
      builder: (context, _) {
        final themeNotifier = context.watch<ThemeModeServices>();
        final themeConstants = context.watch<AppTheme>();
        final cookieWatcher = context.watch<AppControllers>();
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
            builder: (context, child) {
              return Stack(
                children: [
                  child!,
                  Builder(builder: (ctx) {
                    final int count = cookieWatcher.cookiePrompt;
                    if (cookieWatcher.isCookieConsent) {
                      return const SizedBox.shrink();
                    } else {
                      if (count < 1) {
                        return const CookiePopup();
                      } else {
                        return const SizedBox.shrink();
                      }
                    }
                  }),
                ],
              );
            },
          );
        });
      },
    );
  }
}
