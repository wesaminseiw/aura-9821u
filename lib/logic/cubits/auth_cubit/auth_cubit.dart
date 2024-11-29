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
      final bool isEmailVerified = await AuthService.checkEmailVerification();
      isEmailVerified == true ? emit(AuthSignIn_SuccessVerified()) : emit(AuthSignIn_SuccessNotVerified());
    } catch (e) {
      if (e is AuthException) {
        emit(AuthSignIn_Failure(error: e.message!));
      } else {
        emit(AuthSignIn_Failure(error: e.toString()));
      }
    }
  }

  Future<void> checkUserState() async {
    final int screen = await AuthService.checkUserState();
    log('checkUserState called. Screen: $screen');

    await Future.delayed(Duration(seconds: 1)); // TODO: change to 3sec

    if (screen == 0) {
      emit(AuthCheck_NoUser());
      log('Emitting AuthCheck_NoUser');
    } else if (screen == 1) {
      emit(AuthCheck_NotVerifiedUser());
      log('Emitting AuthCheck_NotVerifiedUser');
    } else if (screen == 2) {
      emit(AuthCheck_UncustomizedUser());
      log('Emitting AuthCheck_UncustomizedUser');
    } else if (screen == 3) {
      emit(AuthCheck_VerifiedUser());
      log('Emitting AuthCheck_VerifiedUser');
    } else {
      emit(AuthCheck_NoUser());
      log('Emitting default AuthCheck_NoUser');
    }
  }

  void getEmail() {
    try {
      final String email = AuthService.getEmail();
      emit(AuthGetEmail_Success(email: email));
    } catch (e) {
      emit(AuthGetEmail_Failure());
    }
  }

  Future<void> checkEmailVerification() async {
    final bool isVerified = await AuthService.checkEmailVerification();
    if (isVerified == true) {
      if (checkUserState() == 2) {
        emit(AuthCheck_UncustomizedUser());
      }
      emit(AuthCheckVerification_Verified());
    } else {
      emit(AuthCheckVerification_NotVerified());
    }
  }

  Future<void> getUserData() async {
    await AuthService.getUserData();
  }

  // Future<void> deleteUser() async {
  //   emit(AuthDeleteUser_Loading());
  //   try {
  //     await AuthService.deleteAccount();
  //     emit(AuthDeleteUser_Success());
  //   } catch (e) {
  //     if (e is AuthException) {
  //       emit(AuthDeleteUser_Failure(error: e.message!));
  //     }
  //   }
  // }
}
