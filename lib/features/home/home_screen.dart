import 'package:flutter/material.dart';
import '../../shared/widgets/app_sidebar.dart';
import '../../shared/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),
      body: Row(
        children: [

          // Left Sidebar
          const AppSidebar(),

          // Main Dashboard
          Expanded(
            child: Column(
              children: [

                const TopBar(),

                Expanded(
                  child: Container(
                    color: const Color(0xFF0B1120),
                    child: const Center(
                      child: Text(
                        "AKS Share Dashboard",
                        style: TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          // Right Panel
          Container(
            width: 320,
            color: const Color(0xFF111827),
            child: const Center(
              child: Text(
                "Clipboard",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}