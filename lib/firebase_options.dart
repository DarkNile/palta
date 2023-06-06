// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4X6_6eYcRCLHSElXskRhl5cvBmOuN9n4',
    appId: '1:571806460921:android:5584a8514aff69d5796b28',
    messagingSenderId: '571806460921',
    projectId: 'palta-1b970',
    storageBucket: 'palta-1b970.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkkDacXG7IDN7zydXyCcR2hKHXEwCNJiA',
    appId: '1:571806460921:ios:d7bbab2caad0e2ab796b28',
    messagingSenderId: '571806460921',
    projectId: 'palta-1b970',
    storageBucket: 'palta-1b970.appspot.com',
    androidClientId:
        '571806460921-5tvle1enbkodhcirpdg75omrgdrmi7eo.apps.googleusercontent.com',
    iosClientId:
        '571806460921-6fmql0c52ogao1bllnigh25elupinb5o.apps.googleusercontent.com',
    iosBundleId: 'com.DigitalPartner.palta',
  );
}
