import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_text_field.dart';

class CustomBottomModelSheet extends StatelessWidget {
  const CustomBottomModelSheet({super.key});
  void customBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const CustomBottomModelSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: const [
            SizedBox(height: 32),

            CustomTextField(hint: "Title", maxLines: 1),
            SizedBox(height: 16),
            CustomTextField(hint: "Content", maxLines: 5),
          ],
        ),
      ),
    );
  }
}
