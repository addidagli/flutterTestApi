// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.statusCode,
        this.success,
        this.message,
        this.data,
    });

    int statusCode;
    bool success;
    String message;
    List<Datum> data;

    factory User.fromJson(Map<String, dynamic> json) => User(
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode == null ? null : statusCode,
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.firstname,
        this.lastname,
        this.email,
        this.password,
    });

    int id;
    String firstname;
    String lastname;
    String email;
    String password;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
    };
}
