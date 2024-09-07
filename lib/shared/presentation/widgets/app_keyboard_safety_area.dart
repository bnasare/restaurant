import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class AppKeyboardSafeView extends StatefulWidget {
  final Widget child;
  final bool shouldHide;
  final bool shiftContent;
  const AppKeyboardSafeView(
      {super.key,
      required this.child,
      this.shiftContent = true,
      this.shouldHide = false});

  @override
  State<AppKeyboardSafeView> createState() => _AppKeyboardSafeViewState();
}

class _AppKeyboardSafeViewState extends State<AppKeyboardSafeView> {
  late ValueNotifier<double> _keyboardSize;

  @override
  void initState() {
    super.initState();
    _keyboardSize = ValueNotifier<double>(0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _keyboardSize.value = MediaQuery.of(context).viewInsets.bottom;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isVisible) {
        if (widget.shouldHide && isVisible) {
          return const SizedBox.shrink();
        }

        if (widget.shiftContent) {
          return Padding(
            padding: EdgeInsets.only(bottom: _keyboardSize.value),
            child: widget.child,
          );
        }

        return Transform.translate(
          offset: Offset(0, -_keyboardSize.value),
          child: widget.child,
        );
      },
    );
  }
}
