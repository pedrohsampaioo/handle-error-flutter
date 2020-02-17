import 'dart:convert';

import 'package:meta/meta.dart';

class Post {
  final int id;
  final String name;
  Post({
    @required this.id,
    @required this.name,
  });

  static Post fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Post(
      id: map['id'],
      name: map['name'],
    );
  }

  static Post fromJSON(String source) => fromMap(json.decode(source));


  String toString() => 'id: ${this.id}\nname: ${this.name}';
}
