import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:insta/Responsive%20Design/mobile_screen_layout.dart';
//import 'package:insta/Responsive%20Design/responsive_screen_layout.dart';
//import 'package:insta/Responsive%20Design/web_screen_layout.dart';
import 'package:insta/Screens/login_screen.dart';
import 'package:insta/utils/colors.dart';
//import 'firebase_options.dart';

//options: DefaultFirebaseOptions.currentPlatform,
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        // home: const ResponsiveDesignLayout(
        //   mobileScreenlayout: MobileScreenLayout(),
        //   webScreenlayout: WebScreenLayout(),
        // ),
        home: const LoginScreen());
  }
}
