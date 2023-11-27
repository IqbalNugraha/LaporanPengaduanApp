import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:skripsi_project/data/models/request/auth/login_request_model.dart';
import 'package:skripsi_project/data/models/request/auth/register_request_model.dart';
import 'package:skripsi_project/data/models/response/auth_response_failed_model.dart';
import 'package:skripsi_project/data/models/response/auth_response_model.dart';

import '../../common/constans/api_services.dart';
import '../../common/constans/variables.dart';

class AuthRemoteDatasource {
  final headers = {
    "Content-Type": "application/json",
  };

  Future<Either<AuthFailedResponseModel, AuthResponseModel>> register(
    RegisterRequestModel model,
  ) async {
    final url = Uri.parse(ApiServices.baseUrl + ApiServices.register);
    final response = await http
        .post(
      url,
      headers: headers,
      body: model.toJson(),
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (ApiServices.errorStatusCodes.contains(response.statusCode)) {
      return Left(AuthFailedResponseModel.fromJson(response.body));
    } else {
      return Left(AuthFailedResponseModel.fromJson(response.body));
    }
  }

  Future<Either<AuthFailedResponseModel, AuthResponseModel>> login(
    LoginRequestModel model,
  ) async {
    final url = Uri.parse(ApiServices.baseUrl + ApiServices.login);
    final response = await http
        .post(
      url,
      headers: headers,
      body: model.toJson(),
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else if (ApiServices.errorStatusCodes.contains(response.statusCode)) {
      return Left(AuthFailedResponseModel.fromJson(response.body));
    } else {
      return Left(AuthFailedResponseModel.fromJson(response.body));
    }
  }
}
