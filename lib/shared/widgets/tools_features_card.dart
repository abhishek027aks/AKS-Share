import 'package:flutter/material.dart';

class ToolsFeaturesCard extends StatelessWidget {
  const ToolsFeaturesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Tools & Features",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              physics: const NeverScrollableScrollPhysics(),
              children: const [

                _ToolTile(
                  icon: Icons.camera_alt,
                  title: "Camera",
                  color: Color(0xFF3B82F6),
                ),

                _ToolTile(
                  icon: Icons.picture_as_pdf,
                  title: "PDF",
                  color: Color(0xFFEF4444),
                ),

                _ToolTile(
                  icon: Icons.qr_code,
                  title: "QR",
                  color: Color(0xFF8B5CF6),
                ),

                _ToolTile(
                  icon: Icons.note_alt,
                  title: "Notes",
                  color: Color(0xFF22C55E),
                ),

                _ToolTile(
                  icon: Icons.security,
                  title: "Security",
                  color: Color(0xFFF59E0B),
                ),

                _ToolTile(
                  icon: Icons.search,
                  title: "Search",
                  color: Color(0xFF06B6D4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ToolTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _ToolTile({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            icon,
            color: color,
            size: 32,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),

        ],
      ),
    );
  }
}