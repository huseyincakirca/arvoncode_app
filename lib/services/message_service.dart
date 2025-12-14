import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:arvoncode_app/models/send_message.dart';

class MessageService {
  static const String apiUrl = "http://192.168.1.115:8000/v/ACX4921/message";

  static Future<bool> sendQuickMessage(SendMessageRequest req) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(req.toJson()),
      );

      if (response.statusCode == 200) {
        print("Mesaj gönderildi: ${response.body}");
        return true;
      } else {
        print("Hata kodu: ${response.statusCode}");
        print("Hata: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Bağlantı hatası: $e");
      return false;
    }
  }
}
