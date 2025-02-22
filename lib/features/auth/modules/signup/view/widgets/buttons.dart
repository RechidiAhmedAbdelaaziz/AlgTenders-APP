part of '../screen/signup.screen.dart';

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubmitButton(
          title: 'Signup'.tr(context),
          onTap: context.read<SignupCubit>().signup,
          isLoading: context.select(
            (SignupCubit cubit) => cubit.state.isLoading,
          ),
        ),
        heightSpace(16),
        SubmitButton(
          title: 'Login'.tr(context),
          onTap: () => context.off(AuthNavigator.login()),
          color: KColors.white,
          textColor: KColors.primary,
        ),
      ],
    );
  }
}
