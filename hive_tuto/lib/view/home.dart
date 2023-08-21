import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_tuto/config/routes/app_routes.dart';
import 'package:hive_tuto/core/utils/utils.dart';

import 'package:hive_tuto/view/widgets/add_note_button.dart';

import 'package:hive_tuto/view/widgets/custom_app_bar.dart';
import 'package:hive_tuto/view/widgets/note_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/note_cubit/note_cubit.dart';
import '../data/models/note_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NoteModel> notesList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NoteCubit>().getNotes();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          color: Colors.black12,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          child: AddNoteButton()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: AppLocalizations.of(context)!.title),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: _body(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
        if (state is GetNotesCompleted) {
          notesList.clear();
          notesList.addAll(state.notesList);
        } else if (state is AddNoteCompleted) {
          notesList.add(state.note);
        } else if (state is DeleteNoteCompleted) {
          notesList.removeAt(state.noteIndex);
        } else if (state is UpdateNoteCompleted) {
          FocusManager.instance.primaryFocus?.unfocus();

          notesList.removeAt(state.noteIndex);
          notesList.insert(state.noteIndex, state.newNote);
        }
      },
      builder: (context, state) {
        if (state is GetNotesLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state is GetNotesCompleted ||
            state is AddNoteCompleted ||
            state is DeleteNoteCompleted ||
            state is UpdateNoteCompleted) {
          if (notesList.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150.h,
                ),
                InfoWidget(title: AppLocalizations.of(context)!.noNotesMessage),
              ],
            );
          }
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notesList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(bottom: 10.h),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.edit,
                        arguments: [notesList[index], index]);
                  },
                  child: NoteTile(
                    noteModel: notesList[index],
                    noteIndex: index,
                  )),
            ),
          );
        }
        return Container();
      },
    );
  }
}
