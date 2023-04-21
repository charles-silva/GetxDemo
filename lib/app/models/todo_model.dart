// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todo {
  final String description;
  final bool status;

  Todo(
    this.description,
    this.status,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'status': status,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      map['description'] as String,
      map['status'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);
}
