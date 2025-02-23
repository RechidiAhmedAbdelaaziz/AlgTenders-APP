part of '../view/tender.screen.dart';

class _AnnouncerInfo extends StatelessWidget {
  const _AnnouncerInfo();

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
          _buildAnnouncerProfile(tender.announcer!, context),
          heightSpace(30),
          Text(
            tender.title ?? '',
            maxLines: 12,
            style: TextStyle(
              fontSize: 20.sp,
              color: KColors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          heightSpace(30),
          Row(
            children: [
              Text(
                tender.marketType ?? '',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: KColors.dark,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                '${'Published'.tr(context)} ${tender.publishedDate?.toDayMonthYear() ?? ''}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: KColors.darkGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncerProfile(
    AnnouncerModel announcer,
    BuildContext context,
  ) {
    return Row(
      children: [
        Container(
          height: 64.r,
          width: 64.r,
          decoration: BoxDecoration(
            color: KColors.grey,
            borderRadius: BorderRadius.circular(8.r),
            image: DecorationImage(
              image: NetworkImage(announcer.imageUri ?? ''),
              fit: BoxFit.cover,
            ),
          ),
        ),

        widthSpace(16),
        Expanded(
          child: Text(
            announcer.name ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: KColors.black,
            ),
          ),
        ),
        if (announcer.isStartup ?? false)
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
    );
  }
}
