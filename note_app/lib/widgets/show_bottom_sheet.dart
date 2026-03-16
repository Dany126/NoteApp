import 'package:flutter/material.dart';
import 'package:note_app/Cubits/addNotesCubits/add_note_states.dart';
import 'package:note_app/Cubits/addNotesCubits/add_notes_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/widgets/add_note_form.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),

      child: BlocConsumer<AddNotesCubit, AddNoteStates>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Note Added Successfully"),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is AddNoteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: const AddNoteForm(),
          );
        },
      ),
    );
  }
}
