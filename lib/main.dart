import 'package:authflow/firebase_options.dart';
import 'package:authflow/pages/loginPage.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme(brightness: Brightness.dark, primary: Colors.red, onPrimary: Colors.white, secondary: Colors.red, onSecondary: Colors.white, error: Colors.red, onError: Colors.white, background: Colors.red, onBackground: Colors.white, surface: Colors.red, onSurface: Colors.white)

      ),
    );
  }
}
