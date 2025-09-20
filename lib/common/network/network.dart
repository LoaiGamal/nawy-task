import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nawy_task/common/base/global.dart';
import 'package:nawy_task/common/network/dio_service.dart';
import 'package:nawy_task/widgets/common/modal_bottom_sheet_widget.dart';

class Network {
  static final Network _singleton = Network._internal();

  factory Network() => _singleton;

  late DioService _dioService;

  bool shouldShowNetworkError = true;

  Network._internal() {
    initHttpService();
  }

  Future<void> initHttpService() async {
    _dioService = DioService();
    await _dioService.init();
  }

  dynamic handleSuccess({
    required Response<dynamic> response,
    required String url,
    bool? bool,
  }) {
    // Return the response data for successful requests
    return response.data;
  }

  dynamic handleError({
    required DioException dioError,
    bool showConnectionError = true,
  }) {
    String errorMessage = _getErrorMessage(dioError);
    
    if (showConnectionError && shouldShowNetworkError) {
      _showErrorBottomSheet(errorMessage);
    }
    
    // Return the error for further handling if needed
    return {
      'error': true,
      'message': errorMessage,
      'statusCode': dioError.response?.statusCode,
      'dioError': dioError,
    };
  }

  String _getErrorMessage(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.sendTimeout:
        return 'Request timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Response timeout. Please try again.';
      case DioExceptionType.badResponse:
        final statusCode = dioError.response?.statusCode;
        if (statusCode == 401) {
          return 'Unauthorized access. Please login again.';
        } else if (statusCode == 403) {
          return 'Access forbidden. You don\'t have permission.';
        } else if (statusCode == 404) {
          return 'Resource not found.';
        } else if (statusCode == 500) {
          return 'Server error. Please try again later.';
        } else {
          return 'Request failed with status code: $statusCode';
        }
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      case DioExceptionType.badCertificate:
        return 'Certificate error. Please try again.';
      case DioExceptionType.unknown:
        return 'An unexpected error occurred. Please try again.';
      default:
        return 'Network error occurred. Please try again.';
    }
  }

  void _showErrorBottomSheet(String errorMessage) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      ModalBottomSheetWidget.show(
        context: context,
        title: 'Error',
        children: [
          Text(
            errorMessage,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
        actionButton: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0C314E),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          ),
          child: const Text('OK'),
        ),
      );
    }
  }

  Future<dynamic> getData(
    String url, {
    Map<String, dynamic>? queryParameters,
    bool showConnectionError = true,
  }) async {
    try {
      final Response<dynamic> response = await _dioService.get(
        url: url,
        queryParameters: queryParameters,
      );
      return handleSuccess(
        response: response,
        url: url,
      );
    } on DioException catch (dioError) {
      throw handleError(
        dioError: dioError,
        showConnectionError: showConnectionError,
      );
    } catch (dioError) {
      rethrow;
    }
  }

  Future<dynamic> postData(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool showConnectionError = true,
  }) async {
    try {
      final Response<dynamic> response = await _dioService.post(
        url,
        data,
        queryParameters,
      );
      return handleSuccess(response: response, url: url);
    } on DioException catch (dioError) {
      throw handleError(dioError: dioError);
    }
  }

  Future<dynamic> putData(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool showConnectionError = true,
  }) async {
    try {
      final Response<dynamic> response = await _dioService.put(
        url,
        data,
        queryParameters,
      );
      return handleSuccess(response: response, url: url);
    } on DioException catch (dioError) {
      throw handleError(
        dioError: dioError,
      );
    } catch (dioError) {
      rethrow;
    }
  }

  Future<dynamic> patchData(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool showConnectionError = true,
  }) async {
    try {
      final Response<dynamic> response =
          await _dioService.patch(url, data, queryParameters);
      return handleSuccess(response: response, url: url);
    } on DioException catch (dioError) {
      throw handleError(
        dioError: dioError,
      );
    } catch (dioError) {
      rethrow;
    }
  }

  Future<dynamic> deleteData(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool showConnectionError = true,
  }) async {
    try {
      final Response<dynamic> response =
          await _dioService.delete(url, data, queryParameters);
      return handleSuccess(response: response, url: url);
    } on DioException catch (dioError) {
      throw handleError(
        dioError: dioError,
      );
    } catch (dioError) {
      rethrow;
    }
  }

  Future<T> postDataWithBaseUrl<T>(
    String url, {
    required String baseUrl,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response<dynamic> response = await _dioService.postWithBaseUrl(
        url,
        data,
        queryParameters,
        baseUrl: baseUrl,
      );
      return response.data;
    } on DioException catch (dioError) {
      throw dioError.response?.statusCode ?? 0;
    }
  }
}
