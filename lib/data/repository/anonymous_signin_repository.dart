import 'package:buzz_recipe_viewer/domain/model/auth_exception.dart';
import 'package:buzz_recipe_viewer/domain/model/result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'anonymous_signin_repository.g.dart';

@riverpod
AnonymousSignInRepository anonymousSignInRepository(
  Ref ref,
) =>
    AnonymousSignInRepository();

class AnonymousSignInRepository {
  Future<Result<({User user, bool isNewUser, String jwt}), AuthException>>
      signIn() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final token = await user.getIdToken();
        return Result.success(
          data: (user: user, isNewUser: false, jwt: token!),
        );
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
}
