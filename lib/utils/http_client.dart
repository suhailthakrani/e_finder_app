import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/response_model.dart';
import 'constants.dart';

class APIClient {
  APIClient._();

  factory APIClient() => _instance;

  static final APIClient _instance = APIClient._();

  Future<ResponseModel> postRequest(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    try {    
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},
      ).timeout(const Duration(seconds: 120));
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        return ResponseModel.fromJson(decodedJson);
      } else {
        return ResponseModel(
          isSuccess: false,
          message: 'Failed to load data: ${response.statusCode}',
        );
      }
    } catch (error) {
      return ResponseModel(
        isSuccess: false,
        message: 'An error occurred: $error',
      );
    }
  }

  Future<ResponseModel> getRequest(String endpoint,
      {bool requiredToken = true}) async {
    try {
      final response = await http
          .get(
            Uri.parse('$baseUrl$endpoint'),
            headers: requiredToken ? await getHeaders() : null,
          )
          .timeout(const Duration(seconds: 120));
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        return ResponseModel.fromJson(decodedJson);
      } else {
        return ResponseModel(
          isSuccess: false,
          message: 'Failed to load data: ${response.statusCode}',
        );
      }
    } catch (error) {
      return ResponseModel(
        isSuccess: false,
        message: 'An error occurred: $error',
      );
    }
  }

  Future<Map<String, String>> getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    return {
      if (token.isNotEmpty) 'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
  }
}
