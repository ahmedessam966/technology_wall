import 'package:emailjs/emailjs.dart';
import 'package:flutter/foundation.dart';

class EmailController {
  static Future<int> sendEmail(
      String name, String subject, String? notes, String email, String phone, String request) async {
    Map<String, dynamic> templateParams = {
      'to_name': name,
      'topic': subject,
      'request': request,
      'message': notes,
      'to_email': email,
      'phone': phone,
      'reply_to': email
    };

    try {
      await EmailJS.send(
        'service_ed293uq',
        'template_2dg6eft',
        templateParams,
        const Options(
          publicKey: 'cuMpj4ocv-pxCqyvM',
          privateKey: 'Zl4tblay6B7U9O51XwnZ7',
        ),
      );
      return 200;
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return 400;
    }
  }
}
