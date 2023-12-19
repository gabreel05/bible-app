import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/repository/book_repository.dart';
import '../../data/repository/verse_repository.dart';

class VersesScreen extends StatelessWidget {
  const VersesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Get.find<GetStorage>();

    final book = Book.fromJson(box.read('book'));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(
          "${book.name} - Capítulo ${box.read('book_chapter')}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Corben',
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: VerseRepository().getChapterVerses(
          'ra',
          book.abbrev['pt'] ?? 'gn',
          box.read('book_chapter'),
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data[index].number.toString()),
                  subtitle: Text(snapshot.data[index].text),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // body: GetX<VerseController>(
      //   initState: (state) {
      //     Get.find<VerseController>().getVerses('ra', 'gn', 1);
      //   },
      //   builder: (builder) {
      //     return ListView.builder(
      //       itemCount: builder.verses.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         return ListTile(
      //           title: Text(builder.verses[index].text),
      //           subtitle: Text(builder.verses[index].number.toString()),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
