import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tender_app/core/router/router.dart';
import 'package:tender_app/core/router/routes.dart';
import 'package:tender_app/features/tender/modules/tender/logic/tender.cubit.dart';
import 'package:tender_app/features/tender/modules/tender/view/tender.screen.dart';
import 'package:tender_app/features/tender/modules/tenders/logic/tenders.cubit.dart';
import 'package:tender_app/features/tender/modules/tenders/view/tenders.screen.dart';

class TenderRoute extends AppRouteBase {
  TenderRoute()
    : super(
        name: AppRoutes.tenders,
        path: TendersScreen.route,
        builder: _buildTendersScreen,
      );

  static Widget _buildTendersScreen(
    BuildContext context,
    GoRouterState state,
  ) => BlocProvider(
    create: (context) => TendersCubit()..loadTenders(),
    child: const TendersScreen(),
  );

  TenderRoute.tender()
    : super(
        name: AppRoutes.tender,
        path: TenderScreen.route,
        builder: _buildTenderScreen,
      );

  static Widget _buildTenderScreen(
    BuildContext context,
    GoRouterState state,
  ) {
    final tenderId = state.pathParameters['id']!;
    return BlocProvider(
      create: (context) => TenderCubit()..loadTender(tenderId),
      child: const TenderScreen(),
    );
  }
}
