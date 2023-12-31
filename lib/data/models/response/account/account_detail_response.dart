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

  factory AccountDetailResponseModel.fromJson(String str) =>
      AccountDetailResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccountDetailResponseModel.fromMap(Map<String, dynamic> json) =>
      AccountDetailResponseModel(
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
  final Account? attributes;

  AccountDetailData({
    this.id,
    this.attributes,
  });

  factory AccountDetailData.fromJson(String str) =>
      AccountDetailData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccountDetailData.fromMap(Map<String, dynamic> json) => AccountDetailData(
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
  final DateTime? birthDate;
  final String? gender;
  final String? noIdentity;
  final dynamic address;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final String? email;
  final Reports? user;
  final Reports? reports;
  final Thumbnails? thumbnails;

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
    this.user,
    this.reports,
    this.thumbnails,
  });

  factory Account.fromJson(String str) => Account.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Account.fromMap(Map<String, dynamic> json) => Account(
        phoneNumber: json["phone_number"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
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
        user: json["user"] == null ? null : Reports.fromMap(json["user"]),
        reports:
            json["reports"] == null ? null : Reports.fromMap(json["reports"]),
        thumbnails: json["thumbnails"] == null
            ? null
            : Thumbnails.fromMap(json["thumbnails"]),
      );

  Map<String, dynamic> toMap() => {
        "phone_number": phoneNumber,
        "birth_date":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "no_identity": noIdentity,
        "address": address,
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "email": email,
        "user": user?.toMap(),
        "reports": reports?.toMap(),
        "thumbnails": thumbnails?.toMap(),
      };
}

class Reports {
  final List<Datum>? data;

  Reports({
    this.data,
  });

  factory Reports.fromJson(String str) => Reports.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reports.fromMap(Map<String, dynamic> json) => Reports(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  final int? id;
  final DatumAttributes? attributes;

  Datum({
    this.id,
    this.attributes,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : DatumAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class DatumAttributes {
  final String? name;
  final String? noIdentity;
  final String? phoneNumber;
  final String? city;
  final String? province;
  final String? subdistrict;
  final String? address;
  final String? descriptionReport;
  final String? noKip;
  final String? noKks;
  final String? noBpjs;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  DatumAttributes({
    this.name,
    this.noIdentity,
    this.phoneNumber,
    this.city,
    this.province,
    this.subdistrict,
    this.address,
    this.descriptionReport,
    this.noKip,
    this.noKks,
    this.noBpjs,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory DatumAttributes.fromJson(String str) =>
      DatumAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DatumAttributes.fromMap(Map<String, dynamic> json) => DatumAttributes(
        name: json["name"],
        noIdentity: json["no_identity"],
        phoneNumber: json["phone_number"],
        city: json["city"],
        province: json["province"],
        subdistrict: json["subdistrict"],
        address: json["address"],
        descriptionReport: json["description_report"],
        noKip: json["no_kip"],
        noKks: json["no_kks"],
        noBpjs: json["no_bpjs"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "no_identity": noIdentity,
        "phone_number": phoneNumber,
        "city": city,
        "province": province,
        "subdistrict": subdistrict,
        "address": address,
        "description_report": descriptionReport,
        "no_kip": noKip,
        "no_kks": noKks,
        "no_bpjs": noBpjs,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
      };
}

class Thumbnails {
  final ThumbnailsData? data;

  Thumbnails({
    this.data,
  });

  factory Thumbnails.fromJson(String str) =>
      Thumbnails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnails.fromMap(Map<String, dynamic> json) => Thumbnails(
        data:
            json["data"] == null ? null : ThumbnailsData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}

class ThumbnailsData {
  final int? id;
  final FluffyAttributes? attributes;

  ThumbnailsData({
    this.id,
    this.attributes,
  });

  factory ThumbnailsData.fromJson(String str) =>
      ThumbnailsData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ThumbnailsData.fromMap(Map<String, dynamic> json) => ThumbnailsData(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : FluffyAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class FluffyAttributes {
  final String? name;
  final dynamic alternativeText;
  final dynamic caption;
  final int? width;
  final int? height;
  final Formats? formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  final dynamic previewUrl;
  final String? provider;
  final dynamic providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FluffyAttributes({
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  factory FluffyAttributes.fromJson(String str) =>
      FluffyAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FluffyAttributes.fromMap(Map<String, dynamic> json) =>
      FluffyAttributes(
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats:
            json["formats"] == null ? null : Formats.fromMap(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats?.toMap(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Formats {
  final Small? thumbnail;
  final Small? small;

  Formats({
    this.thumbnail,
    this.small,
  });

  factory Formats.fromJson(String str) => Formats.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Formats.fromMap(Map<String, dynamic> json) => Formats(
        thumbnail:
            json["thumbnail"] == null ? null : Small.fromMap(json["thumbnail"]),
        small: json["small"] == null ? null : Small.fromMap(json["small"]),
      );

  Map<String, dynamic> toMap() => {
        "thumbnail": thumbnail?.toMap(),
        "small": small?.toMap(),
      };
}

class Small {
  final String? name;
  final String? hash;
  final String? ext;
  final String? mime;
  final dynamic path;
  final int? width;
  final int? height;
  final double? size;
  final String? url;

  Small({
    this.name,
    this.hash,
    this.ext,
    this.mime,
    this.path,
    this.width,
    this.height,
    this.size,
    this.url,
  });

  factory Small.fromJson(String str) => Small.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Small.fromMap(Map<String, dynamic> json) => Small(
        name: json["name"],
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        path: json["path"],
        width: json["width"],
        height: json["height"],
        size: json["size"]?.toDouble(),
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "path": path,
        "width": width,
        "height": height,
        "size": size,
        "url": url,
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
