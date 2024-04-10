import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_notes/core/utils/constance.dart';
import 'package:my_notes/core/utils/theme.dart';

import 'core/bloc_observer/bloc_observer.dart';
import 'core/dependancy_injection/dependancy_injection.dart';
import 'module/data/models/notes_model.dart';
import 'module/presentation/screens/notes_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>(AppConstance.notesBox);

  Bloc.observer = MyBlocObserver();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const NotesScreen(),
    );
  }
}
