const String tablePassword = 'password';

const String dbSchema = '''
      CREATE TABLE $tablePassword (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        uuid TEXT UNIQUE,
        username TEXT NOT NULL,
        password TEXT NOT NULL,
        title TEXT NOT NULL,
        updated_at DATETIME
      )
    ''';
