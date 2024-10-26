import 'package:firebase_core/firebase_core.dart';
import 'package:finalhackathon/loginscreen.dart';
import 'package:flutter/material.dart';

const firebaseOptions = FirebaseOptions(
  apiKey: "AIzaSyBYxKm2bdOGlDtuCVEWcUU-j1m9dFylNrY",
  appId: "login-screen-6975d",
  messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
  projectId: "login-screen-6975d",
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: firebaseOptions);
  } catch (e) {
    // Handle the error appropriately
    print("Error initializing Firebase: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Loginscreen(),
    );
  }
}
