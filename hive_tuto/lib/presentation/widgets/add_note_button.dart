import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_tuto/core/res/context_extension.dart';

import 'package:hive_tuto/presentation/widgets/disabled_button.dart';
import 'package:hive_tuto/presentation/widgets/loading_button.dart';

import '../../cubit/add_button_status_cubit/button_status_cubit.dart';
import '../../cubit/note_cubit/note_cubit.dart';
import '../../data/models/note_model.dart';
import 'custom_rich_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'custom_text_field.dart';

class AddNoteButton extends StatelessWidget {
  AddNoteButton({
    super.key,
  });

  final titleController = TextEditingController();

  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () => _addNote(context),
        child: Text(
          AppLocalizations.of(context)!.add,
          style: const TextStyle(color: Colors.white70),
        ));
  }

  _addNote(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: context.keyboardBottomPadding),
        child: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).cardColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.add,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Icon(Icons.note_add_outlined),
                    ],
                  ),
                ),
                CustomTextField(
                    controller: titleController,
                    hintText: AppLocalizations.of(context)!.noteTitle),
                SizedBox(
                  height: 10.h,
                ),
                CustomRichTextField(
                  controller: contentController,
                  hintText: AppLocalizations.of(context)!.noteContent,
                  onChanged: (p0) {
                    context.read<ButtonStatusCubit>().checkButtonStatus(p0);
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                BlocConsumer<NoteCubit, NoteState>(
                  listener: (context, state) {
                    if (state is AddNoteCompleted) {
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    if (state is AddNoteLoading) {
                      return const LoadingButton();
                    } else {
                      return BlocBuilder<ButtonStatusCubit, ButtonStatusState>(
                        builder: (context, state) {
                          if (state is ButtonStatusEnabled) {
                            return FilledButton(
                              onPressed: () => contentController.text.isNotEmpty
                                  ? context.read<NoteCubit>().addNote(NoteModel(
                                      titleController.text,
                                      content: contentController.text,
                                      addedDate: DateTime.now()))
                                  : null,
                              child: Text(
                                AppLocalizations.of(context)!.add,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          } else {
                            return DisabledButton(
                              text: AppLocalizations.of(context)!.add,
                            );
                          }
                        },
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
