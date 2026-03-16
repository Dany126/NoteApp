import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Cubits/addNotesCubits/add_note_states.dart';
import 'package:note_app/Cubits/addNotesCubits/add_notes_cubit.dart';
import 'package:note_app/Models/note_model.dart';

import 'package:note_app/widgets/custom_bottom.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String title = '';
  String content = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Form(
          key: formKey,
          // SINGLE Form widget wrapping ALL fields
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 32),
              CustomTextField(
                hint: "Title",
                maxLines: 1,
                onSaved: (value) {
                  title = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title can't be empty";
                  }

                  return null; // Return null means no error
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hint: "Content",
                maxLines: 5,
                onSaved: (value) {
                  content = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Content can't be empty";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              BlocBuilder<AddNotesCubit, AddNoteStates>(
                builder: (context, state) {
                  return CustomBottom(
                    isLoading: state is AddNoteLoading ? true : false,
                    onTap: () {
                      state is AddNoteLoading ? true : false;
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        var note = NoteModel(
                          title: title,
                          content: content,
                          date: DateTime.now().toString(),
                          color: _getRandomColor(),
                        );
                        BlocProvider.of<AddNotesCubit>(context).addNotes(note);
                        Navigator.of(context).pop();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Note saved successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _getRandomColor() {
    List<int> colors = const [
      0xFF4CAF50, // Green
      0xFF2196F3, // Blue
      0xFFFF9800, // Orange
      0xFFE91E63, // Pink
      0xFF9C27B0, // Purple
      0xFFFF5722, // Deep Orange
      0xFF3F51B5, // Indigo
    ];
    return colors[DateTime.now().millisecond % colors.length];
  }
}
