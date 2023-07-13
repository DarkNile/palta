import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:palta/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/constants/primary_green.dart';
import 'package:palta/home/services/apps_flyer_service.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/splash/splash_screen_1.dart';
import 'package:palta/utils/translations.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('foreground notification');
    print('Message data: ${message.data}');
    if (message.notification != null) {
      print('yes notification: ${message.notification}');
    }
  });
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await GetStorage.init();
  await AppsFlyerService.initAppsFlyer();
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final getStorage = GetStorage();
  late String lang;

  @override
  void initState() {
    super.initState();
    lang = getStorage.read('lang') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Translation(),
      locale: Locale(lang.isEmpty ? 'ar' : lang),
      fallbackLocale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      title: 'Palta',
      theme: ThemeData(
        fontFamily: 'Vazirmatn',
        primarySwatch: primaryGreen,
      ),
      home: lang.isEmpty ? const SplashScreen1() : const HomePage(),
    );
  }
}
