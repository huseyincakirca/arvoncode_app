import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class LocationService {
  static Future<Map<String, dynamic>> saveLocation({
    required String vehicleUuid,
    required double lat,
    required double lng,
    required double accuracy,
    required String source,
  }) async {
    final url = Uri.parse(
      '${ApiConfig.baseUrl}/public/location/save',
    );

    final response = await http.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'vehicle_uuid': vehicleUuid,
        'lat': lat,
        'lng': lng,
        'accuracy': accuracy,
        'source': source,
      }),
    );

    return jsonDecode(response.body);
  }
}
