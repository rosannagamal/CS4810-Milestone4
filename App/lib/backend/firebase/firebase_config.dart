import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDhtpJOBLTf5Ql43NTz5DfrPtufV_9CX5I",
            authDomain: "pennypulse-jp2qmk.firebaseapp.com",
            projectId: "pennypulse-jp2qmk",
            storageBucket: "pennypulse-jp2qmk.appspot.com",
            messagingSenderId: "317058674496",
            appId: "1:317058674496:web:28986dbbda4651f9cad4a5"));
  } else {
    await Firebase.initializeApp();
  }
}
