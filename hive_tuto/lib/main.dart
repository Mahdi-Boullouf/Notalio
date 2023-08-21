import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_tuto/core/res/constants.dart';
import 'package:hive_tuto/data/models/note_model.dart';
import 'package:hive_tuto/injector.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox(kNotesBox);

  setUp();
  runApp(const MyApp());
}
