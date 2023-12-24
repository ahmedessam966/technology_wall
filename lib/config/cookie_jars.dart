import 'package:cookie_jar/cookie_jar.dart';

class CookieManager {
  static PersistCookieJar _cookieJar = PersistCookieJar();

  static Future<void> init() async {
    _cookieJar = PersistCookieJar(ignoreExpires: true);
    await _cookieJar.forceInit();
  }

  static PersistCookieJar get cookieJar => _cookieJar;
}
