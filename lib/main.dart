import 'package:authflow/firebase_options.dart';
import 'package:authflow/pages/loginPage.dart';
import 'package:authflow/themes/darkmode.dart';
import 'package:authflow/themes/lightmode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  //firebasesetup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Loginpage(),
      theme: lightmode,
      darkTheme: darkMode,
    );
  }
}
