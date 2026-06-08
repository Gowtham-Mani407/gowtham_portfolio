import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// as of now it created later when using cloud function, but later we can move it to a separate
//file and use it for other services as well

class ContactRepository {
  Future<void> sendTelegramMessage({
    required String name,
    required String email,
    required String mobilenum,
    required String subject,
    required String message,
  }) async {
    const token = '8910018745:AAF091dV11xh-rWWX40UWaKc4NWiLPM1tsI';
    const chatId = '1315733582';

    final text =
        '''
🚀 New Portfolio Lead

👤 Name: $name
📧 Email: $email
📱 Phone: $mobilenum
📌 Subject: $subject

📝 Message:
$message
''';

    final response = await http.post(
      Uri.parse('https://api.telegram.org/bot$token/sendMessage'),
      body: {'chat_id': chatId, 'text': text},
    );

    debugPrint("Status: ${response.statusCode}");
    debugPrint("Body: ${response.body}");

    if (response.statusCode != 200) {
      throw Exception('Failed to send message');
    }
  }
}

class EmailService {
  Future<void> sendEmail({
    required String name,
    required String email,
    required String mobilenum,
    required String subject,
    required String message,
  }) async {
    final response = await http.post(
      Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'service_id': 'service_q3ybha9',
        'template_id': 'template_o0eb8dc',
        'user_id': 'fVd8X8vU9ZRgHZLeg',
        'template_params': {
          'from_name': name,
          'from_email': email,
          'from_mobilenum': mobilenum,
          'subject': subject,
          'message': message,
        },
      }),
    );

    print('STATUS CODE : ${response.statusCode}');
    print('BODY : ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('EmailJS Error: ${response.statusCode} ${response.body}');
    }
  }
}
