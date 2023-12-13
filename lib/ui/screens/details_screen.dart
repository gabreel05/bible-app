import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/book_controller.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
        centerTitle: true,
      ),
      body: Center(
        child: GetBuilder<BookController>(
          builder: (builder) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "None: ${Get.arguments.name}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Autor: ${Get.arguments.author}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Testamento: ${Get.arguments.testament}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Grupo: ${Get.arguments.group}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "Capítulos: ${Get.arguments.chapters}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
