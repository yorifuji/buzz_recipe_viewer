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
      AuthException.values.firstWhere((element) => element.code == e.code);

  final String code;
}
