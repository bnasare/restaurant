import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../theme/extra_colors.dart';

class SnackBarHelper {
  static void showSuccessSnackBar(BuildContext context, String message) {
    _showCustomSnackBar(
      context,
      message,
      Icons.check,
      const Color(0xFF50C878),
    );
  }

  static void showInfoSnackBar(BuildContext context, String message) {
    _showCustomSnackBar(
      context,
      message,
      IconlyLight.info_circle,
      const Color(0xFF2196F3),
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    _showCustomSnackBar(
      context,
      message,
      Icons.cancel_outlined,
      const Color(0xFFF44336),
    );
  }

  static void showWarningSnackBar(BuildContext context, String message) {
    _showCustomSnackBar(
      context,
      message,
      IconlyLight.danger,
      const Color(0xFFFF9800),
    );
  }

  static void _showCustomSnackBar(
    BuildContext context,
    String message,
    IconData icon,
    Color color,
  ) {
    showTopSnackBar(
      Overlay.of(context),
      Material(
        color: Colors.transparent,
        child: Container(
          height: 50,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: ExtraColors.white,
            boxShadow: [
              BoxShadow(
                color: ExtraColors.darkGrey.withOpacity(0.5),
                offset: const Offset(0, 1),
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color,
                size: 18,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 10),
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ),
      ),
      displayDuration: const Duration(seconds: 5),
    );
  }
}
