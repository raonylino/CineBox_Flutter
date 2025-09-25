import 'dart:developer';

import 'package:cinebox/config/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/services/google_signin/google_signin_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSigninService _googleSigninService;

  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSigninService googleSigninService,
  }) : _localStorageService = localStorageService,
       _googleSigninService = googleSigninService;

  @override
  Future<Result<bool>> isLogged() async {
    final resultToken = await _localStorageService.getIdToken();
    switch (resultToken) {
      case Success<String>():
        return Success(true);
      case Failure<String>():
        return Success(false);
    }
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSigninService.signIn();
    switch (result) {
      case Success<String>(:final value):
        await _localStorageService.saveToken(value);
        return sucessOfUnit();
      case Failure<String>(:final error):
        log(
          'erro ao realizar login',
          name: 'AuthRepository',
          error: error,
        );
        return Failure(
          'Erro:',
          DataException(message: 'erro ao realizar login'),
        );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSigninService.signOut();
    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.removeIdToken();
        switch (removeResult) {
          case Success<Unit>():
            return sucessOfUnit();
          case Failure<Unit>(:final error):
            log(
              'erro ao realizar logout ID token',
              name: 'AuthRepository',
            );
            return Failure(error);
        }
      case Failure<Unit>(:final error):
        log(
          'erro ao realizar logout',
          name: 'AuthRepository',
          error: error,
        );
        return Failure(
          error,
        );
    }
  }
}
