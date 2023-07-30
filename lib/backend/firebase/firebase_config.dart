import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCw032bO1ko5B1NGPp9wcYJ1Iwr_i1beU8",
            authDomain: "tyiynka.firebaseapp.com",
            projectId: "tyiynka",
            storageBucket: "tyiynka.appspot.com",
            messagingSenderId: "48365057994",
            appId: "1:48365057994:web:9677f687af37691f3e0133",
            measurementId: "G-KNFW06LQVX"));
  } else {
    await Firebase.initializeApp();
  }
}
