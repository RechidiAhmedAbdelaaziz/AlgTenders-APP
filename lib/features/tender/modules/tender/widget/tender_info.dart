part of '../view/tender.screen.dart';

class _TenderInfo extends StatelessWidget {
  const _TenderInfo();

  @override
  Widget build(BuildContext context) {
    final tender = context.read<TenderCubit>().state.tender;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: KColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfo('Category'.tr(context), tender.industry ?? ''),
          heightSpace(16),

          Row(
            children: [
              _buildInfo(
                'Region'.tr(context),
                tender.region ?? '',
                icon: Icon(Icons.location_on, size: 20.sp),
              ),
              const Spacer(),
              if (tender.chargePrice != null)
                _buildInfo(
                  'ChargePrice'.tr(context),
                  tender.chargePrice.toString(),
                ),
            ],
          ),
          heightSpace(16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildInfo(
                'DueDate'.tr(context),
                tender.closingDate?.toDayMonthYear() ?? '',
                textColor:
                    tender.isExpired ? KColors.red : KColors.dark,
              ),
              const Spacer(),
              Icon(
                tender.isExpired ? Icons.cancel : Icons.check_circle,
                size: 20.sp,
                color: tender.isExpired ? KColors.red : KColors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(
    String title,
    String value, {
    Color? textColor,
    Widget? icon,
  }) {
    return Container(
      constraints: BoxConstraints(maxWidth: 170.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) icon,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: KColors.dark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                heightSpace(2),
                Text(
                  value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: textColor ?? KColors.dark,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
