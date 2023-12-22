// ignore: file_names
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AuthApi {
  final Dio _dio = Dio();

  AuthApi({String? accessToken}) {
    _dio.options.baseUrl = 'https://merohostel.hancie-phago.com.np/api';

    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
    ));

    // Add access token to all requests if provided
    print('ok xa ta ');
    print(accessToken);
    if (accessToken != null) {
      _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Authorization"] = "Bearer $accessToken";
          return handler.next(options);
        },
      ));
    }
  }

  Dio get sendRequest => _dio;
}
