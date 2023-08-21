import 'package:flutter/material.dart';
import 'package:hive_tuto/config/routes/app_routes.dart';
import 'package:hive_tuto/data/models/note_model.dart';
import 'package:hive_tuto/view/edit_note.dart';
import 'package:hive_tuto/view/home.dart';
import 'package:hive_tuto/view/welcome.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case AppRoutes.edit:
        NoteModel noteModel = (settings.arguments as List)[0];
        int noteIndex = (settings.arguments as List)[1];
        return MaterialPageRoute(
          builder: (context) => EditNoteScreen(
            noteModel: noteModel,
            noteIndex: noteIndex,
          ),
        );
      default:
        return null;
    }
  }
}
