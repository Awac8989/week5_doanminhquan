import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note.dart';

class WebStorageHelper {
  static const String _notesKey = 'notes';
  static const String _idCounterKey = 'note_id_counter';

  // CREATE - Add a new note
  static Future<Note> createNote(Note note) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Get current ID counter
    int currentId = prefs.getInt(_idCounterKey) ?? 0;
    currentId++;
    
    // Create note with new ID
    final newNote = note.copyWith(id: currentId);
    
    // Get existing notes
    final notes = await readAllNotes();
    notes.insert(0, newNote);
    
    // Save to storage
    await _saveNotes(notes);
    await prefs.setInt(_idCounterKey, currentId);
    
    return newNote;
  }

  // READ - Get all notes
  static Future<List<Note>> readAllNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final notesJson = prefs.getStringList(_notesKey) ?? [];
    
    return notesJson.map((noteJson) {
      final noteMap = jsonDecode(noteJson) as Map<String, dynamic>;
      return Note.fromMap(noteMap);
    }).toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }

  // READ - Get a specific note by id
  static Future<Note?> readNote(int id) async {
    final notes = await readAllNotes();
    try {
      return notes.firstWhere((note) => note.id == id);
    } catch (e) {
      return null;
    }
  }

  // UPDATE - Update an existing note
  static Future<void> updateNote(Note note) async {
    final notes = await readAllNotes();
    final index = notes.indexWhere((n) => n.id == note.id);
    
    if (index != -1) {
      notes[index] = note;
      await _saveNotes(notes);
    }
  }

  // DELETE - Delete a note
  static Future<void> deleteNote(int id) async {
    final notes = await readAllNotes();
    notes.removeWhere((note) => note.id == id);
    await _saveNotes(notes);
  }

  // DELETE ALL - Clear all notes
  static Future<void> deleteAllNotes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_notesKey);
    await prefs.remove(_idCounterKey);
  }

  // Helper method to save notes
  static Future<void> _saveNotes(List<Note> notes) async {
    final prefs = await SharedPreferences.getInstance();
    final notesJson = notes.map((note) => jsonEncode(note.toMap())).toList();
    await prefs.setStringList(_notesKey, notesJson);
  }
}