import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/features/tender/data/repository/tender.repo.dart';
import 'package:tender_app/features/tender/data/source/tender.api.dart';

class TenderDependency extends FeaturesDependency {
  @override
  void init() {
    locator.registerLazySingleton(() => TenderApi(locator()));
    locator.registerLazySingleton(() => TenderRepo());
  }
}
