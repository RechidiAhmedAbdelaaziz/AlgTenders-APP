part of 'signup.screen.dart';

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              heightSpace(110),
              _Header(),
              heightSpace(57),
              _Form(),
              heightSpace(100),
              _Buttons(),
            ],
          ),
        ),
      ),
    );
  }
}
