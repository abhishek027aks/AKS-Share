import 'package:flutter/material.dart';

import '../../shared/widgets/app_sidebar.dart';
import '../../shared/widgets/top_bar.dart';
import '../../shared/widgets/welcome_card.dart';
import '../../shared/widgets/quick_actions_grid.dart';
import '../../shared/widgets/device_status_card.dart';
import '../../shared/widgets/storage_overview_card.dart';
import '../../shared/widgets/recent_transfers_card.dart';
import '../../shared/widgets/clipboard_panel.dart';
// Naye widgets ke imports
import '../../shared/widgets/tools_features_card.dart'; 
import '../../shared/widgets/quick_notes_panel.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),

      body: Row(
        children: [

          // LEFT SIDEBAR
          const AppSidebar(),

          // CENTER CONTENT
          Expanded(
            child: Column(
              children: [

                const TopBar(),

                Expanded(
                  child: Container(
                    color: const Color(0xFF0B1120),

                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const WelcomeCard(),

                          const SizedBox(height: 28),

                          const QuickActionsGrid(),

                          const SizedBox(height: 28),

                          // Pehli Row (Device Status, Storage, Transfers)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                child: DeviceStatusCard(),
                              ),

                              const SizedBox(width: 18),

                              Expanded(
                                child: StorageOverviewCard(),
                              ),

                              const SizedBox(width: 18),

                              Expanded(
                                child: RecentTransfersCard(),
                              ),

                            ],
                          ),

                          const SizedBox(height: 28),

                          // Nayi Row (Tools Features aur Quick Notes)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(
                                flex: 2,
                                child: ToolsFeaturesCard(),
                              ),

                              const SizedBox(width: 18),

                              const Expanded(
                                child: QuickNotesPanel(),
                              ),

                            ],
                          ),

                          const SizedBox(height: 28),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // RIGHT PANEL
          const ClipboardPanel(),

        ],
      ),
    );
  }
}