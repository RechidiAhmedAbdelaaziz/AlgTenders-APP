import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/shared/classes/dimensions.dart';
import 'package:tender_app/core/themes/colors.dart';
import 'package:tender_app/features/sources/data/models/source.model.dart';
import 'package:widget_zoom/widget_zoom.dart';

class Sources extends StatelessWidget {
  final List<SourceModel> sources;
  const Sources(this.sources, {super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 510.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: KColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sources.length,
        separatorBuilder: (_, __) => widthSpace(10),
        itemBuilder: (_, index) {
          final source = sources[index];
          return Container(
            padding: EdgeInsetsDirectional.only(top: 5.h),
            decoration: BoxDecoration(
              color: KColors.white,
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(color: KColors.primary),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: KColors.grey,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: KColors.grey),
                    image: DecorationImage(
                      image: NetworkImage(
                        source.newspaper?.imageUri ?? '',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                heightSpace(10),
                SizedBox(
                  height: 380.h,
                  width: 250.w,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: source.images?.length ?? 0,
                    controller: PageController(viewportFraction: 0.9),
                    itemBuilder: (_, index) {
                      final imageDto = source.images![index];
                      return WidgetZoom(
                        heroAnimationTag: 'source_image_$index',
                        zoomWidget: Container(
                          height: 100.h,
                          width: 60.w,
                          margin: EdgeInsetsDirectional.only(
                            end: 2.w,
                          ),
                          decoration: BoxDecoration(
                            color: KColors.grey,
                            borderRadius: BorderRadius.circular(12.r),
                            image: DecorationImage(
                              image: imageDto.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
