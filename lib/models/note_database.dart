import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier{
  static late Isar isar;


//INITIALIZE - DATABASE
static Future<void> initialize() async{   //method to initialize
  final dir = await getApplicationDocumentsDirectory();  //gets us the path directory were everything is going to be saved
  isar = await Isar.open(
    [NoteSchema], //tells us type of data inside
    directory: dir.path,
    );
}
//list of notes
final List<Note> currentNotes = []; //this is going to be empty at the beginning

//CREATE - a note and save to db
Future<void> addNote(String textFromUser) async{

  //create a new note object
  final newNote = Note()..text = textFromUser;

  //save to db
  await isar.writeTxn(() => isar.notes.put(newNote));  //Txn = transaction

  // re-read from db
  fetchNotes();
}
//READ - notes from db 
Future<void> fetchNotes() async{
  List<Note> fetchedNotes = await isar.notes.where().findAll();//grabs all of the notes from the database
  currentNotes.clear();
  currentNotes.addAll(fetchedNotes);
  notifyListeners(); // going to notify the widgets which are listening to these changes
}
//UPDATE - a note in db
Future<void> updateNote(int id, String newText) async{
  final existingNote = await isar.notes.get(id); //get the existing note identified by the id
  if (existingNote != null) {
    existingNote.text = newText;
    await isar.writeTxn(() => isar.notes.put(existingNote));//writing the transaction again and update the existing notes
    await fetchNotes(); //read everything by fetchnotes method
  }
}

//DELETE - a note from the db
Future<void> deleteNote(int id) async{  //for deleting we'll need id and txn
  await isar.writeTxn(() => isar.notes.delete(id));
  await fetchNotes();
}
}