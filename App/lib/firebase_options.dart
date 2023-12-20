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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACwKlDk5RF5KktKA5NDD0v381uUIjdFR0',
    appId: '1:317058674496:ios:fda42d864246dbf1cad4a5',
    messagingSenderId: '317058674496',
    projectId: 'pennypulse-jp2qmk',
    storageBucket: 'pennypulse-jp2qmk.appspot.com',
    iosBundleId: 'com.app.pennpulse',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyACwKlDk5RF5KktKA5NDD0v381uUIjdFR0',
    appId: '1:317058674496:ios:de614dcd22b50780cad4a5',
    messagingSenderId: '317058674496',
    projectId: 'pennypulse-jp2qmk',
    storageBucket: 'pennypulse-jp2qmk.appspot.com',
    iosBundleId: 'com.example.pennypulse.RunnerTests',
  );
}
