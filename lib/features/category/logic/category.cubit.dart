import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/features/category/data/models/catrgory.model.dart';
import 'package:tender_app/features/category/data/repo/catrgory.repo.dart';

part 'category.state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final _repo = locator<CategoryRepo>();

  CategoryCubit() : super(CategoryState.initial());

  void getCategories() async {
    emit(state._loading());
    final categories = await _repo.getCategories();
    emit(state._loaded(categories));
  }
}
