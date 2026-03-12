import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNoteCard extends StatelessWidget {
  const CustomNoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
      decoration: BoxDecoration(
        color: const Color(0xffAC3931),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              "Flutter Basics",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            subtitle: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "Build your career with Dany Ashraf",
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.trash,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),

          /// Date
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "May 10, 2026",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
