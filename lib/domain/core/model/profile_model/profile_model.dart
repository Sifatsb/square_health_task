import 'dart:convert';

import 'package:square_health_task/domain/utils/json_utils.dart';

ProfileInfoModel profileInfoModelFromJson(String str) =>
    ProfileInfoModel.fromJson(json.decode(str));

String profileInfoModelToJson(ProfileInfoModel data) =>
    json.encode(data.toJson());

class ProfileInfoModel {
  bool success;
  Data data;
  String message;

  ProfileInfoModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) =>
      ProfileInfoModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  int unreadNotifications;
  User user;
  String accessToken;

  Data({
    required this.unreadNotifications,
    required this.user,
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        unreadNotifications: json["unread_notifications"],
        user: User.fromJson(json["user"]),
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "unread_notifications": unreadNotifications,
        "user": user.toJson(),
        "accessToken": accessToken,
      };
}

class User {
  int id;
  String fullName;
  String email;

  User({
    required this.id,
    required this.fullName,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> j) => User(
        id: getSafeValue<int>(j, 'id', 0),
        fullName: getSafeValue<String>(j, 'full_name', ''),
        email: getSafeValue<String>(j, 'email', ''),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
      };
}
