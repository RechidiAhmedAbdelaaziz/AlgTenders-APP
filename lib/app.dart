import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/core/router/router.dart';

import 'core/localization/app_localization.dart';

class TenderApp extends StatelessWidget {
  const TenderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ScreenUtilInit(
          designSize:
              constraints.maxWidth < 600
                  ? const Size(430, 932)
                  : const Size(1920, 1080),

          builder: (_, __) {
            final router = locator<AppRouter>();
            return FlavorBanner(
              child: MaterialApp.router(
                routerConfig: router.routerConfig,
                theme: ThemeData(fontFamily: 'Inter'),
                supportedLocales: [
                  Locale('fr'), // French
                  Locale('en'), // English
                  Locale('ar'), // Arabic
                ],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (locale, supportedLocales) {
                  if (locale != null &&
                      supportedLocales.any(
                        (element) =>
                            element.languageCode ==
                            locale.languageCode,
                      )) {
                    return locale;
                  }
                  // If the current device locale is not supported, use the first one
                  return supportedLocales.first;
                },
              ),
            );
          },
        );
      },
    );
  }
}
