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
    apiKey: 'AIzaSyAc_D30jXwyVZmckNssAjuuczKf1qDZzcw',
    appId: '1:91279923523:web:b7467e9a01f464b4cbb7f6',
    messagingSenderId: '91279923523',
    projectId: 'cougeats-64c35',
    authDomain: 'cougeats-64c35.firebaseapp.com',
    storageBucket: 'cougeats-64c35.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBi-lmrwX8TOuoCkNcvaVrqHDARStZ_Z6Y',
    appId: '1:91279923523:android:20568af533abfab3cbb7f6',
    messagingSenderId: '91279923523',
    projectId: 'cougeats-64c35',
    storageBucket: 'cougeats-64c35.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6M4clVu1-Ra499wxBRuTAIJeIqnUBVkI',
    appId: '1:91279923523:ios:417870e897a99b6bcbb7f6',
    messagingSenderId: '91279923523',
    projectId: 'cougeats-64c35',
    storageBucket: 'cougeats-64c35.firebasestorage.app',
    iosBundleId: 'com.example.cougEatsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD6M4clVu1-Ra499wxBRuTAIJeIqnUBVkI',
    appId: '1:91279923523:ios:417870e897a99b6bcbb7f6',
    messagingSenderId: '91279923523',
    projectId: 'cougeats-64c35',
    storageBucket: 'cougeats-64c35.firebasestorage.app',
    iosBundleId: 'com.example.cougEatsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAc_D30jXwyVZmckNssAjuuczKf1qDZzcw',
    appId: '1:91279923523:web:f37070dfa61d39bacbb7f6',
    messagingSenderId: '91279923523',
    projectId: 'cougeats-64c35',
    authDomain: 'cougeats-64c35.firebaseapp.com',
    storageBucket: 'cougeats-64c35.firebasestorage.app',
  );
}
