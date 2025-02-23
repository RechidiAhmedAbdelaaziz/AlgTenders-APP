import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/constants/static_data.dart';
import 'package:tender_app/core/extension/bottom_sheet.extension.dart';
import 'package:tender_app/core/extension/date_formatter.extension.dart';
import 'package:tender_app/core/extension/localization.extension.dart';
import 'package:tender_app/core/extension/navigator.extension.dart';
import 'package:tender_app/core/shared/classes/dimensions.dart';
import 'package:tender_app/core/shared/widgets/check_box.dart';
import 'package:tender_app/core/shared/widgets/drop_down_menu.dart';
import 'package:tender_app/core/shared/widgets/multi_drop_down_menu.dart';
import 'package:tender_app/core/shared/widgets/pagination_builder.dart';
import 'package:tender_app/core/shared/widgets/search_bar.dart';
import 'package:tender_app/core/shared/widgets/submit_button.dart';
import 'package:tender_app/core/themes/colors.dart';
import 'package:tender_app/features/announcer/modules/multiannouncers/ui/selectable_announcer.dart';
import 'package:tender_app/features/category/module/cateogry.dropdown.dart';
import 'package:tender_app/features/tender/config/tender.navigator.dart';
import 'package:tender_app/features/tender/data/dto/tender_filters.dto.dart';
import 'package:tender_app/features/tender/data/models/tender.model.dart';
import 'package:tender_app/features/tender/modules/tenders/logic/tenders.cubit.dart';

part 'tenders.mobile.dart';
part 'tenders.web.dart';
part '../widgets/tender.dart';
part '../widgets/tender_filter.dart';

class TendersScreen extends StatelessWidget {
  static const route = '/tenders';
  const TendersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:
          (context, constraints) =>
              constraints.maxWidth < 600
                  ? const _Mobile()
                  : const _Web(),
    );
  }
}
