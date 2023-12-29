// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CookiesManager {
  void _setCookie(String name, String value, {int? expires}) {
    String cookieString = '$name=$value';
    if (expires != null) {
      DateTime now = DateTime.now();
      DateTime expiration = now.add(Duration(days: expires));
      cookieString += ';expires=${expiration.toUtc().toLocal()}';
    }
    html.document.cookie = cookieString;
  }

  String? _getCookie(String name) {
    if (html.document.cookie != null) {
      List<String> cookies = html.document.cookie!.split(';');
      for (String cookie in cookies) {
        List<String> parts = cookie.split('=');
        String cookieName = parts[0].trim();
        String cookieValue = parts.length > 1 ? parts[1].trim() : '';
        if (cookieName == name) {
          return cookieValue;
        }
      }
    }
    return null;
  }

  void onAcceptCookies() async {
    _setCookie('accepted_cookies', 'true', expires: 365);

    await _requestLocationPermission();
    final String? lon = _getCookie('longitude');
    final String? lat = _getCookie('latitude');
    if (lat != null && lon != null) {
      await getCityAndCountry(double.parse(lat), double.parse(lon));
    } else {
      if (kDebugMode) {
        print('error in lines 36-40 for determining the city');
      }
    }
  }

  bool checkCookieConsent() {
    String? consent = _getCookie('accepted_cookies');
    if (consent == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> _requestLocationPermission() async {
    try {
      await html.window.navigator.geolocation.getCurrentPosition(maximumAge: const Duration(days: 365));
      try {
        final position = await html.window.navigator.geolocation.getCurrentPosition();
        final num? latitude = position.coords?.latitude;
        final num? longitude = position.coords?.longitude;

        _setCookie('latitude', latitude.toString());
        _setCookie('longitude', longitude.toString());

        if (kDebugMode) {
          print('User location: $latitude, $longitude');
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error getting user location: $e');
        }
      }
      if (kDebugMode) {
        print('Location permission granted');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error requesting location permission: $e');
      }
    }
  }

  Future<void> getCityAndCountry(double latitude, double longitude) async {
    const apiKey = 'AIzaSyB2_ZO4SXu50ee74oiay3olCUYfeTQVKFY';
    final apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

    try {
      final response = await http.post(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final results = data['results'];

        if (results.isNotEmpty) {
          final addressComponents = results[0]['address_components'];

          for (var component in addressComponents) {
            final types = component['types'];

            if (types.contains('locality')) {
              final city = component['long_name'];
              _setCookie('city', city);
              if (kDebugMode) {
                print('City: $city');
              }
            } else if (types.contains('country')) {
              final country = component['long_name'];
              _setCookie('country', country);
              if (kDebugMode) {
                print('Country: $country');
              }
            } else if (types.contains('postal_code')) {
              final postal = component['long_name'];
              _setCookie('postal_code', postal);
              if (kDebugMode) {
                print('postal_code: $postal');
              }
            }
          }
        }
      } else {
        if (kDebugMode) {
          print('Error fetching geocoding data: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching geocoding data: $e');
      }
    }
  }

  void clearCookies() {
    // Clear all cookies
    if (html.window.document.cookie != null) {
      html.window.document.cookie?.split(';').forEach((cookie) {
        final eqPos = cookie.indexOf('=');
        final name = eqPos > -1 ? cookie.substring(0, eqPos) : cookie;
        html.document.cookie = '$name=;expires=Thu, 01 Jan 1970 00:00:00 GMT;path=/';
      });
    }
  }
}
