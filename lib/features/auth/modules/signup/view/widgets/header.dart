part of '../screen/signup.screen.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Create an account'.tr(context),
      style: TextStyle(
        color: Colors.black,
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
