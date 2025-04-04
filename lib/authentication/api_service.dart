import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      "https://4zeo5rp7q1.execute-api.ap-south-1.amazonaws.com/prod";

  /// User Registration API
  Future<void> registerUser(String name, String email) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      body: jsonEncode({"name": name, "email": email}),
      headers: {"Content-Type": "application/json"},
    );
    print(response.body);
  }

  /// Admin Approval API
  Future<void> approveUser(String userId) async {
    final response = await http.post(
      Uri.parse("$baseUrl/verify"),
      body: jsonEncode({"user_id": userId}),
      headers: {"Content-Type": "application/json"},
    );
    print(response.body);
  }

  /// User Login API
  Future<String?> loginUser(String username, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      body: jsonEncode({"username": username, "password": password}),
      headers: {"Content-Type": "application/json"},
    );

    final data = jsonDecode(response.body);
    if (data.containsKey("access_token")) {
      return data["access_token"];
    } else {
      return null;
    }
  }
}
