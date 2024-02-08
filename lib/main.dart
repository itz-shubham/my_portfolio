import 'dart:html' as html;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_porfolio/src/colors.dart';

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
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.black,
          elevation: 0.0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
      home: const GithubProfile(),
    );
  }
}

class GithubProfile extends StatefulWidget {
  const GithubProfile({super.key});

  @override
  State<GithubProfile> createState() => _GithubProfileState();
}

class _GithubProfileState extends State<GithubProfile> {
  @override
  void initState() {
    html.window.open('https://github.com/itz-shubham', "_self");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Loading..."),
      ),
    );
  }
}
