import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:southern_tour/screens/authentication.dart';
import '/routes/app.dart';

import './firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

final actionCodeSettings = ActionCodeSettings(
  url: 'https://sothern-tour-app-default-rtdb.asia-southeast1.firebasedatabase.app',
  handleCodeInApp: true,
  androidMinimumVersion: '1',
  androidPackageName: 'com.example.southern_tour',
  iOSBundleId: 'com.example.southernTour',
);
final emailLinkProviderConfig = EmailLinkAuthProvider(
  actionCodeSettings: actionCodeSettings,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    emailLinkProviderConfig,

  ]);

  // Both of the following lines are good for testing,
  // but can be removed for release builds
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  //FirebaseAuth.instance.signOut();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthApp(),
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}
