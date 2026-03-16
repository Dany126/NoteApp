import 'package:flutter/material.dart';
import 'package:note_app/constant.dart';

import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_notes_view.dart';
import 'package:note_app/Helper/show_modal_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showNoteBottomSheet(context);
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomAppBar(icon: const Icon(Icons.search), onPressed: () {}),
              const SizedBox(height: 20),

              /// Expanded should be HERE
              const Expanded(child: CustomNotesView()),
            ],
          ),
        ),
      ),
    );
  }
}
