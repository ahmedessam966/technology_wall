import 'dart:convert';
import 'package:http/http.dart' as http;

class ZohoAPI {
  static const String clientId = '1000.6J6Z6Q9UU1IRJOLQYML1E7D6I32S1S';
  static const String clientSecret = '456721812c9b98f2c64db61bd76d17bd0f655ed499';
  static const String grantTokenUrl = 'https://accounts.zoho.com/oauth/v2/auth';
  static const String redirectUri = 'https://books.zoho.com/portal/technologywallforcomputers';
  static const String scope = 'ZohoBooks.fullaccess.all';
  static const String responseType = 'code';
  static const String accessTokenUrl = 'https://accounts.zoho.com/oauth/v2/token';
  static const String grantType = 'authorization_code';
  static const String code = 'your_code';

  static Future<Map<String, dynamic>> getAccessToken() async {
    final Map<String, String> headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final Map<String, String> body = {
      'grant_type': grantType,
      'client_id': clientId,
      'client_secret': clientSecret,
      'redirect_uri': redirectUri,
      'code': code
    };
    final http.Response response = await http.post(Uri.parse(accessTokenUrl), headers: headers, body: body);
    return json.decode(response.body);
  }

  static String getGrantTokenUrl() {
    return '$grantTokenUrl?response_type=$responseType&client_id=$clientId&redirect_uri=$redirectUri&scope=$scope';
  }

  static Future<http.Response> postRequest(
      String url, Map<String, String> headers, Map<String, String> body) async {
    final http.Response response = await http.post(Uri.parse(url), headers: headers, body: body);
    return response;
  }
}
