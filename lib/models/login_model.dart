import 'dart:convert';

LoginResponseModel loginResponseModelFormJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {

  String id ;
  String username;
  String email;
  String accessToken;
  String tokenType;
  String message;
  String gender;
  String dateOfBirth;

  LoginResponseModel({this.id,this.username,this.email,this.accessToken,this.message,this.tokenType,this.gender,this.dateOfBirth});



  factory LoginResponseModel.fromJson(Map<String,dynamic> json){
    return LoginResponseModel(
      id: json["id"] != null ? json["id"]:"",
      username: json["username"] != null ? json["username"]:"",
      email: json["email"] != null ? json["email"]:"",
      accessToken: json["accessToken"] != null ? json["accessToken"]:"",
      tokenType: json["tokenType"] != null ? json["tokenType"]:"",
      message: json["message"] != null ? json["message"]:"",
      gender: json["gender"] != null ? json["gender"]:"",
      dateOfBirth: json["dateOfBirth"] != null ? json["dateOfBirth"]:"",
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['accessToken'] = this.accessToken;
    data['tokenType'] = this.tokenType;
    data['message'] = this.message;
    data['gender'] = this.gender;
    data['dateOfBirth'] = this.dateOfBirth;
    return data;
  }
}

