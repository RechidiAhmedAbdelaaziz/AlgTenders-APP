part of '../view/tender.screen.dart';

class _ResultButton extends StatelessWidget {
  const _ResultButton();

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: () {
        //TODO go to result screen
      },
      child: Container(
        height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        margin: EdgeInsets.symmetric(
          // vertical: 16.h,
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          color: KColors.primary,
          borderRadius: BorderRadius.circular(12.r),
        ),
        alignment: Alignment.center,
        child: Text(
          'ShowResults'.tr(context),
          style: TextStyle(
            color: KColors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
