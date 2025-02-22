import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/extension/date_formatter.extension.dart';
import 'package:tender_app/core/extension/localization.extension.dart';
import 'package:tender_app/core/shared/classes/dimensions.dart';
import 'package:tender_app/core/shared/widgets/pagination_builder.dart';
import 'package:tender_app/core/shared/widgets/search_bar.dart';
import 'package:tender_app/core/themes/colors.dart';
import 'package:tender_app/features/tender/data/models/tender.model.dart';
import 'package:tender_app/features/tender/modules/tenders/logic/tenders.cubit.dart';

part 'tenders.mobile.dart';
part 'tenders.web.dart';
part '../widgets/tender.dart';

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
