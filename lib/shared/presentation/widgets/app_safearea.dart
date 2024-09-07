import 'dart:io';

import 'package:flutter/material.dart';

class AppSafeArea extends SafeArea {
  // const AppSafeArea({super.key, required super.child})
  //     : _topOnly = true,
  //       _bottomOnly = true;

  /// Wraps child with SafeArea with space only at the top
  const AppSafeArea.top({
    super.key,
    required super.child,
    this.addExtraSpace = true,
  })  : _topOnly = true,
        _bottomOnly = false;

  /// Wraps child with SafeArea with space only at the bottom
  const AppSafeArea.bottom({
    super.key,
    required super.child,
    this.addExtraSpace = true,
  })  : _topOnly = false,
        _bottomOnly = true;

  final bool _topOnly;
  final bool _bottomOnly;
  final bool addExtraSpace;

  @override
  Widget build(BuildContext context) {
    final double extraSpace = Platform.isAndroid && addExtraSpace ? 10 : 0;
    return SafeArea(
      top: _topOnly,
      bottom: _bottomOnly,
      maintainBottomViewPadding: !_topOnly && !_bottomOnly,
      child: Padding(
        padding: EdgeInsets.only(
          top: _topOnly ? extraSpace : 0,
          bottom: _bottomOnly ? extraSpace : 0,
        ),
        child: child,
      ),
    );
  }
}
