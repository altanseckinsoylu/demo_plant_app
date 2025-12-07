import 'package:dio/dio.dart';
import '../constants/network_constants.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = NetworkConstants.baseUrl
      ..options.connectTimeout = const Duration(
        milliseconds: NetworkConstants.connectionTimeout,
      )
      ..options.receiveTimeout = const Duration(
        milliseconds: NetworkConstants.receiveTimeout,
      )
      ..options.responseType = ResponseType.json;
  }

  Future<Response> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
