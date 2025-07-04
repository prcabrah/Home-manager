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
    apiKey: 'AIzaSyB7HTaO42c5OeKawWM64gThLsMVaL0O5pY',
    appId: '1:913520509453:web:2a7b84ed47fab31eaa4b44',
    messagingSenderId: '913520509453',
    projectId: 'house-manager-ed57d',
    authDomain: 'house-manager-ed57d.firebaseapp.com',
    storageBucket: 'house-manager-ed57d.firebasestorage.app',
    measurementId: 'G-NNHBLN3X8T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwPD2EuirUnv_McoOnrgveJazXXdQMnEU',
    appId: '1:913520509453:android:52efaf8a9a64835eaa4b44',
    messagingSenderId: '913520509453',
    projectId: 'house-manager-ed57d',
    storageBucket: 'house-manager-ed57d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDCtEnGsImSSsUxz4cOgmS9QmWgNGw2888',
    appId: '1:913520509453:ios:64f1425f51102343aa4b44',
    messagingSenderId: '913520509453',
    projectId: 'house-manager-ed57d',
    storageBucket: 'house-manager-ed57d.firebasestorage.app',
    iosBundleId: 'com.example.houseManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDCtEnGsImSSsUxz4cOgmS9QmWgNGw2888',
    appId: '1:913520509453:ios:64f1425f51102343aa4b44',
    messagingSenderId: '913520509453',
    projectId: 'house-manager-ed57d',
    storageBucket: 'house-manager-ed57d.firebasestorage.app',
    iosBundleId: 'com.example.houseManager',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB7HTaO42c5OeKawWM64gThLsMVaL0O5pY',
    appId: '1:913520509453:web:c17a9871384947afaa4b44',
    messagingSenderId: '913520509453',
    projectId: 'house-manager-ed57d',
    authDomain: 'house-manager-ed57d.firebaseapp.com',
    storageBucket: 'house-manager-ed57d.firebasestorage.app',
    measurementId: 'G-78FWY3LQEK',
  );
}
