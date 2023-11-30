import 'dart:convert';

class ReportResponseModel {
  final List<ReportData>? data;
  final Meta? meta;
  final Error? error;

  ReportResponseModel({
    this.data,
    this.meta,
    this.error,
  });

  factory ReportResponseModel.fromJson(String str) =>
      ReportResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportResponseModel.fromMap(Map<String, dynamic> json) =>
      ReportResponseModel(
        data: json["data"] == null
            ? []
            : List<ReportData>.from(
                json["data"]!.map((x) => ReportData.fromMap(x))),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
        error: json["error"] == null ? null : Error.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "meta": meta?.toMap(),
        "error": error?.toMap(),
      };
}

class ReportData {
  final int? id;
  final Report? attributes;

  ReportData({
    this.id,
    this.attributes,
  });

  factory ReportData.fromJson(String str) =>
      ReportData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportData.fromMap(Map<String, dynamic> json) => ReportData(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : Report.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class Report {
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
  final String? idProvince;
  final String? idCity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final Thumbnails? thumbnails;
  final Account? account;

  Report({
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
    this.idProvince,
    this.idCity,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.thumbnails,
    this.account,
  });

  factory Report.fromJson(String str) => Report.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Report.fromMap(Map<String, dynamic> json) => Report(
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
        idProvince: json["id_province"],
        idCity: json["id_city"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        thumbnails: json["thumbnails"] == null
            ? null
            : Thumbnails.fromMap(json["thumbnails"]),
        account:
            json["account"] == null ? null : Account.fromMap(json["account"]),
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
        "id_province": idProvince,
        "id_city": idCity,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "thumbnails": thumbnails?.toMap(),
        "account": account?.toMap(),
      };
}

class Account {
  final Data? data;

  Account({
    this.data,
  });

  factory Account.fromJson(String str) => Account.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Account.fromMap(Map<String, dynamic> json) => Account(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
      };
}

class Data {
  final int? id;
  final DataAttributes? attributes;

  Data({
    this.id,
    this.attributes,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : DataAttributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "attributes": attributes?.toMap(),
      };
}

class DataAttributes {
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

  DataAttributes({
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

  factory DataAttributes.fromJson(String str) =>
      DataAttributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataAttributes.fromMap(Map<String, dynamic> json) => DataAttributes(
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
      };
}

class Thumbnails {
  final List<ThumbnailsDatum>? data;

  Thumbnails({
    this.data,
  });

  factory Thumbnails.fromJson(String str) =>
      Thumbnails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnails.fromMap(Map<String, dynamic> json) => Thumbnails(
        data: json["data"] == null
            ? []
            : List<ThumbnailsDatum>.from(
                json["data"]!.map((x) => ThumbnailsDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class ThumbnailsDatum {
  final int? id;
  final FluffyAttributes? attributes;

  ThumbnailsDatum({
    this.id,
    this.attributes,
  });

  factory ThumbnailsDatum.fromJson(String str) =>
      ThumbnailsDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ThumbnailsDatum.fromMap(Map<String, dynamic> json) => ThumbnailsDatum(
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

class Meta {
  final Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "pagination": pagination?.toMap(),
      };
}

class Pagination {
  final int? page;
  final int? pageSize;
  final int? pageCount;
  final int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromJson(String str) =>
      Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
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
