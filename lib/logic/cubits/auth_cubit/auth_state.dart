part of 'auth_cubit.dart';

@immutable
abstract class AuthState {
  final String error;

  const AuthState({this.error = ''});
}

// Initial state (not loading)
class AuthInitial extends AuthState {
  const AuthInitial();
}

// SignIn States
class AuthSignIn_Loading extends AuthState {
  const AuthSignIn_Loading();
}

class AuthSignIn_SuccessVerified extends AuthState {
  const AuthSignIn_SuccessVerified();
}

class AuthSignIn_SuccessNotVerified extends AuthState {
  const AuthSignIn_SuccessNotVerified();
}

class AuthSignIn_Failure extends AuthState {
  const AuthSignIn_Failure({required super.error});
}

// SignUp States
class AuthSignUp_Loading extends AuthState {
  const AuthSignUp_Loading();
}

class AuthSignUp_Success extends AuthState {
  const AuthSignUp_Success();
}

class AuthSignUp_Failure extends AuthState {
  const AuthSignUp_Failure({required super.error});
}
