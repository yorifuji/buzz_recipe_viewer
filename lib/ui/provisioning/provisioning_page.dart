import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/model/auth_exception.dart';
import 'package:buzz_recipe_viewer/model/auth_exception_reason.dart';
import 'package:buzz_recipe_viewer/model/auth_result.dart';
import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/provider/anonymous_signin_provider.dart';
import 'package:buzz_recipe_viewer/repository/preference_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProvisioningPage extends HookConsumerWidget {
  const ProvisioningPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(anonymousSignInProvider);

    ref.listen<AsyncValue<Result<AuthResult, AuthException>>>(
        anonymousSignInProvider, (_, next) async {
      if (next is AsyncData) {
        if (next.value?.isSuccess ?? false) {
          await ref
              .read(
                boolPreferenceProvider(Preference.shouldProvisioning).notifier,
              )
              .update(false);
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(t.provisioning.provisioning),
              const SizedBox(height: 16),
              switch (user) {
                AsyncData(:final value) => value.isSuccess
                    ? Text(value.data.user.uid)
                    : Column(
                        children: [
                          Text(value.error.message),
                          ElevatedButton(
                            onPressed: () {
                              ref.invalidate(anonymousSignInProvider);
                            },
                            child: Text(t.provisioning.retry),
                          ),
                        ],
                      ),
                AsyncError() => ElevatedButton(
                    onPressed: () {
                      ref.invalidate(anonymousSignInProvider);
                    },
                    child: Text(t.provisioning.retry),
                  ),
                _ => const CircularProgressIndicator(strokeWidth: 2),
              },
            ],
          ),
        ),
      ),
    );
  }
}
