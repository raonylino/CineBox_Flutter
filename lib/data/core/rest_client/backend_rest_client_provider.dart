import 'package:cinebox/config/env.dart';
import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/data/services/services_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backend_rest_client_provider.g.dart';

class BackendAuthInterceptor extends Interceptor {
  final Ref ref;
  BackendAuthInterceptor({required this.ref});
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final localStorageService = ref.read(localStorageServiceProvider);
    final idTokenResult = await localStorageService.getIdToken();
    if (idTokenResult case Success<String>(value: final token)) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

@Riverpod(keepAlive: true)
Dio backendRestClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.backendBaseUrl,
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ),
  );

  dio.options.headers['content-Type'] = 'application/json';
  dio.interceptors.addAll([
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ),
  ]);
  return dio;
}
