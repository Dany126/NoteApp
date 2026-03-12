import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_note_card.dart';

class CustomNotesView extends StatelessWidget {
  const CustomNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CustomNoteCard(),
        SizedBox(height: 12),
        CustomNoteCard(),
      ],
    );
  }
}
