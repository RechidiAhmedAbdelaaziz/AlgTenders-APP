import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/extension/navigator.extension.dart';
import 'package:tender_app/core/shared/classes/dimensions.dart';
import 'package:tender_app/core/shared/widgets/pagination_builder.dart';
import 'package:tender_app/core/shared/widgets/search_bar.dart';
import 'package:tender_app/core/themes/colors.dart';

import '../logic/multi_announcer.cubit.dart';
import 'announcer.dart';

class Announcers extends StatelessWidget {
  const Announcers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MultiAnnouncerCubit()..getAnnouncers(),
      child: Builder(
        builder: (context) {
          final announcers = context.select(
            (MultiAnnouncerCubit cubit) => cubit.state.announcers,
          );

          final cubit = context.read<MultiAnnouncerCubit>();

          return Container(
            width: 200.w,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              color: KColors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              children: [
                KSearchBar(
                  controller: cubit.searchController,
                  onSearch: cubit.search,
                ),
                heightSpace(20),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async => cubit.search(),
                    color: KColors.primary,
                    child: PaginationBuilder(
                      items: announcers,
                      itemBuilder:
                          (announcer) => InkWell(
                            onTap: () => context.back(announcer),
                            child: Announcer(announcer),
                          ),
                      isLoading: context.select(
                        (MultiAnnouncerCubit cubit) =>
                            cubit.state.isLoading,
                      ),
                      onLoadMore: cubit.getAnnouncers,
                      separator: heightSpace(20),
                    ),
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
