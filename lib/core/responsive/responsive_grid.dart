import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {

  final List<Widget> children;

  const ResponsiveGrid({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(

      builder: (context, constraints) {

        int count = 1;

        if (constraints.maxWidth > 1500) {
          count = 4;
        } else if (constraints.maxWidth > 1100) {
          count = 3;
        } else if (constraints.maxWidth > 750) {
          count = 2;
        }

        return GridView.count(

          shrinkWrap: true,

          physics: const NeverScrollableScrollPhysics(),

          crossAxisCount: count,

          crossAxisSpacing: 16,

          mainAxisSpacing: 16,

          childAspectRatio: 1.5,

          children: children,
        );
      },
    );
  }
}