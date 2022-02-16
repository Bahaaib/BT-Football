import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class RequestUtil {
  final Dio _dio = Dio();
  late DioAdapter _dioAdapter;

  Dio get mockHttpClient {
    _dioAdapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = _dioAdapter;
    return _dio;
  }
}
