// ignore: file_names
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AuthApi {
  final Dio _dio = Dio();

  AuthApi() {
    _dio.options.baseUrl = 'https://merohostel.hancie-phago.com.np';

    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      request: true,
    ));

    // _dio.options.headers["Authorization"] = "Bearer $accessToken";
    // _dio.options.headers["Content-Type"] = "multipart/form-data";
  }

  Dio get sendRequest => _dio;
}
