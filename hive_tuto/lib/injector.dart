import 'package:get_it/get_it.dart';
import 'package:hive_tuto/data/repositories/notes_repo_impl.dart';

final locator = GetIt.I;
setUp() {
  locator.registerLazySingleton<NotesRepoImpl>(() => NotesRepoImpl());
}
