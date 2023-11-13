import 'package:core/core.dart';
import 'package:core/localization/app_localization.dart';
import 'package:core_ui/core_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appLocator<AppRouter>();

    return EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.langsFolderPath,
      fallbackLocale: AppLocalization.fallbackLocale,
      child: Builder(builder: (BuildContext context) {
        return MaterialApp.router(
          routerConfig: appRouter.config(),
          theme: lightTheme,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
        );
      }),
    );
  }
}
