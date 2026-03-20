import 'package:flutter/material.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/widgets/custom_note_card.dart';

class NotesSearchDelegate extends SearchDelegate<String> {
  final List<NoteModel> notes;
  NotesSearchDelegate(this.notes);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final results = notes
        .where(
          (note) =>
              note.title.toLowerCase().contains(query.toLowerCase()) ||
              note.content.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    if (results.isEmpty) {
      return const Center(
        child: Text('No notes found', style: TextStyle(color: Colors.grey)),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return CustomNoteCard(note: results[index]);
      },
    );
  }
}
