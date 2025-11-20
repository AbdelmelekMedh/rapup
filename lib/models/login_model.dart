import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  final String id;
  final String username;
  final String email;
  final String accessToken;
  final String tokenType;
  final String message;
  final String gender;
  final String dateOfBirth;

  const LoginResponseModel({
    required this.id,
    required this.username,
    required this.email,
    required this.accessToken,
    required this.tokenType,
    required this.message,
    required this.gender,
    required this.dateOfBirth,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        id: json["id"] ?? "",
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        accessToken: json["accessToken"] ?? "",
        tokenType: json["tokenType"] ?? "",
        message: json["message"] ?? "",
        gender: json["gender"] ?? "",
        dateOfBirth: json["dateOfBirth"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "accessToken": accessToken,
        "tokenType": tokenType,
        "message": message,
        "gender": gender,
        "dateOfBirth": dateOfBirth,
      };
}
