import 'package:flutter/material.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      color: const Color(0xFF111827),
      child: Column(
        children: [

          const SizedBox(height: 20),

          // Logo
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.devices_rounded,
                color: Color(0xFF3B82F6),
                size: 34,
              ),
              SizedBox(width: 10),
              Text(
                "AKS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                " Share",
                style: TextStyle(
                  color: Color(0xFF22C55E),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [

                SidebarItem(
                  icon: Icons.dashboard_rounded,
                  title: "Dashboard",
                  selected: true,
                ),

                SidebarItem(
                  icon: Icons.folder_rounded,
                  title: "File Transfer",
                ),

                SidebarItem(
                  icon: Icons.content_paste_rounded,
                  title: "Clipboard",
                ),

                SidebarItem(
                  icon: Icons.sync_rounded,
                  title: "Smart Sync",
                ),

                SidebarItem(
                  icon: Icons.phone_android,
                  title: "Phone Manager",
                ),

                SidebarItem(
                  icon: Icons.computer,
                  title: "PC Manager",
                ),

                SidebarItem(
                  icon: Icons.camera_alt,
                  title: "Camera Tools",
                ),

                SidebarItem(
                  icon: Icons.notifications,
                  title: "Notification",
                ),

                SidebarItem(
                  icon: Icons.note,
                  title: "Notes",
                ),

                SidebarItem(
                  icon: Icons.picture_as_pdf,
                  title: "Documents",
                ),

                SidebarItem(
                  icon: Icons.security,
                  title: "Security",
                ),

                SidebarItem(
                  icon: Icons.settings,
                  title: "Settings",
                ),
              ],
            ),
          ),

          const Divider(color: Colors.white10),

          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [

                Text(
                  "AKS Share",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "v0.1.0 Alpha",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.title,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: selected
            ? const Color(0xFF2563EB)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}