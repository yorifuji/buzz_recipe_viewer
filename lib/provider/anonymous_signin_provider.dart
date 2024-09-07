import 'package:buzz_recipe_viewer/model/auth_exception.dart';
import 'package:buzz_recipe_viewer/model/auth_result.dart';
import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'anonymous_signin_provider.g.dart';

@riverpod
Future<Result<AuthResult, AuthException>> anonymousSignIn(
  AnonymousSignInRef ref,
) async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final token = await user.getIdToken();
      return Result.success(data: (user: user, isNewUser: false, jwt: token!));
    }

    final credential = await FirebaseAuth.instance.signInAnonymously();
    final token = await credential.user!.getIdToken();
    return Result.success(
      data: (
        user: credential.user!,
        isNewUser: credential.additionalUserInfo?.isNewUser ?? false,
        jwt: token!,
      ),
    );
  } on FirebaseAuthException catch (e) {
    return Result.failure(error: AuthException.from(e));
  }
}