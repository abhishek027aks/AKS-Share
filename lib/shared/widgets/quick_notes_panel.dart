import 'package:flutter/material.dart';

class QuickNotesPanel extends StatelessWidget {
  const QuickNotesPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 280,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quick Notes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.add, color: Colors.white),
              ],
            ),
            
            const SizedBox(height: 20),

            // Overflow fix karne ke liye notes ko Expanded > ListView me daal diya
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero, // ListView ki default padding remove karne ke liye
                children: [
                  _note(
                    "Meeting at 5 PM",
                    "Don't forget project review",
                    Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _note(
                    "Buy Groceries",
                    "Milk • Bread • Eggs",
                    Colors.teal,
                  ),
                  const SizedBox(height: 12),
                  _note(
                    "Ideas",
                    "AI File Search\nCross Device Notes",
                    Colors.blueGrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _note(String title, String body, Color color) {
    // Yahan se 'Expanded' hata diya taaki ListView ke andar error na aaye
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(.18),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          const SizedBox(height: 6),
          
          Text(
            body,
            maxLines: 2, // Text ko 2 lines tak limit kar diya
            overflow: TextOverflow.ellipsis, // Extra text ko '...' se replace kar diya
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}