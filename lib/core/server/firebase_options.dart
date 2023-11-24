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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAwTegVrCiAwjULBSZdeAPV35pArpBzOeU',
    appId: '1:285086159989:web:eb805b2dbb78dce2ee543c',
    messagingSenderId: '285086159989',
    projectId: 'interactive-dca81',
    authDomain: 'interactive-dca81.firebaseapp.com',
    storageBucket: 'interactive-dca81.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmM_6IhodYZLmV17IBBa9PtY2TM-XICQ8',
    appId: '1:285086159989:android:2c6ad73cc0fcc381ee543c',
    messagingSenderId: '285086159989',
    projectId: 'interactive-dca81',
    storageBucket: 'interactive-dca81.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7OpH8k0Oas7FhfLqVN1iRJw8KbO1XMUU',
    appId: '1:285086159989:ios:b9810444afede00cee543c',
    messagingSenderId: '285086159989',
    projectId: 'interactive-dca81',
    storageBucket: 'interactive-dca81.appspot.com',
    iosBundleId: 'com.example.interactive',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7OpH8k0Oas7FhfLqVN1iRJw8KbO1XMUU',
    appId: '1:285086159989:ios:f6f3c155b711ddf8ee543c',
    messagingSenderId: '285086159989',
    projectId: 'interactive-dca81',
    storageBucket: 'interactive-dca81.appspot.com',
    iosBundleId: 'com.example.interactive.RunnerTests',
  );
}
