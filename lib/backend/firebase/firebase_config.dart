import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAs9xz4QoIaT9tjMgwurxR88ImmxgOXQ6k",
            authDomain: "chatgpt-62a1e.firebaseapp.com",
            projectId: "chatgpt-62a1e",
            storageBucket: "chatgpt-62a1e.appspot.com",
            messagingSenderId: "371197712788",
            appId: "1:371197712788:web:86bf7de34b5846dcec1781",
            measurementId: "G-Y6E8WF0SX2"));
  } else {
    await Firebase.initializeApp();
  }
}
