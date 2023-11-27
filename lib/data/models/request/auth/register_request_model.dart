import 'dart:convert';

class RegisterRequestModel {
    final RegisterModel data;

    RegisterRequestModel({
        required this.data,
    });

    factory RegisterRequestModel.fromJson(String str) => RegisterRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterRequestModel.fromMap(Map<String, dynamic> json) => RegisterRequestModel(
        data: RegisterModel.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data.toMap(),
    };
}

class RegisterModel {
    final String name;
    final String email;
    final String password;

    RegisterModel({
        required this.name,
        required this.email,
        required this.password,
    });

    factory RegisterModel.fromJson(String str) => RegisterModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RegisterModel.fromMap(Map<String, dynamic> json) => RegisterModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "password": password,
    };
}
