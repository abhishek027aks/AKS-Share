import 'package:flutter/material.dart';

class ClipboardSearch extends StatelessWidget {
  const ClipboardSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xff111827),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: const TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white54,
          ),
          hintText: "Search Clipboard...",
          hintStyle: TextStyle(
            color: Colors.white38,
          ),
        ),
      ),
    );
  }
}