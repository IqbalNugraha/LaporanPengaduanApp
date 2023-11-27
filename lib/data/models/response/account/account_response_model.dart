import 'dart:convert';

class AccountResponseModel {
  final AccountData? data;
  final Meta? meta;
  final Error? error;

  AccountResponseModel({
    this.data,
    this.meta,
    this.error,
  });

  factory AccountResponseModel.fromJson(String str) =>
      AccountResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccountResponseModel.fromMap(Map<String, dynamic> json) =>
      AccountResponseModel(
        data: json["data"] == null ? null : AccountData.fromMap(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
        error: json["error"] == null ? null : Error.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "meta": meta?.toMap(),
        "error": error?.toMap(),
      };
}

class AccountData {
  final int? id;
  final Account? attributes;

  AccountData({
    this.id,
    this.attributes,
  });

  factory AccountData.fromJson(String str) => AccountData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccountData.fromMap(Map<String, dynamic> json) => AccountData(
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
  final dynamic birthDate;
  final String? gender;
  final String? noIdentity;
  final dynamic address;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final int? idAuth;

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
    this.idAuth,
  });

  factory Account.fromJson(String str) =>
      Account.fromMap(json.decode(str));

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
        idAuth: json["id_auth"],
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
        "id_auth": idAuth,
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

  factory Error.fromJson(String str) =>
      Error.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Error.fromMap(Map<String, dynamic> json) =>
      Error(
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
