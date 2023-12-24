import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/pages.dart';
import 'routes/routes.dart';
import 'translation/app_translation.dart';
import 'utils/size_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    SizeConfig.init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashscreen,
      getPages: pages,
      title: 'Wasil User',
      translationsKeys: AppTranslation.translationKeys,
      locale: Locale(box.read('lang') ?? 'en'),
      // fallbackLocale: const Locale('en'),
      theme: ThemeData(),
    );
  }
}
