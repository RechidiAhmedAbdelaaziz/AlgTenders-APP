import 'package:tender_app/core/router/router.dart';
import 'package:tender_app/core/router/routes.dart';
import 'package:tender_app/features/tender/data/models/tender.model.dart';

class TenderNavigator extends AppNavigatorBase {
  TenderNavigator.tenders() : super(name: AppRoutes.tenders);

  TenderNavigator.tender(TenderModel tender)
    : super(name: AppRoutes.tender, pathParams: {'id': tender.id!});
}
