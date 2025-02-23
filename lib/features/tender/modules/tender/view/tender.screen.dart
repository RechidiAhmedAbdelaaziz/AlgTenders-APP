import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/extension/date_formatter.extension.dart';
import 'package:tender_app/core/extension/localization.extension.dart';
import 'package:tender_app/core/shared/classes/dimensions.dart';
import 'package:tender_app/core/themes/colors.dart';
import 'package:tender_app/features/announcer/data/model/announcer.model.dart';
import 'package:tender_app/features/sources/ui/sources.dart';
import 'package:tender_app/features/tender/modules/tender/logic/tender.cubit.dart';

part 'tender.mobile.dart';
part 'tender.web.dart';
part '../widget/announcer_info.dart';
part '../widget/tender_info.dart';
part '../widget/result_button.dart';

class TenderScreen extends StatelessWidget {
  static const route = '/tender/:id';
  const TenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const _Mobile();
        } else {
          return const _Web();
        }
      },
    );
  }
}
