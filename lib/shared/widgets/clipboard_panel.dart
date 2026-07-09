import 'package:flutter/material.dart';

import 'clipboard_item.dart';
import 'clipboard_search.dart';
import 'clipboard_section_title.dart';

class ClipboardPanel extends StatelessWidget {
  const ClipboardPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      color: const Color(0xff111827),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Clipboard",
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 22),

          const ClipboardSearch(),

          const ClipboardSectionTitle(
            title: "Pinned",
          ),

          const ClipboardItem(
            icon: Icons.push_pin,
            title: "Hello World",
            subtitle: "Pinned Text",
            color: Colors.orange,
          ),

          const ClipboardSectionTitle(
            title: "Text",
          ),

          const ClipboardItem(
            icon: Icons.description,
            title: "Flutter is Awesome",
            subtitle: "Copied 2 min ago",
            color: Colors.blue,
          ),

          const ClipboardSectionTitle(
            title: "Images",
          ),

          const ClipboardItem(
            icon: Icons.image,
            title: "photo.png",
            subtitle: "1.8 MB",
            color: Colors.green,
          ),

          const ClipboardSectionTitle(
            title: "Files",
          ),

          const ClipboardItem(
            icon: Icons.insert_drive_file,
            title: "Resume.pdf",
            subtitle: "532 KB",
            color: Colors.red,
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.delete_outline),
              label: const Text("Clear Clipboard"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                foregroundColor: Colors.white,
                minimumSize: const Size(0, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}