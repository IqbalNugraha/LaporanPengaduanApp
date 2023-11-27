import 'dart:convert';

class AccountRequestModel {
  final AccountModel? data;

  AccountRequestModel({
    this.data,
  });

  factory AccountRequestModel.fromJson(String str) =>
      AccountRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccountRequestModel.fromMap(Map<String, dynamic> json) =>
      AccountRequestModel(
        data: json["data"] == null ? null : AccountModel.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}

class AccountModel {
  final String? phoneNumber;
  final String? birthDate;
  final String? gender;
  final String? noIdentity;
  final String? address;
  final String? name;
  final String? idAuth;

  AccountModel({
    this.phoneNumber,
    this.birthDate,
    this.gender,
    this.noIdentity,
    this.address,
    this.name,
    this.idAuth,
  });

  factory AccountModel.fromJson(String str) =>
      AccountModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccountModel.fromMap(Map<String, dynamic> json) => AccountModel(
        phoneNumber: json["phone_number"],
        birthDate: json["birth_date"],
        gender: json["gender"],
        noIdentity: json["no_identity"],
        address: json["address"],
        name: json["name"],
        idAuth: json["id_auth"],
      );

  Map<String, dynamic> toMap() => {
        "phone_number": phoneNumber,
        "birth_date": birthDate,
        "gender": gender,
        "no_identity": noIdentity,
        "address": address,
        "name": name,
        "id_auth": idAuth,
      };
}
