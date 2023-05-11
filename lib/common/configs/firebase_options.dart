import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macOS - '
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
}

const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyArjrdIWyUt_09-A60MOveJfL6_XUI21XI",
    appId: "1:759373548497:android:e4d3fb31917bf1efda2ef0",
    messagingSenderId: "759373548497",
    projectId: "bikunku-improvements",
    storageBucket: "bikunku-improvements.appspot.com");

const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyBgMDvszwZ0RHUPl_sxt-WVkS72Dc4mKDA",
    appId: "1:759373548497:ios:0f7b65d53c336a23da2ef0",
    messagingSenderId: "759373548497",
    projectId: "bikunku-improvements",
    storageBucket: "bikunku-improvements.appspot.com");
