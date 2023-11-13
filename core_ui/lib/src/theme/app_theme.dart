part of core_ui;

const LightColors _appColors = LightColors();

final ThemeData lightTheme = ThemeData.light().copyWith(
  // appBarTheme: _getAppBarTheme(),
  scaffoldBackgroundColor: _appColors.primaryBg,
  textTheme: _getTextTheme(),
  inputDecorationTheme: _getInputDecorationTheme(),
  primaryColor: _appColors.primaryBg,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: _appColors.primaryBg,
    primary: _appColors.primaryBg,
  ),
);

TextTheme _getTextTheme() {
  return TextTheme(
    titleMedium: AppFonts.normal15,
    bodyMedium: AppFonts.normal15,
  ).apply(
    bodyColor: _appColors.primaryBg,
    displayColor: _appColors.primaryBg,
  );
}

InputDecorationTheme _getInputDecorationTheme() {
  return InputDecorationTheme(
    hintStyle: AppFonts.normal15.copyWith(color: _appColors.primaryBg),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_12),
      ),
      borderSide: BorderSide(
        color: _appColors.primaryBg,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_12),
      ),
      borderSide: BorderSide(
        color: _appColors.primaryBg,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_6),
      ),
      borderSide: BorderSide(
        color: _appColors.primaryBg,
        width: 2,
      ),
    ),
    labelStyle: AppFonts.normal15.copyWith(color: _appColors.primaryBg),
  );
}
