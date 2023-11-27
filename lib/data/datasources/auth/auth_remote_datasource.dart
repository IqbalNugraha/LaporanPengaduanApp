import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:skripsi_project/data/models/request/auth/login_request_model.dart';
import 'package:skripsi_project/data/models/request/auth/register_request_model.dart';
import 'package:skripsi_project/data/models/response/auth/login_response_model.dart';
import 'package:skripsi_project/data/models/response/auth/register_response_model.dart';

import '../../../common/constans/api_services.dart';
import '../../../common/constans/variables.dart';

class AuthRemoteDatasource {
  final headers = {
    "Content-Type": "application/json",
  };

  Future<Either<String, RegisterResponseModel>> register(
    RegisterModel model,
  ) async {
    final url = Uri.parse(ApiServices.baseUrl + ApiServices.register);
    final response = await http
        .post(
      url,
      headers: headers,
      body: RegisterRequestModel(data: model).toJson(),
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (ApiServices.validStatusCodes.contains(response.statusCode)) {
      return Right(RegisterResponseModel.fromJson(response.body));
    } else {
      return const Left(Variables.msgHttp500);
    }
  }

  Future<Either<String, LoginResponseModel>> login(
    LoginModel model,
  ) async {
    final url = Uri.parse(ApiServices.baseUrl + ApiServices.login);
    final response = await http
        .post(
      url,
      headers: headers,
      body: LoginRequestModel(data: model).toJson(),
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (ApiServices.validStatusCodes.contains(response.statusCode)) {
      return Right(LoginResponseModel.fromJson(response.body));
    } else {
      return const Left(Variables.msgHttp500);
    }
  }
}
