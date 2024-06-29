const String tablePassword = 'password';

const String dbSchema = '''
      CREATE TABLE $tablePassword (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL,
        title TEXT
        updated_at DATETIME NOT NULL,
      )
    ''';
