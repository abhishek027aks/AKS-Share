import 'package:flutter/material.dart';

class RecentTransfersCard extends StatelessWidget {
  const RecentTransfersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Transfers",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          Icon(
            Icons.folder_zip,
            size: 60,
            color: Colors.green,
          ),

          SizedBox(height: 15),

          Text(
            "No recent transfers",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}