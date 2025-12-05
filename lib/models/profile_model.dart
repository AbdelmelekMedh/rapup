// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProfileModel profileFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String id;
  String userId;
  dynamic address;
  dynamic phoneNumber;
  dynamic bio;
  dynamic gender;
  dynamic dateOfBirth;
  dynamic imageProfile;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic socialLinks;
  dynamic interests;
  dynamic languages;
  dynamic name;
  bool active;

  ProfileModel({
    required this.id,
    required this.userId,
    required this.address,
    required this.phoneNumber,
    required this.bio,
    required this.gender,
    required this.dateOfBirth,
    required this.imageProfile,
    required this.createdAt,
    required this.updatedAt,
    required this.socialLinks,
    required this.interests,
    required this.languages,
    required this.name,
    required this.active,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    userId: json["userId"],
    address: json["address"],
    phoneNumber: json["phoneNumber"],
    bio: json["bio"],
    gender: json["gender"],
    dateOfBirth: json["dateOfBirth"],
    imageProfile: json["imageProfile"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    socialLinks: json["socialLinks"],
    interests: json["interests"],
    languages: json["languages"],
    name: json["name"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "address": address,
    "phoneNumber": phoneNumber,
    "bio": bio,
    "gender": gender,
    "dateOfBirth": dateOfBirth,
    "imageProfile": imageProfile,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "socialLinks": socialLinks,
    "interests": interests,
    "languages": languages,
    "name": name,
    "active": active,
  };
}
