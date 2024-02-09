import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'src/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB6u3MkgfHEwO3d_do4fCHW-OH7hjvasQA",
      authDomain: "itz-shubham.firebaseapp.com",
      projectId: "itz-shubham",
      storageBucket: "itz-shubham.appspot.com",
      messagingSenderId: "554330591537",
      appId: "1:554330591537:web:0913c62eca4979bac4a010",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shubham',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF131313),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black26,
          surfaceTintColor: Colors.black,
          elevation: 0.0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      home: const Home(),
    );
  }
}
