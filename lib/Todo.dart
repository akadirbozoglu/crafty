import 'database.dart';

class RepositoryServiceTodo {
  static Future<List<User>> getAllTodos() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}''';
    final data = await db.rawQuery(sql);
    List<User> todos = List();

    for (final node in data) {
      final todo = User.fromJson(node);
      todos.add(todo);
    }
    return todos;
  }

  static Future<User> getTodo(int id) async {
    final sql = '''SELECT * FROM ${DatabaseCreator.todoTable}
    WHERE ${DatabaseCreator.id} = $id''';
    final data = await db.rawQuery(sql);

    final todo = User.fromJson(data[0]);
    return todo;
  }

  static Future<void> addTodo(User user) async {
    final sql = '''INSERT INTO ${DatabaseCreator.todoTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.name},
      ${DatabaseCreator.surname},
      ${DatabaseCreator.email},
      ${DatabaseCreator.password},
      ${DatabaseCreator.city},
      ${DatabaseCreator.ilce},
      ${DatabaseCreator.address},
      ${DatabaseCreator.attribute}
    )
    VALUES
    (
      ${user.id},
      "${user.name}",
      "${user.surname}",
      "${user.email}",
      "${user.password}",
      "${user.city}",
      "${user.ilce}",
      "${user.address}",
      "${user.attribute}"
    )''';

    try {
      final result = await db.rawInsert(sql);
      DatabaseCreator.databaseLog('Add todo', sql, null, result);
    } catch(error){
      print(error);
    }
  }

  static Future<void> deleteTodo(int id) async {
    final sql = '''DELETE FROM ${DatabaseCreator.todoTable}
    WHERE ${DatabaseCreator.id} == ${id}
    ''';

    final result = await db.rawUpdate(sql);

    DatabaseCreator.databaseLog('Delete todo', sql, null, result);
  }

  static Future<void> updateTodo(User user) async {
    final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${DatabaseCreator.email} = "${user.email}",
      ${DatabaseCreator.password} = "${user.password}",
      ${DatabaseCreator.city} = "${user.city}",
      ${DatabaseCreator.ilce} = "${user.ilce}",
      ${DatabaseCreator.address} = "${user.address}"
    WHERE ${DatabaseCreator.id} == ${user.id}
    ''';

    final result = await db.rawUpdate(sql);

    DatabaseCreator.databaseLog('Update todo', sql, null, result);
  }

  static Future<void> updateRaw(String element, String value, int id) async {
    final sql = '''UPDATE ${DatabaseCreator.todoTable}
    SET ${element} = "${value}"
    WHERE ${DatabaseCreator.id} == ${id}
    ''';

    final result = await db.rawUpdate(sql);

    DatabaseCreator.databaseLog('Update todo', sql, null, result);
  }

  static Future<int> todosCount() async {
    try{
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.todoTable}''');

    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }catch (error){
      return 0;
    }
  }
}