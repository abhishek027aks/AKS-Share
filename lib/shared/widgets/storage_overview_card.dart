import 'package:flutter/material.dart';

class StorageOverviewCard extends StatelessWidget {
  const StorageOverviewCard({super.key});

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
            "Storage",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          Icon(
            Icons.storage,
            size: 60,
            color: Colors.blue,
          ),

          SizedBox(height: 15),

          Text(
            "0 GB / 0 GB",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}