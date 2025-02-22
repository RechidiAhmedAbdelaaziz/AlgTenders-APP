import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/themes/colors.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const AppTextButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(fontSize: 12.sp, color: KColors.black),
      ),
    );
  }
}
