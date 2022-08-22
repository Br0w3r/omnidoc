// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.country,
    this.displayName,
    this.email,
    this.followers,
    this.id,
    this.images,
  });

  String? country;
  String? displayName;
  String? email;
  Followers? followers;
  String? id;
  List<Image>? images;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        country: json["country"],
        displayName: json["display_name"],
        email: json["email"],
        followers: Followers.fromJson(json["followers"]),
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "display_name": displayName,
        "email": email,
        "followers": followers!.toJson(),
        "id": id,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}

class Followers {
  Followers({
    this.href,
    this.total,
  });

  dynamic href;
  int? total;

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}

class Image {
  Image({
    this.height,
    this.url,
    this.width,
  });

  dynamic height;
  String? url;
  dynamic width;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}
