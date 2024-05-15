import 'package:flutter/material.dart';

import 'package:insta/utils/dimension.dart';

class ResponsiveDesignLayout extends StatelessWidget {
  final Widget webScreenlayout;
  final Widget mobileScreenlayout;

  const ResponsiveDesignLayout(
      {super.key,
      required this.webScreenlayout,
      required this.mobileScreenlayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        //WEBSCRREEN
        return webScreenlayout;
      }
      return mobileScreenlayout;
    });
  }
}
