import 'package:get/get.dart';

import '../data/repository/verse_repository.dart';

class VerseController extends GetxController {
  final RxList<Verse> _verses = RxList<Verse>(<Verse>[]);
  List<Verse> get verses => _verses.toList();

  Future<void> getVerses(
    String version,
    String abbrev,
    int chapter,
  ) async {
    _verses.value =
        await VerseRepository().getChapterVerses(version, abbrev, chapter);
  }
}

void main(List<String> args) {
  final controller = VerseController();
  controller.getVerses('ra', 'gn', 1);
  print(controller.verses);
}
