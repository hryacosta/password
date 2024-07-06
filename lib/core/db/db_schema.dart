const String tablePassword = 'password';

const String dbSchema = '''
      CREATE TABLE $tablePassword (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        uuid TEXT NOT NULL UNIQUE,
        username TEXT NOT NULL,
        password TEXT NOT NULL,
        title TEXT
        updated_at DATETIME NOT NULL,
      )
    ''';
