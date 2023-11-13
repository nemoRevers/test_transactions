part of core_ui;

abstract class AppColors {
  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? const LightColors()
        : const DarkColors();
  }

  Color get text;

  Color get textFieldText;

  Color get subText;

  Color get icon;

  Color get warning;

  Color get buttonAccent;

  Color get button;

  Color get primaryBg;

  Color get divider;

  Color get secondaryBg;
}

class DarkColors extends LightColors {
  const DarkColors();
}

class LightColors implements AppColors {
  const LightColors();

  @override
  Color get text => const Color(0xFF000000);

  @override
  Color get subText => const Color(0xFF929292);

  @override
  Color get icon => const Color(0xFF000000);

  @override
  Color get warning => const Color(0xFFEC3A4D);

  @override
  Color get primaryBg => const Color(0xFFF3F4F6);

  @override
  Color get secondaryBg => const Color(0xFFFEFEFE);

  @override
  Color get buttonAccent => const Color(0xFF4631D2);

  @override
  Color get button => const Color(0xFF000000);

  @override
  Color get divider => const Color(0xFFE0E6ED);

  @override
  Color get textFieldText => const Color(0xFFC3C3C3);
}
