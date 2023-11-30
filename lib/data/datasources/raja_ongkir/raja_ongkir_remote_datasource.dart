import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../common/constans/api_services.dart';
import '../../../common/constans/variables.dart';
import '../../models/response/raja_ongkir/city_response_model.dart';
import '../../models/response/raja_ongkir/province_response_model.dart';
import '../../models/response/raja_ongkir/subdistrict_response_model.dart';

class RajaOngkirRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvinces() async {
    final url = Uri.parse('${ApiServices.baseUrlRajaOngkir}/province');
    final response = await http.get(
      url,
      headers: {
        'key': ApiServices.rajaOngkirKey,
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (ApiServices.validStatusCodes.contains(response.statusCode)) {
      return Right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return const Left(Variables.msgHttp500);
    }
  }

  Future<Either<String, CityResponseModel>> getCities(
    String provinceId,
  ) async {
    final url =
        Uri.parse('${ApiServices.baseUrlRajaOngkir}/city?province=$provinceId');
    final response = await http.get(
      url,
      headers: {
        'key': ApiServices.rajaOngkirKey,
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (ApiServices.validStatusCodes.contains(response.statusCode)) {
      return Right(CityResponseModel.fromJson(response.body));
    } else {
      return const Left(Variables.msgHttp500);
    }
  }

  Future<Either<String, SubDistrictResponseModel>> getSubDistrict(
    String cityId,
  ) async {
    final url =
        Uri.parse('${ApiServices.baseUrlRajaOngkir}/subdistrict?city=$cityId');
    final response = await http.get(
      url,
      headers: {
        'key': ApiServices.rajaOngkirKey,
      },
    ).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response(Variables.msgHttp408, 408);
      },
    );

    if (ApiServices.validStatusCodes.contains(response.statusCode)) {
      return Right(SubDistrictResponseModel.fromJson(response.body));
    } else {
      return const Left(Variables.msgHttp500);
    }
  }
}
