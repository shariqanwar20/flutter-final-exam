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
    apiKey: 'AIzaSyBb-9Pmmo7RFfK_Lr2Dbbhg5fY5vc5-NvI',
    appId: '1:661112554119:web:b530330f1b0b4dbb08ae22',
    messagingSenderId: '661112554119',
    projectId: 'finalexam-31157',
    authDomain: 'finalexam-31157.firebaseapp.com',
    storageBucket: 'finalexam-31157.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUjUymFNuGSeK2Ns4JHQ25ZR_rsZbjUpk',
    appId: '1:661112554119:android:a3ba816c97c63ffd08ae22',
    messagingSenderId: '661112554119',
    projectId: 'finalexam-31157',
    storageBucket: 'finalexam-31157.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDGG6G_0xpr_szqPfC411WpkmQdqvAhWM',
    appId: '1:661112554119:ios:c5b94f4c3038ec2708ae22',
    messagingSenderId: '661112554119',
    projectId: 'finalexam-31157',
    storageBucket: 'finalexam-31157.appspot.com',
    iosClientId: '661112554119-o25d75tuno0rg2do6v8enkbgfmct1fll.apps.googleusercontent.com',
    iosBundleId: 'com.example.finalTerm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDGG6G_0xpr_szqPfC411WpkmQdqvAhWM',
    appId: '1:661112554119:ios:c5b94f4c3038ec2708ae22',
    messagingSenderId: '661112554119',
    projectId: 'finalexam-31157',
    storageBucket: 'finalexam-31157.appspot.com',
    iosClientId: '661112554119-o25d75tuno0rg2do6v8enkbgfmct1fll.apps.googleusercontent.com',
    iosBundleId: 'com.example.finalTerm',
  );
}
