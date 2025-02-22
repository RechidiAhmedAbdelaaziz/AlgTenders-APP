part of 'login.screen.dart';

class _Mobile extends DeviceScreen<LoginStrings> {
  const _Mobile({required super.strings});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.onError(context.showErrorDialog);
        state.onSave((_) => context.offAll(TenderNavigator.tenders()));
      },
      child: Scaffold(
        backgroundColor: KColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  heightSpace(115),
                  _Logo(height: 55.h, width: 203.w),
                  heightSpace(117),
                  _Form(strings: strings),
                  heightSpace(80),
                  _Buttons(strings: strings),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
