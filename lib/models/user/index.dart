import 'package:sqflite/sqflite.dart';

class UserModel {
  static const table = 'user';

  final int id;
  final String email;
  final String? name;
  final int session;
  final int? height;
  final int? weight;


  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.session,
    required this.height,
    required this.weight,
  });

  static Future<List<UserModel>> getAll(Database database) async {
    final List<Map<String, dynamic>> userMaps = await database.query(table);
    return userMaps.map((userMap) => UserModel(
      id: userMap['id'],
      email: userMap['email'],
      name: userMap['name'],
      session: userMap['session'],
      height: userMap['height'],
      weight: userMap['weight'],
    )).toList();
  }

  static Future<UserModel?> getActiveSession(Database database) async {
    final List<Map<String, dynamic>> userMaps = await database.query(
      table,
      where: 'session = ?',
      whereArgs: [1],
      limit: 1
    );

    if (userMaps.isEmpty) {
      return null;
    }

    final Map<String, dynamic> userMap = userMaps[0];
    return UserModel(
        id: userMap['id'],
        email: userMap['email'],
        name: userMap['name'],
        session: userMap['session'],
        height: userMap['height'],
        weight: userMap['weight']
    );
  }
}