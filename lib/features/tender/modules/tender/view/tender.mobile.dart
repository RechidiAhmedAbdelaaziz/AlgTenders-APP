part of 'tender.screen.dart';

class _Mobile extends StatelessWidget {
  const _Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoaded = context.select(
      (TenderCubit cubit) => cubit.state.isLoaded,
    );

    return Scaffold(
      appBar: AppBar(backgroundColor: KColors.background),
      backgroundColor: KColors.background,
      body:
          !isLoaded
              ? LinearProgressIndicator(color: KColors.primary)
              : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      heightSpace(24),
                      _AnnouncerInfo(),
                      heightSpace(10),
                      _TenderInfo(),
                      heightSpace(10),
                      Sources(
                        context
                                .read<TenderCubit>()
                                .state
                                .tender
                                .sources ??
                            [],
                      ),
                      heightSpace(60),
                    ],
                  ),
                ),
              ),

      floatingActionButton: _ResultButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
    );
  }
}
