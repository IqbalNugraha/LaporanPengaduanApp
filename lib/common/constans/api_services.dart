class ApiServices {
  static const String baseUrl = "https://5b75-103-147-8-59.ngrok-free.app";

  static const String register = "/api/auth/local/register";
  static const String login = "/api/auth/local";

  static const Set<int> errorStatusCodes = {400, 401, 403, 404, 500};
}
