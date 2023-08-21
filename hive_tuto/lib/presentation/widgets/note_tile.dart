import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_tuto/cubit/note_cubit/note_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/utils/utils.dart';
import '../../data/models/note_model.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    super.key,
    required this.noteModel,
    required this.noteIndex,
  });
  final NoteModel noteModel;
  final int noteIndex;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          decoration: BoxDecoration(
              color: Colors.black26, borderRadius: BorderRadius.circular(12)),
          width: 60.w,
          child: const Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.note_alt_outlined),
            ],
          )),
      tileColor: Colors.white10,
      minVerticalPadding: 20.h,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(
        noteModel.title ?? "No title",
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(noteModel.content, overflow: TextOverflow.ellipsis),
      trailing: IconButton(
          onPressed: () => _showConfirmation(context),
          icon: const Icon(Icons.delete_outline_outlined)),
    );
  }

  _showConfirmation(BuildContext context) {
    showConfirmationDialog(
      context,
      AppLocalizations.of(context)!.areYouSureMessage,
      AppLocalizations.of(context)!.deleteMessage,
      okPressed: () {
        context.read<NoteCubit>().deleteNote(noteIndex);
        Navigator.pop(context);
      },
    );
  }
}
