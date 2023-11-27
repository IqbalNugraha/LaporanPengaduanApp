import 'dart:convert';

class AccountDetailResponseModel {
    final AccountDetailData? data;
    final Meta? meta;
    final Error? error;

    AccountDetailResponseModel({
        this.data,
        this.meta,
        this.error,
    });

    factory AccountDetailResponseModel.fromJson(String str) => AccountDetailResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AccountDetailResponseModel.fromMap(Map<String, dynamic> json) => AccountDetailResponseModel(
        data: json["data"] == null ? null : AccountDetailData.fromMap(json["data"]),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
        error: json["error"] == null ? null : Error.fromMap(json["error"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "meta": meta?.toMap(),
        "error": error?.toMap(),
    };
}

class AccountDetailData {
    final int? id;
    final AccountDetail? attributes;

    AccountDetailData({
        this.id,
        this.attributes,
    });

    factory AccountDetailData.fromJson(String str) => AccountDetailData.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AccountDetailData.fromMap(Map<String, dynamic> json) => AccountDetailData(
        id: json["id"],
        attributes: json["attributes"] == null ? null : AccountDetail.fromMap(json["attributes"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
    };
}

class AccountDetail {
    final String? phoneNumber;
    final DateTime? birthDate;
    final String? gender;
    final String? noIdentity;
    final dynamic address;
    final String? name;
    final String? email;

    AccountDetail({
        this.phoneNumber,
        this.birthDate,
        this.gender,
        this.noIdentity,
        this.address,
        this.name,
        this.email,
    });

    factory AccountDetail.fromJson(String str) => AccountDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AccountDetail.fromMap(Map<String, dynamic> json) => AccountDetail(
        phoneNumber: json["phone_number"],
        birthDate: json["birth_date"] == null ? null : DateTime.parse(json["birth_date"]),
        gender: json["gender"],
        noIdentity: json["no_identity"],
        address: json["address"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toMap() => {
        "phone_number": phoneNumber,
        "birth_date": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "no_identity": noIdentity,
        "address": address,
        "name": name,
        "email": email,
    };
}

class Meta {
    Meta();

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
    );

    Map<String, dynamic> toMap() => {
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

