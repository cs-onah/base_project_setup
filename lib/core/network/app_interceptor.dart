part of network;

class ApiInterceptor extends Interceptor {
  factory ApiInterceptor() => _instance;
  static final ApiInterceptor _instance = ApiInterceptor._internal();

  ApiInterceptor._internal();

  LocalStorageService get localStorage => LocalStorageService();

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? accessToken = localStorage.accessToken;
    if (accessToken != null) {
      options.headers.addAll({
        "Authorization": "Bearer $accessToken",
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return super.onResponse(response, handler);
  }

  // Future<String> _revalidateToken() async {
  //   try {
  //     String path = "user/refreshToken";
  //     final response = await Network.noInterceptor().call(
  //       path,
  //       RequestMethod.post,
  //       data: {'token': localStorage.accessToken, "duration": 31557600},
  //     );
  //     final newToken = response.data["data"]["token"];
  //     localStorage.saveAccessToken(newToken);
  //     return newToken;
  //   } catch (error) {
  //     rethrow;
  //   }
  // }
}
