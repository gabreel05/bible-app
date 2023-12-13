import 'package:get/get.dart';

import '../data/repository/book_repository.dart';

class BookController extends GetxController {
  final RxList<Book> _books = RxList<Book>(<Book>[]);
  List<Book> get books => _books.toList();

  @override
  void onInit() {
    super.onInit();

    getBooks();
  }

  Future<void> getBooks() async {
    _books.value = await BibleRepository().getBibleBooks();
  }
}
