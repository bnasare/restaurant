import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/shared/constants/app_colors.dart';

import 'app_sizes.dart';

class AppDecorations {
  AppDecorations._();

  static BoxShadow cardElevationUp = BoxShadow(
    blurRadius: 5,
    offset: const Offset(0, 3),
    color: Colors.black.withOpacity(0.05),
  );
  static BoxShadow cardElevationDown = BoxShadow(
    blurRadius: 5,
    offset: const Offset(0, -3),
    color: Colors.black.withOpacity(0.05),
  );

  static const tinyRadius = SmoothBorderRadius.all(
    SmoothRadius(cornerRadius: AppSizes.radiusSmallest, cornerSmoothing: 0.8),
  );

  static const inputRadius = SmoothBorderRadius.all(
    SmoothRadius(cornerRadius: AppSizes.radiusSmaller, cornerSmoothing: 0.8),
  );

  static const buttonRadius = SmoothBorderRadius.all(
    SmoothRadius(cornerRadius: AppSizes.radiusLarge, cornerSmoothing: 0.8),
  );

  static const tileRadius = SmoothBorderRadius.all(
    SmoothRadius(cornerRadius: AppSizes.radiusSmall, cornerSmoothing: 0.8),
  );

  static const cardRadius = SmoothBorderRadius.all(
    SmoothRadius(
        cornerRadius: AppSizes.radiusMedium * 1.5, cornerSmoothing: 0.8),
  );

  static const cardInnerRadius = SmoothBorderRadius.all(
    SmoothRadius(cornerRadius: AppSizes.radiusMedium, cornerSmoothing: 0.8),
  );

  static const wheelRadius = SmoothBorderRadius.all(
    SmoothRadius(cornerRadius: AppSizes.radiusLarge, cornerSmoothing: 0.8),
  );

  static const alertRadius = SmoothBorderRadius.all(
    SmoothRadius(cornerRadius: AppSizes.radiusLarge, cornerSmoothing: 0.8),
  );

  static const modalRadius = SmoothBorderRadius.all(
    SmoothRadius(
        cornerRadius: AppSizes.radiusLarge * 0.8, cornerSmoothing: 0.2),
  );

  static LinearGradient premiumGradient = LinearGradient(
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
    colors: [
      AppColors.services.shade300.withOpacity(0.5),
      AppColors.primaryLight.withOpacity(0.4)
    ],
  );

  static LinearGradient primaryGradient = LinearGradient(
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
    colors: [AppColors.primary.shade400, AppColors.primary.shade200],
  );

  static LinearGradient buttonGradient = const LinearGradient(
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
    colors: [AppColors.gradientShade1, AppColors.gradientShade2],
  );

  static LinearGradient textGradient = const LinearGradient(
    colors: [Color(0xff3367FF), Color(0xff668DFF), Color(0xffFF61AD)],
    stops: [0, 0.4, 1],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const SystemUiOverlayStyle statusBarLight = SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light,
  );
}
