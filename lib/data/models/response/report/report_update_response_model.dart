import 'dart:convert';

class ReportUpdateResponseModel {
  final ReportData? data;
  final Error? error;

  ReportUpdateResponseModel({
    this.data,
    this.error,
  });

  factory ReportUpdateResponseModel.fromJson(String str) =>
      ReportUpdateResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportUpdateResponseModel.fromMap(Map<String, dynamic> json) =>
      ReportUpdateResponseModel(
        data: json["data"] == null ? null : ReportData.fromMap(json["data"]),
        error: json["error"] == null ? null : Error.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "error": error?.toMap(),
      };
}

class ReportData {
  final Report? report;

  ReportData({
    this.report,
  });

  factory ReportData.fromJson(String str) =>
      ReportData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportData.fromMap(Map<String, dynamic> json) => ReportData(
        report: json["report"] == null ? null : Report.fromMap(json["report"]),
      );

  Map<String, dynamic> toMap() => {
        "report": report?.toMap(),
      };
}

class Report {
  final int? id;
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

  Report({
    this.id,
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

  factory Report.fromJson(String str) => Report.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Report.fromMap(Map<String, dynamic> json) => Report(
        id: json["id"],
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
        "id": id,
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
