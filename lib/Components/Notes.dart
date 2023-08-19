import 'package:dtc_app/Constants/TextStyle.dart';
import 'package:dtc_app/api/models/note_model.dart';
import 'package:flutter/material.dart';
import '../Constants/Colors.dart';

class Note extends StatefulWidget {
  const Note({
    super.key,
    required this.noteTitle,
    required this.noteClassification,
    required this.noteText,
    required this.onEditPressed,
    required this.onDeletePressed,
    required this.note,
  });
  final String noteTitle;
  final String noteClassification;
  final String noteText;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  final NoteModel note;

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
      decoration: BoxDecoration(
          color: WhiteColor,
          border: Border.all(width: 0.5, color: GreyColor),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: GreyColor, blurRadius: 2, offset: Offset(2, 2))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                labelFont(text: widget.noteTitle),
                const Spacer(
                  flex: 1,
                ),
                bodyText(text: widget.noteClassification)
              ],
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            const Divider(
              color: GreyColor,
              thickness: 1,
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            Row(
              children: [
                Expanded(child: bodyText(text: widget.noteText)),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: widget.onEditPressed,
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: widget.onDeletePressed,
                      icon: const Icon(Icons.delete),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
