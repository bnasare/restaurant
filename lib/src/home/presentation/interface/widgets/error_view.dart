import 'package:flutter/material.dart';
import 'package:restaurant/shared/constants/app_text.dart';
import 'package:restaurant/shared/presentation/theme/extra_colors.dart';

class ErrorView extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const ErrorView({super.key, required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error, style: const TextStyle(color: ExtraColors.crimson)),
          ElevatedButton(
            onPressed: onRetry,
            child: const AppText.smaller('Retry'),
          ),
        ],
      ),
    );
  }
}
