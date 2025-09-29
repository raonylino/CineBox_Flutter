import 'package:cinebox/data/core/rest_client/backend_rest_client_provider.dart';
import 'package:cinebox/data/services/auth/auth_service.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service_impl.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services_provider.g.dart';

@riverpod
GoogleSigninService googleSignInService(Ref ref) {
  return GoogleSigninServiceImpl();
}

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return LocalStorageServiceImpl(flutterSecureStorage: FlutterSecureStorage());
}

@riverpod
AuthService authService(Ref ref) {
  final dio = ref.read(backendRestClientProvider);
  return AuthService(dio);
}
