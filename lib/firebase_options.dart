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
    apiKey: 'AIzaSyDumKON68MbEB_e_RrZ2H1gOj9Y7ASx0sc',
    appId: '1:53579060333:web:535657690bf69146471b64',
    messagingSenderId: '53579060333',
    projectId: 'fir-praktiki-task',
    authDomain: 'fir-praktiki-task.firebaseapp.com',
    storageBucket: 'fir-praktiki-task.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_1e9zfFdCPTECnzY-LhQqIGb2cVcorcw',
    appId: '1:53579060333:android:35546896bed4e06a471b64',
    messagingSenderId: '53579060333',
    projectId: 'fir-praktiki-task',
    storageBucket: 'fir-praktiki-task.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAATjLWfA6xLXCCZdRVEYW15tdGjNnoJg',
    appId: '1:53579060333:ios:2fb767c4f89a1f2c471b64',
    messagingSenderId: '53579060333',
    projectId: 'fir-praktiki-task',
    storageBucket: 'fir-praktiki-task.appspot.com',
    iosBundleId: 'com.example.taskPraktiki',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAATjLWfA6xLXCCZdRVEYW15tdGjNnoJg',
    appId: '1:53579060333:ios:90d3e316255826f6471b64',
    messagingSenderId: '53579060333',
    projectId: 'fir-praktiki-task',
    storageBucket: 'fir-praktiki-task.appspot.com',
    iosBundleId: 'com.example.taskPraktiki.RunnerTests',
  );
}
