part of '../screen/login.screen.dart';

class _Form extends ResponsiveWidget<LoginStrings> {
  const _Form({super.strings});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final key = cubit.formKey;
    final dto = cubit.state.loginDTO;
    return Form(
      key: key,
      child: Column(
        children: [
          AppTextFormField(
            title: strings.email,
            controller: dto.login,
            keyboardType: TextInputType.emailAddress,
            validator:
                (value) =>
                    value.isValidLogin ? null : strings.invalidEmail,
          ),
          heightSpace(22),
          AppTextFormField(
            title: strings.password,
            controller: dto.password,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            validator:
                (value) =>
                    value.isValidPassword
                        ? null
                        : strings.invalidPassword,
          ),
          heightSpace(8),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: AppTextButton(
              title: strings.forgotPassword,
              onTap: () {}, //TODO go to forgot password screen
            ),
          ),
        ],
      ),
    );
  }
}
