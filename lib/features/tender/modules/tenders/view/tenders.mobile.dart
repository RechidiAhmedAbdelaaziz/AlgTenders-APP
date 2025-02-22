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
    return Column(
      children: [
        heightSpace(50),
        KSearchBar(
          controller: filters.keywordController,
          onSearch: cubit.filterTenders,
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
    );
  }
}
