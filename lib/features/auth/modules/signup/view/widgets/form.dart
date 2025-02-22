part of '../screen/signup.screen.dart';

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    final dto = cubit.state.dto;
    final formKey = cubit.formKey;
    return Form(
      key: formKey,
      child: Column(
        spacing: 20.h,
        children: [
          AppTextFormField(
            controller: dto.name,
            title: 'FullName'.tr(context),
            keyboardType: TextInputType.name,
            validator:
                (value) =>
                    value.isValidName
                        ? null
                        : 'InvalidName'.tr(context),
          ),
          AppTextFormField(
            controller: dto.email,
            title: 'Email'.tr(context),
            keyboardType: TextInputType.emailAddress,
            validator:
                (value) =>
                    value.isValidEmail
                        ? null
                        : 'InvalidEmail'.tr(context),
          ),
          AppTextFormField(
            controller: dto.phone,
            title: 'Phone'.tr(context),
            keyboardType: TextInputType.phone,
            validator:
                (value) =>
                    value.isValidPhoneNumber
                        ? null
                        : 'InvalidPhone'.tr(context),
          ),
          AppTextFormField(
            controller: dto.password,
            title: 'Password'.tr(context),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            validator:
                (value) =>
                    value.isValidPassword
                        ? null
                        : 'PasswordConditions'.tr(context),
          ),
          AppTextFormField(
            controller: dto.confirmPassword,
            title: 'ConfirmPassword'.tr(context),
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            validator:
                (value) =>
                    value == dto.password.text
                        ? null
                        : 'PasswordNotMatch'.tr(context),
          ),
        ],
      ),
    );
  }
}
