import 'dart:convert';

class ReportRequestModel {
    final String name;
    final String noIdentity;
    final String phoneNumber;
    final String city;
    final String province;
    final String subdistrict;
    final String address;
    final String descriptionReport;
    final String noKip;
    final String noKks;
    final String noBpjs;
    final int account;

    ReportRequestModel({
        required this.name,
        required this.noIdentity,
        required this.phoneNumber,
        required this.city,
        required this.province,
        required this.subdistrict,
        required this.address,
        required this.descriptionReport,
        required this.noKip,
        required this.noKks,
        required this.noBpjs,
        required this.account,
    });

    factory ReportRequestModel.fromJson(String str) => ReportRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ReportRequestModel.fromMap(Map<String, dynamic> json) => ReportRequestModel(
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
        account: json["account"],
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
        "account": account,
    };
}
