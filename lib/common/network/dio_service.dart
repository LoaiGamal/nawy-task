import 'package:dio/dio.dart';
import 'package:dio_request_inspector/dio_request_inspector.dart';

const int connectTimeout = 20000;
const int receiveTimeout = 20000;
const String baseUrl = 'https://hiring-tasks.github.io/mobile-app-apis';

final DioRequestInspector dioRequestInspector = DioRequestInspector(
  isInspectorEnabled: true,
);

class DioService {
  final Dio _dio = Dio();

  Future<void> init() async {

    _dio.options = BaseOptions(
      connectTimeout: const Duration(milliseconds: connectTimeout),
      receiveTimeout: const Duration(milliseconds: receiveTimeout),
      responseType: ResponseType.json,
      baseUrl: baseUrl,
    );
    _dio.interceptors
      ..removeImplyContentTypeInterceptor()
      ..add(dioRequestInspector.getDioRequestInterceptor());
  }

  Future<Response<dynamic>> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response<dynamic> response = await _dio.get(
      url,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response<dynamic>> getWithBaseUrl({
    required String baseUrl,
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Dio dio = Dio()
      ..options = BaseOptions(
        connectTimeout: const Duration(milliseconds: connectTimeout),
        receiveTimeout: const Duration(milliseconds: receiveTimeout),
        responseType: ResponseType.json,
        baseUrl: baseUrl,
      );
    dio.interceptors
      ..removeImplyContentTypeInterceptor()
      ..add(dioRequestInspector.getDioRequestInterceptor());
    final Response<dynamic> response = await dio.get(
      url,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response<dynamic>> post(
      String url,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      ) async {
    final Response<dynamic> response = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response<dynamic>> postWithBaseUrl(
      String url,
      dynamic data,
      Map<String, dynamic>? queryParameters, {
        required String baseUrl,
      }) async {
    final Dio dio = Dio();
    dio.interceptors
      ..removeImplyContentTypeInterceptor()
      ..add(dioRequestInspector.getDioRequestInterceptor());
    final Response<dynamic> response = await dio.post(
      baseUrl + url,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response<dynamic>> put(
      String url,
      dynamic data,
      Map<String, dynamic>? queryParameters, {
        Options? options,
      }) async {
    final Response<dynamic> response = await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }

  Future<Response<dynamic>> patch(
      String url,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      ) async {
    final Response<dynamic> response = await _dio.patch(
      url,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response<dynamic>> delete(
      String url,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      ) async {
    final Response<dynamic> response = await _dio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
    );

    return response;
  }
}
