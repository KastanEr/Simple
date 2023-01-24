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
    apiKey: 'AIzaSyD795ZLIZOos7q6StZw2w70u6X8w6mhy-M',
    appId: '1:976339682869:web:7c96116c2dcdaf9bbe537c',
    messagingSenderId: '976339682869',
    projectId: 'simple-a1a5d',
    authDomain: 'simple-a1a5d.firebaseapp.com',
    storageBucket: 'simple-a1a5d.appspot.com',
    measurementId: 'G-L57S5WDK4S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDenarSB_iXbgsneHBlSJ5a4m5k2mU0jdw',
    appId: '1:976339682869:android:5e52bc9a18a09a7fbe537c',
    messagingSenderId: '976339682869',
    projectId: 'simple-a1a5d',
    storageBucket: 'simple-a1a5d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYoJsY16dzt9CrjaUwWiTfK_luAbzmsBg',
    appId: '1:976339682869:ios:7094a5dd6d5e4576be537c',
    messagingSenderId: '976339682869',
    projectId: 'simple-a1a5d',
    storageBucket: 'simple-a1a5d.appspot.com',
    iosClientId:
        '976339682869-jp6kkkpojg7f9rqhs6eggoc0ae61oitc.apps.googleusercontent.com',
    iosBundleId: 'com.example.simple',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYoJsY16dzt9CrjaUwWiTfK_luAbzmsBg',
    appId: '1:976339682869:ios:7094a5dd6d5e4576be537c',
    messagingSenderId: '976339682869',
    projectId: 'simple-a1a5d',
    storageBucket: 'simple-a1a5d.appspot.com',
    iosClientId:
        '976339682869-jp6kkkpojg7f9rqhs6eggoc0ae61oitc.apps.googleusercontent.com',
    iosBundleId: 'com.example.simple',
  );
}