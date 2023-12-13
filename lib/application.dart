import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<Controller>(Controller());

    return GetMaterialApp(
      initialRoute: '/',
      getPages: <GetPage>[
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/details', page: () => const DetailsScreen()),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text('Clicks: ${Get.find<Controller>().count.value}');
        }),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Click Me'),
          onPressed: () {
            Get.find<Controller>().increment();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () {
          Get.toNamed('/details');
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.find<Controller>();

    return Scaffold(
      body: Center(
        child: Text("Clicks: ${c.count}"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_before),
        onPressed: () {
          Get.toNamed('/');
        },
      ),
    );
  }
}

class Controller extends GetxController {
  var count = 0.obs;

  increment() => count++;
}
