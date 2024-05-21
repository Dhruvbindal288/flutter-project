import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta/Responsive%20Design/mobile_screen_layout.dart';
import 'package:insta/Responsive%20Design/responsive_screen_layout.dart';
import 'package:insta/Responsive%20Design/web_screen_layout.dart';
//import 'package:insta/Responsive%20Design/mobile_screen_layout.dart';
//import 'package:insta/Responsive%20Design/responsive_screen_layout.dart';
//import 'package:insta/Responsive%20Design/web_screen_layout.dart';
import 'package:insta/Screens/login_screen.dart';
import 'package:insta/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAd9zisF0N3Z30uFduvtn2NmqGvft5UKIQ',
    appId: '1:292547527158:android:6295a81bf14f4e107e07d7',
    messagingSenderId: '1:292547527158:android:6295a81bf14f4e107e07d7',
    projectId: 'insta-69158',
    storageBucket: 'insta-69158.appspot.com',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const ResponsiveDesignLayout(
                mobileScreenlayout: MobileScreenLayout(),
                webScreenlayout: WebScreenLayout(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Some error occurred! Please restart your app.'),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
