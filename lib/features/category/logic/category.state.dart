// ignore_for_file: library_private_types_in_public_api

part of 'category.cubit.dart';

enum _CategoryStatus { initial, loading, loaded }

class CategoryState {
  final List<CategoryModel> categories;
  final _CategoryStatus status;

  CategoryState({
    required this.categories,
    this.status = _CategoryStatus.initial,
  });

  factory CategoryState.initial() => CategoryState(categories: []);

  CategoryState _loading() {
    return _copyWith(status: _CategoryStatus.loading);
  }

  CategoryState _loaded(List<CategoryModel> categories) {
    return _copyWith(
      categories: categories,
      status: _CategoryStatus.loaded,
    );
  }

  CategoryState _copyWith({
    List<CategoryModel>? categories,
    _CategoryStatus? status,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }
}
