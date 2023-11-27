import 'dart:convert';

class LoginRequestModel {
    final LoginModel data;

    LoginRequestModel({
        required this.data,
    });

    factory LoginRequestModel.fromJson(String str) => LoginRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginRequestModel.fromMap(Map<String, dynamic> json) => LoginRequestModel(
        data: LoginModel.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data.toMap(),
    };
}

class LoginModel {
    final String email;
    final String password;

    LoginModel({
        required this.email,
        required this.password,
    });

    factory LoginModel.fromJson(String str) => LoginModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
    };
}
