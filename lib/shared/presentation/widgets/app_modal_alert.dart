import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_spacer.dart';
import '../../constants/app_text.dart';
import '../../constants/decorations.dart';
import 'app_button.dart';

class AppModalAlert extends StatelessWidget {
  final String? title;
  final String? description;
  final String? buttonText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const AppModalAlert(
      {super.key,
      this.title,
      this.description,
      this.buttonText,
      this.cancelText,
      this.onConfirm,
      this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.3),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SmoothContainer(
                    smoothness: 1,
                    color: Colors.white,
                    borderRadius: AppDecorations.cardRadius,
                    padding: const EdgeInsets.all(AppSizes.contentPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText.medium(
                          title ?? 'Want to delete this employee',
                        ),
                        const AppSpacer.vShorter(),
                        AppText.smaller(
                          description ??
                              'Are you sure you want to delete this employee? This action cannot be undone.',
                        ),
                        const AppSpacer.vLarge(),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: AppButton(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                text: cancelText ?? 'Cancel',
                                textColor: Colors.black,
                                onTap: () {
                                  onCancel?.call();
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            const AppSpacer.hShort(),
                            Flexible(
                              flex: 2,
                              child: AppButton(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                backgroundColor: AppColors.danger[600],
                                text: buttonText ?? 'Delete',
                                textColor: Colors.white,
                                onTap: () {
                                  onConfirm?.call();
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
