import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
//php artisan serve --host=0.0.0.0 --port=8000

final Logger logger = Logger();

class BillController {
  Future<void> sendDataToAPI(Map<String, dynamic> requestBody) async {
    try {
      print('before sending my data to API');
      // Send POST request to the API
      print('Ahead to hit your API');
      final response = await http.post(
        Uri.parse('http://192.168.88.5:8000/api/parking_bill/create'),
        // Uri.parse('http://41.59.87.18:8000/api/parking_bill/create'),
        body: requestBody,
      );
      print('I have hit your API successfully');

      // Parse the response JSON
      final responseData = jsonDecode(response.body);

      // Log API response details
      print('API Response Status Code: ${response.statusCode}');
      print('API Response Body: ${responseData['message']}');
    } catch (e) {
      // Log error
      print('Error sending data to API: $e');
    }
  }
}
