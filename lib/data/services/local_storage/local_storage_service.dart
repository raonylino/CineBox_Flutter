import 'package:cinebox/config/result/result.dart';

abstract interface class LocalStorageService {
  Future<Result<Unit>> saveToken(String token);

  Future<Result<String>> getIdToken();

  Future<Result<Unit>> removeIdToken();
}
