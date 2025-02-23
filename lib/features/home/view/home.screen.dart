import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/themes/colors.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home';

  final Widget child;
  const HomeScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: KColors.background, body: child);
  }
}
