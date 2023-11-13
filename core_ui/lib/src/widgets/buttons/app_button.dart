import 'package:flutter/cupertino.dart';

import '../../../core_ui.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const AppButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.PADDING_20,
      ),
      color: AppColors.of(context).buttonAccent,
      borderRadius: BorderRadius.circular(
        AppDimens.PADDING_6,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
