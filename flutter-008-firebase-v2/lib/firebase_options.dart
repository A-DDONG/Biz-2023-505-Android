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
    apiKey: 'AIzaSyByVH1tsmNcnredGCXcJmGIifSen7TH870',
    appId: '1:854236704326:web:48418a9e08433715506447',
    messagingSenderId: '854236704326',
    projectId: 'flutter-my-app-cac24',
    authDomain: 'flutter-my-app-cac24.firebaseapp.com',
    storageBucket: 'flutter-my-app-cac24.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvk3GKv9jJe0wljr7PcccVmCOp8sL8hnw',
    appId: '1:854236704326:android:7254a7ec092cda72506447',
    messagingSenderId: '854236704326',
    projectId: 'flutter-my-app-cac24',
    storageBucket: 'flutter-my-app-cac24.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZOuGOLIn6UUW52lx7LFQSTPt_Kd8e2Mc',
    appId: '1:854236704326:ios:ded888c069a90f1f506447',
    messagingSenderId: '854236704326',
    projectId: 'flutter-my-app-cac24',
    storageBucket: 'flutter-my-app-cac24.appspot.com',
    iosClientId: '854236704326-8g0n0i1qtde0sufe9rof3s3hqt9s5q2r.apps.googleusercontent.com',
    iosBundleId: 'com.addong.firebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZOuGOLIn6UUW52lx7LFQSTPt_Kd8e2Mc',
    appId: '1:854236704326:ios:de36c12270466aea506447',
    messagingSenderId: '854236704326',
    projectId: 'flutter-my-app-cac24',
    storageBucket: 'flutter-my-app-cac24.appspot.com',
    iosClientId: '854236704326-91boaf0snmmnt61f7rnip6jcd120rgno.apps.googleusercontent.com',
    iosBundleId: 'com.addong.firebase.RunnerTests',
  );
}