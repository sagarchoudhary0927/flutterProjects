import 'package:flutter/material.dart';
import 'package:instgram_clone/util/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout({super.key, required this.webScreenLayout, required this.mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        //Web view
        return webScreenLayout;
      }
      // Mobile view
      return mobileScreenLayout;
    }));
  }
}
