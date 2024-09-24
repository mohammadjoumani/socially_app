import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:socially_app/core/services/app_prefs.dart';
import 'package:socially_app/core/services/network_info.dart';
import 'package:socially_app/core/utils/resource/routes_manager.dart';
import 'package:socially_app/features/generic/presentation/main/view/main_app.dart';
import 'error_handler.dart';

const String authorization = "Authorization";
const String defaultLanguage = "language";

class ApiService {
  final Dio _dio1;
  final Dio _dio2;
  final NetworkInfo _networkInfo;
  final AppPreferences _appPref;

  ApiService(
    this._dio1,
    this._dio2,
    this._networkInfo,
    this._appPref,
  ) {
    _dio1.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onError: _onError,
      ),
    );
  }

  //region Init function for interceptor

  _onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (await _networkInfo.isConnected) {
      String? token = _appPref.getToken();

      options.headers['Authorization'] = 'Bearer $token';
      options.headers['language'] = _appPref.getAppLanguage();

      return handler.next(options);
    } else {
      return handler.reject(
        DioException(
          requestOptions: options,
          response: Response(
            requestOptions: options,
            statusCode: ResponseCode.noInternetConnection,
            statusMessage: ResponseMessage.noInternetConnection,
          ),
          error: ResponseMessage.noInternetConnection,
        ),
      );
    }
  }

  _onError(DioException e, ErrorInterceptorHandler handler) async {
    if (e.response?.statusCode == 401 && _appPref.isUserLogged()) {
      _refreshToken(e, handler);
    } else {
      handler.next(e);
    }
  }

  Future<void> _refreshToken(DioException e, ErrorInterceptorHandler handler) async {
    // try {
    //   final refreshToken = _appPref.getRefreshToken();
    //   final response = await _dio2.post(
    //     ConstantsApi.refreshTokenUrl,
    //     data: {'refreshToken': refreshToken},
    //     options: Options(
    //       headers: {
    //         'payername': Constants.payerName,
    //       },
    //     ),
    //   );
    //   _appPref.setToken(response.data['accessToken']);
    //   _appPref.setRefreshToken(response.data['refreshToken']);
    //   handler.resolve(await _dio1.fetch(e.requestOptions));
    // } catch (error) {
    //   if (error is DioException) {
    //     if (error.response?.statusCode == 401) {
    //       _logout();
    //       handler.reject(e);
    //     } else if (error.response?.statusCode == 423) {
    //       _logout();
    //       handler.reject(e);
    //     } else {
    //       handler.next(error);
    //     }
    //   } else {
    //     handler.next(e);
    //   }
    // }
  }

  void _logout() {
    final context = navigatorKey?.currentState?.context;
    if (context!.mounted) {
      // _appPref.logout();
      Navigator.pushNamedAndRemoveUntil(context, Routes.splashRoute, (route) => false);
    }
  }

  //endregion

  Future<dynamic> get({
    required String url,
    dynamic data,
    dynamic params,
    Map<String, dynamic>? customHeaders,
  }) async {
    var response = await _dio1.get(
      url,
      data: data,
      queryParameters: params,
      options: Options(
        headers: customHeaders ?? {},
      ),
    );
    return response.data;
  }

  Future<dynamic> post({
    required String url,
    dynamic data,
    dynamic params,
    Map<String, dynamic>? customHeaders,
  }) async {
    var response = await _dio1.post(
      url,
      data: data,
      queryParameters: params,
      options: Options(
        headers: customHeaders ?? {},
      ),
    );
    return response.data;
  }

  Future<dynamic> put({
    required String url,
    dynamic data,
    dynamic params,
    Map<String, dynamic>? customHeaders,
  }) async {
    final response = await _dio1.put(
      url,
      data: data,
      queryParameters: params,
      options: Options(
        headers: customHeaders ?? {},
      ),
    );
    return response.data;
  }

  Future<dynamic> patch({
    required String url,
    dynamic data,
    dynamic params,
    Map<String, dynamic>? customHeaders,
  }) async {
    final response = await _dio1.patch(
      url,
      data: data,
      queryParameters: params,
      options: Options(
        headers: customHeaders ?? {},
      ),
    );
    return response.data;
  }

  Future<dynamic> delete({
    required String url,
    dynamic data,
    dynamic params,
    Map<String, dynamic>? customHeaders,
  }) async {
    final response = await _dio1.delete(
      url,
      data: data,
      queryParameters: params,
      options: Options(
        headers: customHeaders ?? {},
      ),
    );
    return response.data;
  }
}
