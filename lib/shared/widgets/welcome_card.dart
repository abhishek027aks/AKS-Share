import 'package:flutter/material.dart';

import 'feature_chip.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Welcome to AKS Share 👋",
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "All your devices. One connection. Unlimited possibilities.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 17,
            ),
          ),

          const SizedBox(height: 30),

          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [

              FeatureChip(
                icon: Icons.rocket_launch,
                title: "Fast Transfer",
                color: Colors.blue,
              ),

              FeatureChip(
                icon: Icons.security,
                title: "Secure",
                color: Colors.green,
              ),

              FeatureChip(
                icon: Icons.wifi_off,
                title: "Offline",
                color: Colors.orange,
              ),

              FeatureChip(
                icon: Icons.devices,
                title: "All Devices",
                color: Colors.cyan,
              ),
            ],
          ),
        ],
      ),
    );
  }
}