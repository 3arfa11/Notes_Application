import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_application/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_application/models/note_model.dart';
import 'package:notes_application/widgets/custom_appbar.dart';
import 'package:notes_application/widgets/custom_button.dart';
import 'package:notes_application/widgets/custom_textfield.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          CustomAppBar(
            onPressed: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              widget.noteModel.description =
                  description ?? widget.noteModel.description;
              widget.noteModel.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: "Edit Note",
            icon: Icons.check,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            controller: TextEditingController(text: widget.noteModel.title),
            hintText: "Title",
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            controller:
                TextEditingController(text: widget.noteModel.description),
            hintText: 'Description',
            maxLines: 5,
            onChanged: (value) {
              description = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            onTap: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              widget.noteModel.description =
                  description ?? widget.noteModel.description;
              widget.noteModel.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            text: "Save",
          )
        ],
      ),
    );
  }
}
