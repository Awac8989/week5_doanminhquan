import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import '../models/note.dart';
import 'web_storage_helper.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _database;

  // Singleton pattern - ensure only one database connection
  Future<Database> get database async {
    if (kIsWeb) {
      throw UnsupportedError('SQLite is not supported on web');
    }
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize database
  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'notes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create tables
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        createdAt INTEGER NOT NULL,
        updatedAt INTEGER NOT NULL
      )
    ''');
  }

  // CREATE - Insert a new note
  Future<Note> createNote(Note note) async {
    if (kIsWeb) {
      return await WebStorageHelper.createNote(note);
    }
    
    final db = await database;
    final id = await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    
    return note.copyWith(id: id);
  }

  // READ - Get all notes
  Future<List<Note>> readAllNotes() async {
    if (kIsWeb) {
      return await WebStorageHelper.readAllNotes();
    }
    
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'notes',
      orderBy: 'updatedAt DESC',
    );

    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }

  // READ - Get a specific note by id
  Future<Note?> readNote(int id) async {
    if (kIsWeb) {
      return await WebStorageHelper.readNote(id);
    }
    
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromMap(maps.first);
    }
    return null;
  }

  // UPDATE - Update an existing note
  Future<void> updateNote(Note note) async {
    if (kIsWeb) {
      return await WebStorageHelper.updateNote(note);
    }
    
    final db = await database;
    await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // DELETE - Delete a note
  Future<void> deleteNote(int id) async {
    if (kIsWeb) {
      return await WebStorageHelper.deleteNote(id);
    }
    
    final db = await database;
    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE ALL - Clear all notes (useful for testing)
  Future<void> deleteAllNotes() async {
    if (kIsWeb) {
      return await WebStorageHelper.deleteAllNotes();
    }
    
    final db = await database;
    await db.delete('notes');
  }

  // Close database connection
  Future<void> close() async {
    if (kIsWeb) return;
    final db = await database;
    db.close();
  }
}