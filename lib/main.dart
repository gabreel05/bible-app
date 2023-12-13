import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import './controller/book_controller.dart';

import './ui/screens/home_screen.dart';
import './ui/screens/details_screen.dart';
import './ui/screens/chapters_screen.dart';
import './ui/screens/verses_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const BibleApp());
}

class BibleApp extends StatelessWidget {
  const BibleApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<BookController>(BookController());
    Get.put<GetStorage>(GetStorage());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: <GetPage>[
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/details', page: () => const DetailsScreen()),
        GetPage(name: '/chapters', page: () => const ChaptersScreen()),
        GetPage(name: '/verses', page: () => const VersesScreen()),
      ],
    );
  }
}
