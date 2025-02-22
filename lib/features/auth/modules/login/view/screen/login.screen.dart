import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/extension/dialog.extension.dart';
import 'package:tender_app/core/extension/navigator.extension.dart';
import 'package:tender_app/core/extension/snackbar.extension.dart';
import 'package:tender_app/core/extension/validator.extension.dart';
import 'package:tender_app/core/shared/classes/dimensions.dart';
import 'package:tender_app/core/shared/classes/responsive/device_screen.dart';
import 'package:tender_app/core/shared/classes/responsive/responsive_screen.dart';
import 'package:tender_app/core/shared/classes/responsive/resposive_widget.dart';
import 'package:tender_app/core/shared/widgets/submit_button.dart';
import 'package:tender_app/core/shared/widgets/text_button.dart';
import 'package:tender_app/core/shared/widgets/text_form_field.dart';
import 'package:tender_app/core/themes/colors.dart';
import 'package:tender_app/features/auth/config/auth.navigator.dart';
import 'package:tender_app/features/auth/modules/login/logic/login.cubit.dart';
import 'package:tender_app/features/tender/config/tender.navigator.dart';

import '../../../../strings/login.strings.dart';

part 'login.mobile.dart';
part 'login.web.dart';
part '../widgets/logo.dart';
part '../widgets/form.dart';
part '../widgets/buttons.dart';

class LoginScreen extends ResponsiveScreen<LoginStrings> {
  static const route = '/login';

  LoginScreen({super.key})
    : super(
        mobileBuilder: (strings) => _Mobile(strings: strings),
        webBuilder: (strings) => _Web(strings: strings),
        strings: (context) => LoginStrings(context),
      );

      
}
