part of 'locator.dart';

abstract class FeaturesDependency {
  void init();

  static Future<void> _init() async {
    final dependencies = <FeaturesDependency>[
      AuthDependency(),
      TenderDependency(),
      AnnouncerDependency(),
    ];

    for (final dependency in dependencies) {
      dependency.init();
    }
  }
}
