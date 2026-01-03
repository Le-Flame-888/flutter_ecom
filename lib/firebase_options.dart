// File generated manually based on user provided config
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyD-SmwFdOMFQ20-4li7OF2QXVfBZ1aiy3U",
    authDomain: "flutter-ecom-6fcc1.firebaseapp.com",
    projectId: "flutter-ecom-6fcc1",
    storageBucket: "flutter-ecom-6fcc1.firebasestorage.app",
    messagingSenderId: "483036662478",
    appId: "1:483036662478:web:617294c667b0ee79645e9f",
    measurementId: "G-2DQWCNENB0",
  );
}
