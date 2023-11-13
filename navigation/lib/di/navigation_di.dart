import 'package:core/core.dart';

import '../app_router/app_router.dart';

abstract class NavigationDI {
  static void initDependencies() {
    appLocator.registerLazySingleton<AppRouter>(
      AppRouter.new,
    );
  }
}
