import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/features/category/data/repo/catrgory.repo.dart';
import 'package:tender_app/features/category/data/source/category.cache.dart';

class CategoryDependency extends FeaturesDependency {
  @override
  void init() {
    locator.registerLazySingleton(() => CategoryCache());
    locator.registerLazySingleton(() => CategoryRepo());
  }
}
