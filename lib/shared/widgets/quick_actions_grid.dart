import 'package:flutter/material.dart';
import 'quick_action_card.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Quick Actions",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        Wrap(
          spacing: 18,
          runSpacing: 18,
          children: const [

            QuickActionCard(
              icon: Icons.upload_rounded,
              title: "Send Files",
              color: Color(0xFF3B82F6),
            ),

            QuickActionCard(
              icon: Icons.download_rounded,
              title: "Receive Files",
              color: Color(0xFF22C55E),
            ),

            QuickActionCard(
              icon: Icons.content_paste_rounded,
              title: "Clipboard",
              color: Color(0xFF8B5CF6),
            ),

            QuickActionCard(
              icon: Icons.sync_rounded,
              title: "Smart Sync",
              color: Color(0xFFF59E0B),
            ),

            QuickActionCard(
              icon: Icons.phone_android_rounded,
              title: "Phone Manager",
              color: Color(0xFF0EA5E9),
            ),

            QuickActionCard(
              icon: Icons.dashboard_customize_rounded,
              title: "More Tools",
              color: Color(0xFF6366F1),
            ),

          ],
        ),

      ],
    );
  }
}