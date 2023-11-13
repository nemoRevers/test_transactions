enum Flavor {
  dev,
}

class AppConfig {
  final Flavor flavor;

  AppConfig({
    required this.flavor,
  });

  factory AppConfig.fromFlavor(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        break;
    }

    return AppConfig(
      flavor: flavor,
    );
  }
}
