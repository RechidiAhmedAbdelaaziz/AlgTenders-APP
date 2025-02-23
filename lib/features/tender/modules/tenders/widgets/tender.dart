part of '../view/tenders.screen.dart';

class _Tender extends StatelessWidget {
  final TenderModel tender;
  const _Tender(this.tender);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.to(TenderNavigator.tender(tender));
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: KColors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAnnouncerPic(),
                widthSpace(14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              tender.announcer?.name ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: KColors.darkGrey,
                              ),
                            ),
                          ),
                          widthSpace(2),
                          _buildStartupBadge(context),
                        ],
                      ),
                      heightSpace(8),
                      Text(
                        tender.title ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: KColors.black,
                        ),
                      ),
                      heightSpace(16),
                      _buildDateRange(),
                    ],
                  ),
                ),
              ],
            ),
            heightSpace(35),
            Row(
              children: [
                Text(
                  (tender.marketType ?? '').tr(context),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: KColors.black,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.location_on,
                  color: KColors.primary,
                  size: 20.r,
                ),
                widthSpace(5),
                Text(
                  tender.region ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: KColors.dark,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateRange() {
    return Row(
      children: [
        // published date
        Text(
          tender.publishedDate?.toDayMonthYear() ?? '',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: KColors.darkGrey,
          ),
        ),
        widthSpace(10),
        Icon(Icons.arrow_forward, color: KColors.black, size: 20.r),
        widthSpace(10),
        Text(
          tender.closingDate?.toDayMonthYear() ?? '',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: tender.isExpired ? KColors.red : KColors.green,
          ),
        ),
        const Spacer(),
        Icon(
          tender.isExpired ? Icons.cancel : Icons.check_circle,
          color: tender.isExpired ? KColors.red : KColors.green,
          size: 20.r,
        ),
      ],
    );
  }

  Widget _buildAnnouncerPic() {
    return CircleAvatar(
      radius: 25.sp,
      backgroundImage: NetworkImage(tender.announcer?.imageUri ?? ''),
    );
  }

  Widget _buildStartupBadge(BuildContext context) {
    return tender.announcer?.isStartup == true
        ? Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 4.h,
          ),
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
        )
        : SizedBox.shrink();
  }
}
