import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note_database.dart';
import 'package:flutter_application_1/pages/notes_pages.dart';
import 'package:provider/provider.dart';

void main() async{

  //initialize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(
   ChangeNotifierProvider(
    create: (context) => NoteDatabase(),
    child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}
