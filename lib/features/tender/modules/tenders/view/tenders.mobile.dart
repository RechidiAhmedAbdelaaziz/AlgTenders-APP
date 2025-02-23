part of 'tenders.screen.dart';

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    final tenders = context.select(
      (TendersCubit cubit) => cubit.state.tenders,
    );

    final cubit = context.read<TendersCubit>();
    final filters = cubit.filters;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          heightSpace(50),
          Row(
            children: [
              Expanded(
                child: KSearchBar(
                  controller: filters.keywordController,
                  onSearch: cubit.filterTenders,
                ),
              ),
              widthSpace(10),
              InkWell(
                onTap:
                    () => context.bottomSheetWithResult<bool>(
                      child: TenderFilter(filters),
                      onResult: (result) => cubit.filterTenders(),
                    ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: KColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.filter_list, color: Colors.white),
                ),
              ),
            ],
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async => cubit.filterTenders(),
              color: KColors.primary,
              child: PaginationBuilder(
                items: tenders,
                itemBuilder: (item) => _Tender(item),
                isLoading: context.select(
                  (TendersCubit cubit) => cubit.state.isLoading,
                ),
                onLoadMore: cubit.loadTenders,
                separator: heightSpace(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
