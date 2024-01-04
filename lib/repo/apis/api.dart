import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  final Dio _dio = Dio();

  Api() {
    _dio.options.baseUrl = 'https://merohostel.hancie-phago.com.np/api';

    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
    ));
  }

  Dio get sendRequest => _dio;
}
 