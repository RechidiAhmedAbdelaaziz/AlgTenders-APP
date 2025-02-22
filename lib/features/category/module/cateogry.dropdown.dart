import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_app/core/extension/localization.extension.dart';
import 'package:tender_app/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:tender_app/core/shared/widgets/multi_drop_down_menu.dart';
import 'package:tender_app/features/category/data/models/catrgory.model.dart';
import 'package:tender_app/features/category/logic/category.cubit.dart';

class CateogryDropdown extends StatelessWidget {
  final ListEditingcontroller<String> controller;
  const CateogryDropdown({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getCategories(),
      child: Builder(
        builder: (context) {
          final items =
              context
                  .watch<CategoryCubit>()
                  .state
                  .categories
                  .subCatories;

          return MultiDropDownMenu(
            items: items,
            controller: controller,
            title: 'Categories'.tr(context),
          );
        },
      ),
    );
  }
}
