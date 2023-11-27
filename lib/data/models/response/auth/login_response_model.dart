import 'dart:convert';

class LoginResponseModel {
    final LoginData? data;
    final Error? error;

    LoginResponseModel({
        this.data,
        this.error,
    });

    factory LoginResponseModel.fromJson(String str) => LoginResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginResponseModel.fromMap(Map<String, dynamic> json) => LoginResponseModel(
        data: json["data"] == null ? null : LoginData.fromMap(json["data"]),
        error: json["error"] == null ? null : Error.fromMap(json["error"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "error": error?.toMap(),
    };
}

class LoginData {
    final String? jwt;
    final int? id;
    final Account? attributes;

    LoginData({
        this.jwt,
        this.id,
        this.attributes,
    });

    factory LoginData.fromJson(String str) => LoginData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginData.fromMap(Map<String, dynamic> json) => LoginData(
        jwt: json["jwt"],
        id: json["id"],
        attributes: json["attributes"] == null ? null : Account.fromMap(json["attributes"]),
    );

    Map<String, dynamic> toMap() => {
        "jwt": jwt,
        "id": id,
        "attributes": attributes?.toMap(),
    };
}

class Account {
    final String? name;
    final String? noIdentity;
    final String? email;
    final String? phoneNumber;
    final String? birthDate;
    final String? gender;
    final String? address;

    Account({
        this.name,
        this.noIdentity,
        this.email,
        this.phoneNumber,
        this.birthDate,
        this.gender,
        this.address,
    });

    factory Account.fromJson(String str) => Account.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Account.fromMap(Map<String, dynamic> json) => Account(
        name: json["name"],
        noIdentity: json["no_identity"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        birthDate: json["birth_date"],
        gender: json["gender"],
        address: json["address"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "no_identity": noIdentity,
        "email": email,
        "phone_number": phoneNumber,
        "birth_date": birthDate,
        "gender": gender,
        "address": address,
    };
}

class Error {
  final int? status;
  final String? name;
  final String? message;

  Error({
    this.status,
    this.name,
    this.message,
  });

  factory Error.fromJson(String str) => Error.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Error.fromMap(Map<String, dynamic> json) => Error(
        status: json["status"],
        name: json["name"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "name": name,
        "message": message,
      };
}

