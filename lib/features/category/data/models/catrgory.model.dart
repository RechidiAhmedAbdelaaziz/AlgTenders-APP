class CategoryModel {
  final String title;
  final List<String> subCategories;

  CategoryModel({required this.title, required this.subCategories});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'],
      subCategories: List<String>.from(json['subCategories']),
    );
  }
}

extension CateeoryMapper on List<CategoryModel> {
  List<String> get subCatories => expand((e) => e.subCategories).toList();
}
