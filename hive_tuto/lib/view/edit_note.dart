import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_tuto/core/res/constants.dart';
import 'package:hive_tuto/cubit/edit_button_status_cubit/edit_button_status_cubit.dart';
import 'package:hive_tuto/cubit/note_cubit/note_cubit.dart';

import 'package:hive_tuto/view/widgets/custom_app_bar.dart';
import 'package:hive_tuto/view/widgets/custom_rich_text_field.dart';
import 'package:hive_tuto/view/widgets/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../data/models/note_model.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen(
      {super.key, required this.noteModel, required this.noteIndex});
  final NoteModel noteModel;
  final int noteIndex;
  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  final noteTitleController = TextEditingController();
  final noteContentController = TextEditingController();
  String noteTitle = '';
  String noteContent = '';
  bool isModifiable = false;
  final box = Hive.box(kNotesBox);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noteContentController.text = widget.noteModel.content;
    noteTitleController.text = widget.noteModel.title ?? '';
    noteContent = widget.noteModel.content;
    noteTitle = widget.noteModel.title ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              title: AppLocalizations.of(context)!.editNote,
              actions: [
                BlocBuilder<EditButtonStatusCubit, EditButtonStatusState>(
                  builder: (context, state) {
                    return IconButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white10)),
                      onPressed: state is EditButtonStatusEnabled
                          ? () {
                              context
                                  .read<NoteCubit>()
                                  .editNote(
                                      widget.noteIndex,
                                      widget.noteModel.updateNoteModelInfo(
                                          noteTitleController.text,
                                          noteContentController.text))
                                  .whenComplete(() {
                                noteTitle = noteTitleController.text;
                                noteContent = noteContentController.text;

                                context
                                    .read<EditButtonStatusCubit>()
                                    .checkButtonStatus(
                                        noteTitleController.text,
                                        noteContentController.text,
                                        noteTitle,
                                        noteContent);
                              });
                            }
                          : null,
                      color: Colors.white,
                      disabledColor: Colors.white10,
                      icon: const Icon(
                        Icons.done_rounded,
                      ),
                    );
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _body(),
            )
          ],
        ),
      ),
    );
  }

  Column _body() {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 26.h,
              ),
              CustomTextField(
                controller: noteTitleController,
                hintText: AppLocalizations.of(context)!.noteTitle,
                onChanged: (p0) {
                  context.read<EditButtonStatusCubit>().checkButtonStatus(
                      noteTitleController.text,
                      noteContentController.text,
                      noteTitle,
                      noteContent);
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomRichTextField(
                  controller: noteContentController,
                  hintText: AppLocalizations.of(context)!.noteContent,
                  onChanged: (p0) {
                    context.read<EditButtonStatusCubit>().checkButtonStatus(
                        noteTitleController.text,
                        noteContentController.text,
                        noteTitle,
                        noteContent);
                  })
            ],
          ),
        ),
      ],
    );
  }
}
