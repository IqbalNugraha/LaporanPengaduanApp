import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:skripsi_project/data/models/request/report/report_request_model.dart';
import 'package:skripsi_project/data/models/response/report/report_response_model.dart';
import 'package:skripsi_project/data/models/response/report/report_update_response_model.dart';

import '../../../common/constans/api_services.dart';
import '../../../common/constans/variables.dart';
import '../local_datasources.dart';

class ReportRemoteDatasource {
  //get
  Future<Either<String, ReportResponseModel>> getReport() async {
    final token = await LocalDatasource().getToken();
    final id = await LocalDatasource().getId();
    final url = Uri.parse(
        "${ApiServices.baseUrl + ApiServices.report}?populate=*&filters[account][id][\$eq]=$id");
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final response = await http
        .get(
      url,
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (ApiServices.validStatusCodes.contains(response.statusCode)) {
      return Right(ReportResponseModel.fromJson(response.body));
    } else {
      return const Left(Variables.msgHttp500);
    }
  }

  //post

  Future<Either<String, ReportUpdateResponseModel>> addEducation(
    ReportRequestModel model,
    http.MultipartFile? file,
  ) async {
    final token = await LocalDatasource().getToken();
    final url = Uri.parse(ApiServices.baseUrl + ApiServices.report);
    final headers = {
      "Authorization": "Bearer $token",
    };
    var request = http.MultipartRequest("POST", url);
    request.headers.addAll(headers);
    request.fields["data"] = model.toJson();
    file != null ? request.files.add(file) : null;
    final response = await request.send();
    final responseUpdateUser = await http.Response.fromStream(response).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (ApiServices.validStatusCodes.contains(responseUpdateUser.statusCode)) {
      return Right(ReportUpdateResponseModel.fromJson(responseUpdateUser.body));
    } else if (responseUpdateUser.statusCode == 408) {
      return const Left(Variables.msgHttp408);
    } else {
      return const Left(Variables.msgHttp500);
    }
  }

  //put

  Future<Either<String, ReportUpdateResponseModel>> editEducation(
    ReportRequestModel model,
    http.MultipartFile? file,
    int id,
  ) async {
    final token = await LocalDatasource().getToken();
    final url = Uri.parse("${ApiServices.baseUrl + ApiServices.report}/$id");
    final headers = {
      "Authorization": "Bearer $token",
    };
    var request = http.MultipartRequest("PUT", url);
    request.headers.addAll(headers);
    request.fields["data"] = model.toJson();
    file != null ? request.files.add(file) : null;
    final response = await request.send();
    final responseUpdateUser = await http.Response.fromStream(response).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (ApiServices.validStatusCodes.contains(responseUpdateUser.statusCode)) {
      return Right(ReportUpdateResponseModel.fromJson(responseUpdateUser.body));
    } else if (responseUpdateUser.statusCode == 408) {
      return const Left(Variables.msgHttp408);
    } else {
      return const Left(Variables.msgHttp500);
    }
  }

  //delete
  Future<Either<String, ReportUpdateResponseModel>> deleteReport(int id) async {
    final token = await LocalDatasource().getToken();
    final url = Uri.parse(
        "${ApiServices.baseUrl + ApiServices.report}/$id");
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    final response = await http
        .delete(
      url,
      headers: headers,
    )
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (ApiServices.validStatusCodes.contains(response.statusCode)) {
      return Right(ReportUpdateResponseModel.fromJson(response.body));
    } else {
      return const Left(Variables.msgHttp500);
    }
  }
}
