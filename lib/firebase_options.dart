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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB1PipiMvN4483mFuakY9AR8M0ZhQxS9-o',
    appId: '1:172386029136:web:30966ab6611f6a00f10b55',
    messagingSenderId: '172386029136',
    projectId: 'esp32-demo-75a17',
    authDomain: 'esp32-demo-75a17.firebaseapp.com',
    databaseURL: 'https://esp32-demo-75a17-default-rtdb.firebaseio.com',
    storageBucket: 'esp32-demo-75a17.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCv93GSZ9yefr5kqvKlCHW0RgkchMUMJZo',
    appId: '1:172386029136:android:50c16b4fcca2964ff10b55',
    messagingSenderId: '172386029136',
    projectId: 'esp32-demo-75a17',
    databaseURL: 'https://esp32-demo-75a17-default-rtdb.firebaseio.com',
    storageBucket: 'esp32-demo-75a17.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnuFOQqVL5-Qth_8Y8X425twDhql3RGjs',
    appId: '1:172386029136:ios:fbda4e4281917860f10b55',
    messagingSenderId: '172386029136',
    projectId: 'esp32-demo-75a17',
    databaseURL: 'https://esp32-demo-75a17-default-rtdb.firebaseio.com',
    storageBucket: 'esp32-demo-75a17.appspot.com',
    iosClientId: '172386029136-73ea70at2767vi0kokcjmbds6715u3fm.apps.googleusercontent.com',
    iosBundleId: 'com.example.uiDesign',
  );
}