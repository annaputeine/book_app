import '../model/book.dart';

abstract interface class BookRepository {
  Future<List<Book>> getBooks(String query);
}