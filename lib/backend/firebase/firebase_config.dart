import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBUfrQmB_SIpWqvz7f5y6I-EDUr5dwmuK4",
            authDomain: "tracetexapp.firebaseapp.com",
            projectId: "tracetexapp",
            storageBucket: "tracetexapp.appspot.com",
            messagingSenderId: "490688155530",
            appId: "1:490688155530:web:e9b29b98facd984c490273",
            measurementId: "G-T1YGRB37QB"));
  } else {
    await Firebase.initializeApp();
  }
}
