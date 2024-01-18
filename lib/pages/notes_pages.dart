import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget{
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

//----UI Related---- 
  //create a note
 void createNote() {

 }

  //read notes


  //update notes


  //delete notes


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(title: const Text('Notes')),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
      ),
   );
  }
}