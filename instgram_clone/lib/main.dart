import 'package:flutter/material.dart';
import 'resposiveScreen/mobile_view_layout.dart';
import 'resposiveScreen/web_view_layout.dart';
import 'resposiveScreen/resposive_layout_screen.dart';
import 'util/colors.dart';

void main() {
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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      home: const ResponsiveLayout(webScreenLayout: WebViewLayout(), mobileScreenLayout: MobileViewLayout())
    );
  }
}