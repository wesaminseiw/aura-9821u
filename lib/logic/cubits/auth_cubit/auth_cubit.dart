import 'dart:developer';

import 'package:aura/app/utils/exceptions.dart';
import 'package:aura/data/services/firebase_auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signup({
    required String email,
    required String password,
    required String username,
    required String fullName,
  }) async {
    emit(AuthSignUp_Loading());
    log('===== AuthSignUp_Loading() =====');
    try {
      await AuthService.signup(
        email: email,
        password: password,
        fullName: fullName,
        username: username,
      );
      emit(AuthSignUp_Success());
      log('===== AuthSignUp_Success() =====');
    } catch (e) {
      if (e is AuthException) {
        emit(AuthSignUp_Failure(error: e.message!));
        log('===== AuthSignUp_Failure(${e.message}) =====');
      } else {
        emit(AuthSignUp_Failure(error: e.toString()));
        log('===== AuthSignUp_Failure(${e.toString()}) =====');
      }
    }
  }

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    emit(AuthSignIn_Loading());
    try {
      await AuthService.signin(
        email: email,
        password: password,
      );
      final bool isEmailVerified = AuthService.checkEmailVerification();
      isEmailVerified == true ? emit(AuthSignIn_SuccessVerified()) : emit(AuthSignIn_SuccessNotVerified());
    } catch (e) {
      if (e is AuthException) {
        emit(AuthSignIn_Failure(error: e.message!));
      } else {
        emit(AuthSignIn_Failure(error: e.toString()));
      }
    }
  }
}
