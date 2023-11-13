import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      cursorColor: AppColors.of(context).text,
      style: AppFonts.normal15,
      controller: controller,
      placeholderStyle: AppFonts.normal16
          .copyWith(color: AppColors.of(context).textFieldText),
      placeholder: placeholder,
      padding: const EdgeInsets.all(
        AppDimens.PADDING_16,
      ),
      decoration: BoxDecoration(
        color: AppColors.of(context).secondaryBg,
        borderRadius: BorderRadius.circular(
          AppDimens.RADIUS_0,
        ),
      ),
    );
  }
}
