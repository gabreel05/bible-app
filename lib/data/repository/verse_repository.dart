import 'package:dio/dio.dart';

class VerseRepository {
  final Dio _dio = Dio();

  Future getChapterVerses(
    String version,
    String abbrev,
    int chapter,
  ) async {
    final response = await _dio.get(
      'https://www.abibliadigital.com.br/api/verses/$version/$abbrev/$chapter',
    );

    final List<Verse> verses = (response.data['verses'] as List)
        .map((dynamic verse) => Verse.fromJson(verse as Map<String, dynamic>))
        .toList();

    return verses;
  }
}

class Verse {
  Verse({
    required this.number,
    required this.text,
  });

  final int number;
  final String text;

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      number: json['number'] as int,
      text: json['text'] as String,
    );
  }
}

void main(List<String> args) {
  final repository = VerseRepository();
  repository.getChapterVerses('ra', 'gn', 1).then((value) => {
        for (var verse in value) {print("${verse.number} - ${verse.text}")}
      });
}
