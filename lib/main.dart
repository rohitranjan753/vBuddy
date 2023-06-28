import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vbuddyproject/Constants/color_constant.dart';
import 'package:vbuddyproject/SplashScreen/splash_screen.dart';
import 'package:vbuddyproject/authMainScreen/auth_screen.dart';
import 'package:vbuddyproject/nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color myAppBarColor = Color(0x76000000);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: mainUiColour,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: SplashScreen(),
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (BuildContext context, snapshot) {
      //     // if (snapshot.connectionState == ConnectionState.waiting) {
      //     //   return SplashScreen();
      //     // }
      //     if (snapshot.hasData) {
      //       // return NavBar();
      //         return NavBar();
      //     } else {
      //       return AuthScreen();
      //     }
      //   },
      // ),
    );
  }
}
