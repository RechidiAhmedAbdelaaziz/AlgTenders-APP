import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/extension/dialog.extension.dart';
import 'package:tender_app/core/extension/localization.extension.dart';
import 'package:tender_app/core/extension/navigator.extension.dart';
import 'package:tender_app/core/extension/validator.extension.dart';
import 'package:tender_app/core/shared/classes/dimensions.dart';
import 'package:tender_app/core/shared/widgets/submit_button.dart';
import 'package:tender_app/core/shared/widgets/text_form_field.dart';
import 'package:tender_app/core/themes/colors.dart';
import 'package:tender_app/features/auth/config/auth.navigator.dart';
import 'package:tender_app/features/auth/modules/signup/logic/signup.cubit.dart';

part 'signup.mobile.dart';
part 'signup.web.dart';
part '../widgets/buttons.dart';
part '../widgets/form.dart';
part '../widgets/header.dart';

class SignupScreen extends StatelessWidget {
  static const String route = '/signup';
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        state.onError(context.showErrorDialog);
      },
      child: LayoutBuilder(
        builder:
            (context, constraints) =>
                constraints.maxWidth < 600
                    ? const _Mobile()
                    : const _Web(),
      ),
    );
  }
}
