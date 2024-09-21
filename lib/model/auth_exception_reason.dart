import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/auth_exception.dart';

extension AuthExceptionReason on AuthException {
  String get message => switch (this) {
        AuthException.emailAlreadyInUse => t.error.auth.emailAlreadyInUse,
        AuthException.invalidEmail => t.error.auth.invalidEmail,
        AuthException.operationNotAllowed => t.error.auth.operationNotAllowed,
        AuthException.weakPassword => t.error.auth.weakPassword,
        AuthException.userDisabled => t.error.auth.userDisabled,
        AuthException.userNotFound => t.error.auth.userNotFound,
        AuthException.wrongPassword => t.error.auth.wrongPassword,
        AuthException.providerAlreadyLinked =>
          t.error.auth.providerAlreadyLinked,
        AuthException.invalidCredential => t.error.auth.invalidCredential,
        AuthException.credentialAlreadyInUse =>
          t.error.auth.credentialAlreadyInUse,
        AuthException.invalidVerificationCode =>
          t.error.auth.invalidVerificationCode,
        AuthException.invalidVerificationId =>
          t.error.auth.invalidVerificationId,
        AuthException.adminRestrictedOperation =>
          t.error.auth.adminRestrictedOperation,
        AuthException.internalError => t.error.auth.internalError,
        AuthException.networkRequestFailed => t.error.auth.networkRequestFailed,
        AuthException.unknown => t.error.auth.unknown,
      };
}
