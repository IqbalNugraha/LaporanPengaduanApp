import 'dart:convert';

class AuthFailedResponseModel {
    final dynamic data;
    final Error? error;

    AuthFailedResponseModel({
        this.data,
        this.error,
    });

    factory AuthFailedResponseModel.fromJson(String str) => AuthFailedResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthFailedResponseModel.fromMap(Map<String, dynamic> json) => AuthFailedResponseModel(
        data: json["data"],
        error: json["error"] == null ? null : Error.fromMap(json["error"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data,
        "error": error?.toMap(),
    };
}

class Error {
    final int? status;
    final String? name;
    final String? message;
    final Details? details;

    Error({
        this.status,
        this.name,
        this.message,
        this.details,
    });

    factory Error.fromJson(String str) => Error.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Error.fromMap(Map<String, dynamic> json) => Error(
        status: json["status"],
        name: json["name"],
        message: json["message"],
        details: json["details"] == null ? null : Details.fromMap(json["details"]),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "name": name,
        "message": message,
        "details": details?.toMap(),
    };
}

class Details {
    Details();

    factory Details.fromJson(String str) => Details.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Details.fromMap(Map<String, dynamic> json) => Details(
    );

    Map<String, dynamic> toMap() => {
    };
}
