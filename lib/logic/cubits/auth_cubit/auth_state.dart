part of 'auth_cubit.dart';

@immutable
abstract class AuthState {
  final String error;
  final String email;

  const AuthState({
    this.error = '',
    this.email = '',
  });
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

// Check States
class AuthCheck_NoUser extends AuthState {
  const AuthCheck_NoUser();
}

class AuthCheck_VerifiedUser extends AuthState {
  const AuthCheck_VerifiedUser();
}

class AuthCheck_UncustomizedUser extends AuthState {
  const AuthCheck_UncustomizedUser();
}

class AuthCheck_NotVerifiedUser extends AuthState {
  const AuthCheck_NotVerifiedUser();
}

// Check States
class AuthCheckVerification_Verified extends AuthState {
  const AuthCheckVerification_Verified();
}

class AuthCheckVerification_NotVerified extends AuthState {
  const AuthCheckVerification_NotVerified();
}

// GetEmail States
class AuthGetEmail_Success extends AuthState {
  const AuthGetEmail_Success({required super.email});
}

class AuthGetEmail_Failure extends AuthState {
  const AuthGetEmail_Failure();
}

// // Check States
// class AuthDeleteUser_Loading extends AuthState {
//   const AuthDeleteUser_Loading();
// }

// class AuthDeleteUser_Success extends AuthState {
//   const AuthDeleteUser_Success();
// }

// class AuthDeleteUser_Failure extends AuthState {
//   const AuthDeleteUser_Failure({required super.error});
// }
