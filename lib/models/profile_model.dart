// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProfileModel profileFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String id;
  String userId;
  String address;
  String phoneNumber;
  String bio;
  String gender;
  dynamic dateOfBirth;
  ImageProfile imageProfile;
  DateTime createdAt;
  DateTime updatedAt;
  SocialLinks socialLinks;
  List<dynamic> interests;
  List<dynamic> languages;
  String name;
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
    imageProfile: ImageProfile.fromJson(json["imageProfile"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    socialLinks: SocialLinks.fromJson(json["socialLinks"]),
    interests: List<dynamic>.from(json["interests"].map((x) => x)),
    languages: List<dynamic>.from(json["languages"].map((x) => x)),
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
    "imageProfile": imageProfile.toJson(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "socialLinks": socialLinks.toJson(),
    "interests": List<dynamic>.from(interests.map((x) => x)),
    "languages": List<dynamic>.from(languages.map((x) => x)),
    "name": name,
    "active": active,
  };
}
class ImageProfile {
  dynamic filename;
  dynamic fileType;
  dynamic filePathUrl;

  ImageProfile({
    required this.filename,
    required this.fileType,
    required this.filePathUrl,
  });

  factory ImageProfile.fromJson(Map<String, dynamic> json) => ImageProfile(
    filename: json["filename"],
    fileType: json["fileType"],
    filePathUrl: json["filePathUrl"],
  );

  Map<String, dynamic> toJson() => {
    "filename": filename,
    "fileType": fileType,
    "filePathUrl": filePathUrl,
  };
}

class SocialLinks {
  SocialLinks();

  factory SocialLinks.fromJson(Map<String, dynamic> json) => SocialLinks(
  );

  Map<String, dynamic> toJson() => {
  };
}