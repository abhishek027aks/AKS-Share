import 'package:flutter/material.dart';

import '../../shared/widgets/app_sidebar.dart';
import '../../shared/widgets/top_bar.dart';
import '../../shared/widgets/welcome_card.dart';
import '../../shared/widgets/quick_actions_grid.dart';
import '../../shared/widgets/device_status_card.dart';
import '../../shared/widgets/storage_overview_card.dart';
import '../../shared/widgets/recent_transfers_card.dart';
import '../../shared/widgets/clipboard_panel.dart';
import '../../shared/widgets/tools_features_card.dart';
import '../../shared/widgets/quick_notes_panel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final showClipboard = constraints.maxWidth >= 1380;

          final double cardWidth = constraints.maxWidth >= 1700
              ? 360
              : constraints.maxWidth >= 1500
                  ? 340
                  : constraints.maxWidth >= 1200
                      ? 320
                      : double.infinity;

          final double toolsWidth = constraints.maxWidth >= 1700
              ? 720
              : constraints.maxWidth >= 1500
                  ? 680
                  : double.infinity;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const AppSidebar(),

              Expanded(
                child: Column(
                  children: [

                    const TopBar(),

                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment(0.75, -0.2),
                            radius: 1.1,
                            colors: [
                              Color(0xFF11214A),
                              Color(0xFF0B1120),
                            ],
                          ),
                        ),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(22, 20, 22, 28),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const WelcomeCard(),

                              const SizedBox(height: 20),

                              const QuickActionsGrid(),

                              const SizedBox(height: 20),

                              Wrap(
                                spacing: 16,
                                runSpacing: 16,
                                children: [

                                  SizedBox(
                                    width: cardWidth,
                                    child: const DeviceStatusCard(),
                                  ),

                                  SizedBox(
                                    width: cardWidth,
                                    child: const StorageOverviewCard(),
                                  ),

                                  SizedBox(
                                    width: cardWidth,
                                    child: const RecentTransfersCard(),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              Wrap(
                                spacing: 16,
                                runSpacing: 16,
                                children: [

                                  SizedBox(
                                    width: toolsWidth,
                                    child: const ToolsFeaturesCard(),
                                  ),

                                  SizedBox(
                                    width: cardWidth,
                                    child: const QuickNotesPanel(),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              if (showClipboard)
                const SizedBox(
                  width: 330,
                  child: ClipboardPanel(),
                ),
            ],
          );
        },
      ),
    );
  }
}
