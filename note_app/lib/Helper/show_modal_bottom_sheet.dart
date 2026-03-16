// In your main file or a separate utils file
import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_show_sheet.dart';

void showNoteBottomSheet(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return const CustomBottomModelSheet();
    },
  );
}
