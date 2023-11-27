import 'dart:convert';

class RegisterResponseModel {
  final LoginData? data;
  final Meta? meta;
  final Error? error;

  RegisterResponseModel({
    this.data,
    this.meta,
    this.error,
  });

  factory RegisterResponseModel.fromJson(String str) =>
      RegisterResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) =>
      RegisterResponseModel(
        data: json["data"] == null ? null : LoginData.fromMap(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
        error: json["error"] == null ? null : Error.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "meta": meta?.toMap(),
        "error": error?.toMap(),
      };
}

class LoginData {
  final int? id;
  final Account? attributes;

  LoginData({
    this.id,
    this.attributes,
  });

  factory LoginData.fromJson(String str) => LoginData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginData.fromMap(Map<String, dynamic> json) => LoginData(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : Account.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class Account {
  final String? phoneNumber;
  final String? birthDate;
  final String? gender;
  final String? noIdentity;
  final String? address;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? email;

  Account({
    this.phoneNumber,
    this.birthDate,
    this.gender,
    this.noIdentity,
    this.address,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.email,
  });

  factory Account.fromJson(String str) => Account.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Account.fromMap(Map<String, dynamic> json) => Account(
        phoneNumber: json["phone_number"],
        birthDate: json["birth_date"],
        gender: json["gender"],
        noIdentity: json["no_identity"],
        address: json["address"],
        name: json["name"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "phone_number": phoneNumber,
        "birth_date": birthDate,
        "gender": gender,
        "no_identity": noIdentity,
        "address": address,
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "email": email,
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toMap() => {};
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
