import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/constants/primary_black.dart';
import 'package:palta/screens/on_boarding/on_boarding_screen1.dart';
import 'package:palta/screens/on_boarding/on_boarding_screen3.dart';
import 'package:palta/screens/splash/splash_screen_1.dart';
import 'package:palta/utils/translations.dart';

void main() async {
  await GetStorage.init();
  final getStorage = GetStorage();
  final String lang = getStorage.read('lang') ?? 'ar';
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp(lang: lang));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.lang});
  final String lang;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Translation(),
      locale: Locale(lang),
      fallbackLocale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      title: 'Palta',
      theme: ThemeData(
        fontFamily: 'ReadexPro',
        primarySwatch: primaryBlack,
      ),
      home: const SplashScreen1(),
    );
  }
}
