import 'package:aura/localization/l10n.dart';

class AuthException implements Exception {
  final String code;
  final String? message;
  AuthException(this.code, this.message);
}

class EmptyFieldsException implements Exception {
  final String message;
  EmptyFieldsException({
    this.message = authCubit_EmptyFieldsSnackbarTitle,
  });
}
