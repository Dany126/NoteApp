import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/widgets/custom_app_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: [
              CustomAppBar(
                icon: FaIcon(FontAwesomeIcons.check),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 30),
              CustomTextField(hint: "Title", maxLines: 1),
              SizedBox(height: 16),
              CustomTextField(hint: "Content", maxLines: 10),
            ],
          ),
        ),
      ),
    );
  }
}
