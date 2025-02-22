import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tender_app/core/router/router.dart';
import 'package:tender_app/core/services/cache/cache.service.dart';
import 'package:tender_app/core/services/cloudstorage/cloud_storage.service.dart';
import 'package:tender_app/core/services/cloudstorage/cloudinary/cloudinary.service.dart';
import 'package:tender_app/core/services/dio/dio.service.dart';
import 'package:tender_app/core/services/filepicker/filepick.service.dart';
import 'package:tender_app/features/announcer/config/announcer.dependency.dart';
import 'package:tender_app/features/auth/config/auth.dependency.dart';
import 'package:tender_app/features/tender/config/tender.dependency.dart';

part 'dependecy_base.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedpref = await SharedPreferences.getInstance();
  // SharedPreferences and FlutterSecureStorage
  locator.registerLazySingleton(() => sharedpref);
  locator.registerLazySingleton(() => FlutterSecureStorage());

  //CacheService
  locator.registerLazySingleton(() => CacheService());

  //Dio
  locator.registerLazySingleton(() => DioService.getDio());

  //Router
  locator.registerSingleton(AppRouter());

  //File Picker
  locator.registerLazySingleton<FilePickerService>(
    () => kIsWeb ? WebFilePicker() : MobileFilePicker(),
  );

  //Cloud storage service
  locator.registerLazySingleton<CloudinaryService>(
    () => kIsWeb ? WebCloudinaryService() : MobileCloudinaryService(),
  );

  locator.registerLazySingleton<CloudStorageService>(
    () => locator<CloudinaryService>(),
  );

  await FeaturesDependency._init();

  locator.allowReassignment = true;
}
