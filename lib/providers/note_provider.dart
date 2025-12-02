import 'package:flutter/foundation.dart';
import '../models/note.dart';
import '../database/db_helper.dart';

class NoteProvider extends ChangeNotifier {
  List<Note> _notes = [];
  final DBHelper _dbHelper = DBHelper();
  bool _isLoading = false;

  // Getters
  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;

  // Load all notes from database
  Future<void> loadNotes() async {
    _isLoading = true;
    notifyListeners();

    try {
      _notes = await _dbHelper.readAllNotes();
    } catch (e) {
      debugPrint('Error loading notes: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add a new note
  Future<void> addNote(String title, String content) async {
    final now = DateTime.now();
    final note = Note(
      title: title.trim(),
      content: content.trim(),
      createdAt: now,
      updatedAt: now,
    );

    try {
      final newNote = await _dbHelper.createNote(note);
      _notes.insert(0, newNote);
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding note: $e');
      rethrow;
    }
  }

  // Update an existing note
  Future<void> updateNote(int id, String title, String content) async {
    final noteIndex = _notes.indexWhere((note) => note.id == id);
    if (noteIndex == -1) return;

    final existingNote = _notes[noteIndex];
    final updatedNote = existingNote.copyWith(
      title: title.trim(),
      content: content.trim(),
      updatedAt: DateTime.now(),
    );

    try {
      await _dbHelper.updateNote(updatedNote);
      _notes[noteIndex] = updatedNote;
      // Move updated note to top
      _notes.removeAt(noteIndex);
      _notes.insert(0, updatedNote);
      notifyListeners();
    } catch (e) {
      debugPrint('Error updating note: $e');
      rethrow;
    }
  }

  // Delete a note
  Future<void> deleteNote(int id) async {
    try {
      await _dbHelper.deleteNote(id);
      _notes.removeWhere((note) => note.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting note: $e');
      rethrow;
    }
  }

  // Get a specific note by id
  Note? getNoteById(int id) {
    try {
      return _notes.firstWhere((note) => note.id == id);
    } catch (e) {
      return null;
    }
  }

  // Search notes by title or content
  List<Note> searchNotes(String query) {
    if (query.isEmpty) return _notes;
    
    final lowercaseQuery = query.toLowerCase();
    return _notes.where((note) =>
        note.title.toLowerCase().contains(lowercaseQuery) ||
        note.content.toLowerCase().contains(lowercaseQuery)
    ).toList();
  }

  // Clear all notes (for testing purposes)
  Future<void> clearAllNotes() async {
    try {
      await _dbHelper.deleteAllNotes();
      _notes.clear();
      notifyListeners();
    } catch (e) {
      debugPrint('Error clearing notes: $e');
      rethrow;
    }
  }
}