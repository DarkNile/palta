import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:http/http.dart' as http;
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
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';

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
    dev.log('Message : ${message.toString()}');
    if (message.notification != null) {
      if (!Platform.isIOS) {
        androidForegroundNotification(
            title: message.notification!.title ?? "",
            body: message.notification!.body,
            imageUrl: message.notification!.android!.imageUrl);
      }
      dev.log('yes notification: ${message.notification}');
      dev.log('notification body: ${message.notification!.body}');
      dev.log('notification title: ${message.notification!.title}');
      dev.log(
          'notification imageUrl: ${message.notification!.android!.imageUrl}');
    }
  });
  await notification();
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
  TabbySDK().setup(
    withApiKey:
        'pk_e3e0ca54-2144-4f6e-860d-78d208e716ca', // Put here your Api key
    // withApiKey: 'sk_7411b04a-a162-4f85-9624-d4f388dea5ab',
    environment: Environment.production,
  );
  runApp(Phoenix(child: const MyApp()));
}

notification() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  await firebaseMessaging
      .getToken()
      .then((token) => dev.log("Token TEST: $token"));
}

int generateNotificationId() {
  Random random = Random();
  int randomNumber = random.nextInt(900000) + 100000;
  return randomNumber;
}

Future<Uint8List> getImageBytes(String imageUrl) async {
  http.Response response = await http.get(Uri.parse(imageUrl));
  return response.bodyBytes;
}

void androidForegroundNotification({
  required String title,
  String? body,
  String? imageUrl,
}) async {
  BigPictureStyleInformation? bigPictureStyleInformation;
  if (imageUrl != null) {
    await getImageBytes(imageUrl).then((bodyBytes) {
      bigPictureStyleInformation = BigPictureStyleInformation(
        ByteArrayAndroidBitmap.fromBase64String(base64.encode(bodyBytes)),
      );
    });
  }

  AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails('Fcm', 'Foreground',
          channelDescription: 'FCM while app is foreground',
          priority: Priority.high,
          importance: Importance.max,
          styleInformation: bigPictureStyleInformation,
          //icon: "assets/app-icon.png"
          // you need to add the icon parameter in the constructor for the android details

          icon: '@mipmap/ic_launcher');
  final NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.show(
    generateNotificationId(),
    title,
    body,
    notificationDetails,
  );
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
        useMaterial3: false,
        fontFamily: 'Vazirmatn',
        primarySwatch: primaryGreen,
      ),
      home: lang.isEmpty ? const SplashScreen1() : const HomePage(),
    );
  }
}
