// import 'dart:convert';
//
// import 'package:square_health_task/domain/utils/json_utils.dart';
//
// ProfileInfoModel profileInfoModelFromJson(String str) =>
//     ProfileInfoModel.fromJson(json.decode(str));
//
// String profileInfoModelToJson(ProfileInfoModel data) =>
//     json.encode(data.toJson());
//
// class ProfileInfoModel {
//   bool success;
//   Data data;
//   String message;
//
//   ProfileInfoModel({
//     required this.success,
//     required this.data,
//     required this.message,
//   });
//
//   factory ProfileInfoModel.fromJson(Map<String, dynamic> json) =>
//       ProfileInfoModel(
//         success: json["success"],
//         data: Data.fromJson(json["data"]),
//         message: json["message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "data": data.toJson(),
//         "message": message,
//       };
// }
//
// class Data {
//   int unreadNotifications;
//   User user;
//   String accessToken;
//
//   Data({
//     required this.unreadNotifications,
//     required this.user,
//     required this.accessToken,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         unreadNotifications: json["unread_notifications"],
//         user: User.fromJson(json["user"]),
//         accessToken: json["accessToken"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "unread_notifications": unreadNotifications,
//         "user": user.toJson(),
//         "accessToken": accessToken,
//       };
// }
//
// class User {
//   int id;
//   String fullName;
//   String email;
//
//   User({
//     required this.id,
//     required this.fullName,
//     required this.email,
//   });
//
//   factory User.fromJson(Map<String, dynamic> j) => User(
//         id: getSafeValue<int>(j, 'id', 0),
//         fullName: getSafeValue<String>(j, 'full_name', ''),
//         email: getSafeValue<String>(j, 'email', ''),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "full_name": fullName,
//         "email": email,
//       };
// }



class ProfileInfoModel {
  User? user;
  String? token;

  ProfileInfoModel({this.user, this.token});

  ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? age;
  String? sId;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.age,
        this.sId,
        this.name,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
