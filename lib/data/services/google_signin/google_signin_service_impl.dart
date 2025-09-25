import 'dart:developer';

import 'package:cinebox/config/result/result.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './google_signin_service.dart';

class GoogleSigninServiceImpl implements GoogleSigninService {
  @override
  Future<Result<String>> isSignedIn() async {
    try {
      final isSignedIn = await GoogleSignIn.instance
          .attemptLightweightAuthentication();

      if (isSignedIn case GoogleSignInAuthentication(
        idToken: final idToken?,
      )) {
        return Success(idToken);
      }
      return Failure('Failed to retrieve ID token from Google is Sign-In');
    } catch (e, s) {
      log(
        'Failed to sign out with Google',
        name: 'GoogleSigninService',
        error: e,
        stackTrace: s,
      );
      return Failure(
        'Error:',
        Exception('Failed to retrieve ID token from Google is Sign-in'),
      );
    }
  }

  @override
  Future<Result<String>> signIn() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(
        scopeHint: [
          'email',
          'profile',
          'openid',
        ],
      );
      if (auth.authentication case GoogleSignInAuthentication(
        idToken: final idToken?,
      )) {
        return Success(idToken);
      }
      return Failure('Failed to retrieve ID token from Google Sign-In');
    } catch (e, s) {
      log(
        'Failed to sign in with Google',
        name: 'GoogleSigninService',
        error: e,
        stackTrace: s,
      );
      return Failure(
        'Error:',
        Exception('Failed to retrieve ID token from Google Sign-in'),
      );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      return sucessOfUnit();
    } catch (e, s) {
      log(
        'Failed to sign out with Google',
        name: 'GoogleSigninService',
        error: e,
        stackTrace: s,
      );
      return Failure(
        'Error:',
        Exception('Failed to retrieve ID token from Google Sign-out'),
      );
    }
  }
}
