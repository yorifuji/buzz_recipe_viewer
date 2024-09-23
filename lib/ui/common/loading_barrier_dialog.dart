import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void toggleLoadingBarrierDialog(BuildContext context, {required bool isShow}) {
  if (isShow) {
    showGeneralDialog(
      context: context,
      pageBuilder: (
        BuildContext context,
        animation,
        secondaryAnimation,
      ) {
        return const Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        );
      },
    );
  } else {
    if (context.canPop()) {
      context.pop();
    }
  }
}
