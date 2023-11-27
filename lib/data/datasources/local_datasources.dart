import 'package:shared_preferences/shared_preferences.dart';
import 'package:skripsi_project/data/models/response/auth/login_response_model.dart';

class LocalDatasource {
  Future<void> saveAuthData(LoginResponseModel model) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth', model.toJson());
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth');
  }

  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = LoginResponseModel.fromJson(authJson);
    return authData.data?.jwt ?? '';
  }

  Future<String> getUsername() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = LoginResponseModel.fromJson(authJson);
    return authData.data?.attributes?.name ?? '';
  }

  Future<int> getId() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = LoginResponseModel.fromJson(authJson);
    return authData.data?.id ?? 0;
  }

  Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    return authJson.isNotEmpty;
  }
}
