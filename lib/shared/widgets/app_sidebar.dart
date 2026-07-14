import 'package:flutter/material.dart';

import '../../app/routes.dart';

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute =
        ModalRoute.of(context)?.settings.name ?? AppRoutes.home;

    return Container(
      width: 254,
      decoration: const BoxDecoration(
        color: Color(0xFF071225),
        border: Border(right: BorderSide(color: Color(0x1AFFFFFF))),
      ),
      child: Column(
        children: [
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Icon(
                  Icons.devices_other_rounded,
                  color: Color(0xFF22D3EE),
                  size: 38,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'AKS ',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: 'Share',
                              style: TextStyle(color: Color(0xFF22C55E)),
                            ),
                          ],
                        ),
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'All in One Device Companion',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                SidebarItem(
                  icon: Icons.dashboard_rounded,
                  title: 'Dashboard',
                  routeName: AppRoutes.home,
                  selected: currentRoute == AppRoutes.home,
                ),
                SidebarItem(
                  icon: Icons.devices_rounded,
                  title: 'Device Manager',
                  routeName: AppRoutes.devices,
                  selected: currentRoute == AppRoutes.devices,
                ),
                const SidebarItem(
                  icon: Icons.description_outlined,
                  title: 'File Transfer',
                ),
                const SidebarItem(
                  icon: Icons.content_paste_rounded,
                  title: 'Clipboard',
                ),
                const SidebarItem(
                  icon: Icons.sync_rounded,
                  title: 'Smart Sync',
                ),
                const SidebarItem(
                  icon: Icons.phone_android,
                  title: 'Phone Manager',
                ),
                const SidebarItem(icon: Icons.computer, title: 'PC Manager'),
                const SidebarItem(
                  icon: Icons.camera_alt_outlined,
                  title: 'Camera Tools',
                ),
                const SidebarItem(
                  icon: Icons.notifications_none_rounded,
                  title: 'Notification Center',
                ),
                const SidebarItem(
                  icon: Icons.note_alt_outlined,
                  title: 'Notes & Workspace',
                ),
                const SidebarItem(
                  icon: Icons.picture_as_pdf_outlined,
                  title: 'Document Tools',
                ),
                const SidebarItem(
                  icon: Icons.security_rounded,
                  title: 'Security',
                ),
                const SidebarItem(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(14, 12, 14, 18),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0B1A33),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.wifi_rounded,
                      color: Color(0xFF22D3EE),
                      size: 34,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Offline Mode',
                            style: TextStyle(
                              color: Color(0xFF22C55E),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Works on Local Network',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: null,
                    style: OutlinedButton.styleFrom(
                      disabledForegroundColor: const Color(0xFF8B5CF6),
                      side: const BorderSide(color: Color(0xFF1E2B52)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Hotspot Mode'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'AKS Share v1.0.0',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
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
  final String? routeName;
  final bool selected;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.title,
    this.routeName,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF1D4ED8) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          dense: true,
          minLeadingWidth: 24,
          onTap: routeName == null || selected
              ? null
              : () => Navigator.of(context).pushReplacementNamed(routeName!),
          leading: Icon(
            icon,
            color: selected ? Colors.white : Colors.white70,
            size: 23,
          ),
          title: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: selected
                  ? Colors.white
                  : Colors.white.withValues(alpha: 0.88),
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
