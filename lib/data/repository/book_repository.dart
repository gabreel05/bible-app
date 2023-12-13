import 'package:dio/dio.dart';

class BibleRepository {
  final Dio _dio = Dio();

  Future<List<Book>> getBibleBooks() async {
    final response = await _dio.get(
      'https://www.abibliadigital.com.br/api/books',
    );

    final List<Book> books = (response.data as List)
        .map((dynamic book) => Book.fromJson(book as Map<String, dynamic>))
        .toList();

    return books;
  }
}

class Book {
  Book({
    required this.abbrev,
    required this.author,
    required this.chapters,
    required this.group,
    required this.testament,
    required this.name,
  });

  final Map<String, String> abbrev;
  final String author;
  final int chapters;
  final String group;
  final String testament;
  final String name;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      abbrev: Map<String, String>.from(json['abbrev']),
      author: json['author'] as String,
      chapters: json['chapters'] as int,
      group: json['group'] as String,
      testament: json['testament'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'abbrev': abbrev,
      'author': author,
      'chapters': chapters,
      'group': group,
      'testament': testament,
      'name': name,
    };
  }
}
