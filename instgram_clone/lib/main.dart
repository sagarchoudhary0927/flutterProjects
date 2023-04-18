import 'package:flutter/material.dart';
import 'package:instgram_clone/util/colors.dart';

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
      home: Scaffold(
        body: Text("Instagram Clone"),
      )
    );
  }
}