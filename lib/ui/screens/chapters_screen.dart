import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controller/book_controller.dart';

class ChaptersScreen extends StatelessWidget {
  const ChaptersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Get.find<GetStorage>();

    return GetBuilder<BookController>(
      builder: (builder) {
        return Scaffold(
          appBar: AppBar(
            title: Text("${Get.arguments.name}"),
            centerTitle: true,
          ),
          body: GridView.count(
            crossAxisCount: 5,
            children: List.generate(
              Get.arguments.chapters,
              (index) {
                return InkWell(
                  onTap: () {
                    box.write('book_chapter', index + 1);

                    Get.toNamed(
                      '/verses',
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
