import 'package:flutter/cupertino.dart';
import 'package:tender_app/core/localization/app_localization.dart';

extension LocalizationExtension on String {
  String tr(BuildContext context) =>
      AppLocalizations.of(context)?.translate(this) ?? this;
}
