import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rapup/models/profile_model.dart';

class ProfileApi {
  static Future<http.Response> createProfile(String token, String userId, DateTime createdAt) {
    return  http.post(
      Uri.parse("http://10.0.2.2:8080/api/profile"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(<String, String>{
        'userId': userId,
      }),
    );
  }

  static Future<ProfileModel?> getProfile(String token, String userId) async {
    final response = await http.get(
      Uri.parse("http://10.0.2.2:8080/api/profile/$userId"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(response.body));
    }
    return null; // 404 or error
  }
}
