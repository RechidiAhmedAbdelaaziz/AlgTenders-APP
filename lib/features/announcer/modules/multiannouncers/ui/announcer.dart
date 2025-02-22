import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/extension/localization.extension.dart';
import 'package:tender_app/core/shared/classes/dimensions.dart';
import 'package:tender_app/core/themes/colors.dart';
import 'package:tender_app/features/announcer/data/model/announcer.model.dart';

class Announcer extends StatelessWidget {
  final AnnouncerModel announcer;
  const Announcer(this.announcer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25.sp,
            backgroundImage: NetworkImage(announcer.imageUri ?? ''),
          ),
          widthSpace(14),
          Expanded(
            child: Text(
              announcer.name ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (announcer.isStartup ?? false) ...[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 4.h,
              ),
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                color: KColors.green.withAlpha((255 * 0.1).toInt()),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'Startup'.tr(context),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: KColors.green,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
