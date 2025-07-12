import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zapway/pages/home.dart';
import 'package:zapway/pages/signin.dart';
import 'package:zapway/pages/signup.dart';
import 'package:zapway/pages/search.dart';
import 'package:zapway/pages/profile.dart';

Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
  await FirebaseAuth.instance.setLanguageCode('en');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZapWay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3CB9AD)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/search': (context) => const SearchPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

// Main file now only contains the app initialization
// The home page has been moved to lib/pages/home.dart
