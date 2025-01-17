// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBYxKm2bdOGlDtuCVEWcUU-j1m9dFylNrY',
    appId: '1:321085455669:web:571adfb95243496c98607c',
    messagingSenderId: '321085455669',
    projectId: 'login-screen-6975d',
    authDomain: 'login-screen-6975d.firebaseapp.com',
    storageBucket: 'login-screen-6975d.appspot.com',
    measurementId: 'G-D5YKLWE2B2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCobVWpp83HluJ9uTYD4ONx7fG8l6IDL_E',
    appId: '1:321085455669:android:0aa2294c0c7ccc2098607c',
    messagingSenderId: '321085455669',
    projectId: 'login-screen-6975d',
    storageBucket: 'login-screen-6975d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDV0P5250L3A2_T_ycsrBzv6ZZlWMcfick',
    appId: '1:321085455669:ios:35d44343b8c4719898607c',
    messagingSenderId: '321085455669',
    projectId: 'login-screen-6975d',
    storageBucket: 'login-screen-6975d.appspot.com',
    iosBundleId: 'com.example.finalhackathon',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDV0P5250L3A2_T_ycsrBzv6ZZlWMcfick',
    appId: '1:321085455669:ios:35d44343b8c4719898607c',
    messagingSenderId: '321085455669',
    projectId: 'login-screen-6975d',
    storageBucket: 'login-screen-6975d.appspot.com',
    iosBundleId: 'com.example.finalhackathon',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBYxKm2bdOGlDtuCVEWcUU-j1m9dFylNrY',
    appId: '1:321085455669:web:ec25763e9b7ff75298607c',
    messagingSenderId: '321085455669',
    projectId: 'login-screen-6975d',
    authDomain: 'login-screen-6975d.firebaseapp.com',
    storageBucket: 'login-screen-6975d.appspot.com',
    measurementId: 'G-CXB19WRDD7',
  );
}
