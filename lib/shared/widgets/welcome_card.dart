import 'package:flutter/material.dart';

import 'feature_chip.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to AKS Share',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'One App. All Your Devices.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              FeatureChip(
                icon: Icons.rocket_launch,
                title: 'Fast Transfer',
                subtitle: 'Lightning fast speed',
                color: Colors.blue,
              ),
              FeatureChip(
                icon: Icons.security,
                title: 'Secure',
                subtitle: 'End-to-end encrypted',
                color: Colors.green,
              ),
              FeatureChip(
                icon: Icons.wifi_off,
                title: 'Offline',
                subtitle: 'No internet required',
                color: Colors.orange,
              ),
              FeatureChip(
                icon: Icons.devices,
                title: 'All Devices',
                subtitle: 'Works on multiple devices',
                color: Colors.cyan,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
