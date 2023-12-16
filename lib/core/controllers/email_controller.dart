import 'package:emailjs/emailjs.dart';
import 'package:flutter/foundation.dart';

class EmailController {
  static Future<int> sendEmail(String name, String subject, String? notes, String email, String phone,
      String product, int quantity) async {
    Map<String, dynamic> templateParams = {
      'to_name': name,
      'topic': subject,
      'request': product,
      'message': notes,
      'to_email': email,
      'phone': phone,
      'reply_to': email,
      'quantity': quantity
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

  static Future<int> sendGeneralPO(String name, String subject, String? notes, String email, String phone,
      List<List<String>> products) async {
    String emailBody = generateEmailTemplate(products);
    Map<String, dynamic> templateParams = {
      'to_name': name,
      'topic': subject,
      'message': emailBody,
      'notes': notes,
      'to_email': email,
      'phone': phone,
      'reply_to': email,
    };

    try {
      await EmailJS.send(
        'service_ed293uq',
        'template_3eu5jfd',
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

  static String generateEmailTemplate(List<List<String>> items) {
    String template = """""";

    for (int i = 0; i < items.length; i++) {
      String itemRow = '${items[i][0]}: ${items[i][1]} Piece(s)\n';
      template += itemRow;
    }
    return template.toString();
  }
}
