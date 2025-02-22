part of '../screen/login.screen.dart';

class _Logo extends ResponsiveWidget {
  const _Logo({required super.height, required super.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: const Placeholder(),
    );
  }
}
