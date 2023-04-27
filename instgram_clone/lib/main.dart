import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instgram_clone/screens/sign_up_screen.dart';
import '../screens/login_screen.dart';
import 'resposiveScreen/mobile_view_layout.dart';
import 'resposiveScreen/web_view_layout.dart';
import 'resposiveScreen/resposive_layout_screen.dart';
import 'util/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // This ensures all the Widgets
  await Firebase.initializeApp(); // This initailsie the application with firebase (You have to add dependency of firebase in pubspec.yaml)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        //NOTE:-> Here in theme field of material app we have used ThemeData.dark().copywith()
        // copyWith copied the all fields of ThemeData.dark() with different value of scaffoldBackgroundColor as mentined in the code
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        // home: const ResponsiveLayout(webScreenLayout: WebViewLayout(), mobileScreenLayout: MobileViewLayout()));
        home: const SignUpScreenWidget());
  }
}
