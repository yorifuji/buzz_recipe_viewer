import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Firebase Auth Exception for email auth and link with credential
enum AuthException implements Exception {
  // email auth
  emailAlreadyInUse('email-already-in-use'),
  invalidEmail('invalid-email'),
  operationNotAllowed('operation-not-allowed'),
  weakPassword('weak-password'),
  userDisabled('user-disabled'),
  userNotFound('user-not-found'),
  wrongPassword('wrong-password'),
  // link with credential
  providerAlreadyLinked('provider-already-linked'),
  invalidCredential('invalid-credential'),
  credentialAlreadyInUse('credential-already-in-use'),
  invalidVerificationCode('invalid-verification-code'),
  invalidVerificationId('invalid-verification-id'),
  adminRestrictedOperation('admin-restricted-operation'),
  // other
  internalError('internal-error'),
  networkRequestFailed('network-request-failed'),
  unknown(''),
  ;

  const AuthException(this.code);
  factory AuthException.from(FirebaseAuthException e) =>
      AuthException.values.firstWhere(
        (element) => element.code == e.code,
        orElse: () => AuthException.unknown,
      );

  final String code;
}

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
