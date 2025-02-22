import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender_app/app.dart';

import '../../core/di/locator.dart';

void main() async {
  // ensure initializeApp is called
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(
    name: "MOBILE DEV",
    color: Colors.deepOrange,
    location: BannerLocation.topEnd,
    variables: {"baseUrl": "http://192.168.201.172:3000"},
  );

  // register dependencies
  await setupLocator();

  await ScreenUtil.ensureScreenSize();

  runApp(const TenderApp());
}
