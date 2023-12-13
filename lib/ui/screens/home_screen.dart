import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controller/book_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Get.find<GetStorage>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bíblia Sagrada'),
        centerTitle: true,
      ),
      body: Center(
        child: GetX<BookController>(
          initState: (state) {
            Get.find<BookController>().getBooks();
          },
          builder: (builder) {
            return ListView.builder(
              itemCount: builder.books.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(builder.books[index].name),
                  subtitle: Text(builder.books[index].author),
                  onLongPress: () {
                    Get.toNamed(
                      '/details',
                      arguments: builder.books[index],
                    );
                  },
                  onTap: () {
                    box.write('book', builder.books[index].toJson());
                    Get.toNamed(
                      '/chapters',
                      arguments: builder.books[index],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
