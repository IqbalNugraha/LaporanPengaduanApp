import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:skripsi_project/data/datasources/local_datasources.dart';
import 'package:skripsi_project/data/models/response/account/account_detail_response.dart';

import '../../../common/constans/api_services.dart';
import '../../../common/constans/variables.dart';

class AccountRemoteDatasource {
  Future<Either<String, AccountDetailResponseModel>> getAccount() async {
    final token = await LocalDatasource().getToken();
    final id = await LocalDatasource().getId();
    final url = Uri.parse("${ApiServices.baseUrl + ApiServices.account}/$id?populate=*");
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
      return Right(AccountDetailResponseModel.fromJson(response.body));
    } else {
      return const Left(Variables.msgHttp500);
    }
  }
}
