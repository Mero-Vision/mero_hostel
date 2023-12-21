import 'package:dio/dio.dart';
import 'package:mero_hostel/controller/hostel/postHostelController.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  Dio _dio = Dio();

  Api({String? accessToken}) {
    _dio.options.baseUrl = 'https://merohostel.hancie-phago.com.np/api';

    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
    ));

    // Add access token to all requests if provided
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
