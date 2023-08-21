import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_tuto/config/routes/app_router.dart';
import 'package:hive_tuto/config/routes/app_routes.dart';
import 'package:hive_tuto/config/themes/app_theme.dart';
import 'package:hive_tuto/cubit/edit_button_status_cubit/edit_button_status_cubit.dart';

import 'package:hive_tuto/cubit/note_cubit/note_cubit.dart';
import 'package:hive_tuto/data/repositories/notes_repo_impl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_tuto/injector.dart';

import 'cubit/add_button_status_cubit/button_status_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NoteCubit(locator.get<NotesRepoImpl>()),
          ),
          BlocProvider(create: (context) => ButtonStatusCubit()),
          BlocProvider(create: (context) => EditButtonStatusCubit())
        ],
        child: MaterialApp(
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            for (var locale in supportedLocales) {
              if (deviceLocale != null &&
                  deviceLocale.languageCode == locale.languageCode) {
                return deviceLocale;
              }
            }
            return supportedLocales.first;
          },
          theme: appTheme(context),
          onGenerateRoute: AppRouter.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.welcome,
        ),
      ),
    );
  }
}
