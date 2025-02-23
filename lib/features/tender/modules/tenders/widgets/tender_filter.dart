part of '../view/tenders.screen.dart';

class TenderFilter extends StatelessWidget {
  final TenderFiltersDto filters;
  const TenderFilter(this.filters, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: KColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'FilterBy'.tr(context),
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.restore),
                  onPressed: filters.clear,
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => context.back(),
                ),
              ],
            ),

            const Divider(),
            heightSpace(25),

            SelectableAnnouncer(filters.announcerController),
            heightSpace(20),

            KDropDownMenu(
              items: StaticData.marketTypes,
              controller: filters.marketTypeController,
              title: 'MarketType'.tr(context),
            ),
            heightSpace(20),

            CateogryDropdown(controller: filters.categoryController),
            heightSpace(20),

            MultiDropDownMenu(
              items: StaticData.regions,
              controller: filters.regions,
              title: 'Regions'.tr(context),
            ),
            heightSpace(20),

            // Row(
            //   children: [
            //     Expanded(
            //       child: KDatePicker(
            //         controller: filters.publishedAfter,
            //         title: 'PublishedAfter'.tr(context),
            //       ),
            //     ),
            //     widthSpace(20),
            //     Expanded(
            //       child: KDatePicker(
            //         controller: filters.closingBefore,
            //         title: 'ClosingBefore'.tr(context),
            //       ),
            //     ),
            //   ],
            // ),
            // heightSpace(20),
            AppCheckBox(
              controller: filters.isStartup,
              title: 'IsStartup'.tr(context),
            ),
            heightSpace(20),

            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Stack(
                children: [
                  SubmitButton(
                    onTap: () => context.back(true),
                    title: 'Apply'.tr(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
