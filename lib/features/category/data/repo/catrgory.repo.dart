import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/features/category/data/models/catrgory.model.dart';

import '../source/category.cache.dart';

class CategoryRepo {
  final _localSource = locator<CategoryCache>();

  Future<List<CategoryModel>> getCategories() async {
    final jsonData = await _localSource.loadCategories();
    return jsonData.data
            ?.map((e) => CategoryModel.fromJson(e))
            .toList() ??
        [];
  }
}
