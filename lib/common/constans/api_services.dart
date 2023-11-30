class ApiServices {
  static const String baseUrl = "https://968c-103-147-8-59.ngrok-free.app";
  static const String baseUrlRajaOngkir = "https://pro.rajaongkir.com/api";
  static const String rajaOngkirKey = 'a9da3c4359fafde97f03ee2be60147b2';

  static const String register = "/api/v1/accounts";
  static const String login = "/api/v1/accounts/auth";

  static const String account = "/api/v1/accounts";

  //report
  static const String report = "/api/reports";

  static const Set<int> errorStatusCodes = {400, 401, 403, 404, 500};
  static const Set<int> validStatusCodes = {200, 400, 401, 403, 404, 500};
}
