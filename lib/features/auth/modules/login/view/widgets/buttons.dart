part of '../screen/login.screen.dart';

class _Buttons extends ResponsiveWidget<LoginStrings> {
  const _Buttons({required super.strings});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Column(
      children: [
        SubmitButton(
          title: strings.login,
          onTap: cubit.login,
          isLoading: context.select(
            (LoginCubit cubit) => cubit.state.isLoading,
          ),
        ),
        heightSpace(16),
        SubmitButton(
          title: strings.createAnAccount,
          onTap:
              () => context.off(
                AuthNavigator.signup(),
              ), //TODO go to create account screen
          color: KColors.white,
          textColor: KColors.primary,
        ),
      ],
    );
  }
}
