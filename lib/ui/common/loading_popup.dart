import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void toggleLoadingPopup(
  BuildContext context, {
  required bool isShow,
  String? message,
  Color? backgroundColor,
  Color? textColor,
  Color? progressColor,
}) {
  if (isShow) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.transparent,
      pageBuilder: (
        BuildContext context,
        animation,
        secondaryAnimation,
      ) {
        return _LoadingOverlay(
          message: message,
          backgroundColor: backgroundColor,
          textColor: textColor,
          progressColor: progressColor,
        );
      },
    );
  } else {
    if (context.canPop()) {
      context.pop();
    }
  }
}

class _LoadingOverlay extends StatelessWidget {
  const _LoadingOverlay({
    required this.message,
    required this.backgroundColor,
    required this.textColor,
    required this.progressColor,
  });

  final String? message;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? progressColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color:
                backgroundColor ?? Theme.of(context).colorScheme.surfaceBright,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  color:
                      progressColor ?? Theme.of(context).colorScheme.onSurface,
                  strokeWidth: 2,
                ),
              ),
              if (message != null) ...[
                const SizedBox(height: 16),
                Text(
                  message!,
                  style: TextStyle(
                    color: textColor ?? Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
