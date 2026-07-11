import 'package:flutter/material.dart';

import 'breakpoints.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        final width = constraints.maxWidth;

        if (width >= Breakpoints.desktop) {
          return desktop;
        }

        if (width >= Breakpoints.tablet) {
          return tablet;
        }

        return mobile;
      },
    );
  }
}