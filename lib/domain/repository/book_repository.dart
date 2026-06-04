import '../model/book.dart';

abstract interface class BookRepository {
  Future<List<Book>> getBooks(String query);

  Future<Book> getOneBook(String id);

  Future<List<Book>> getFavouriteBooks();

  Future<void> addFavourite(String actualId);

  Future<void> removeFavourite(String actualId);

  Future<bool> checkFavourite(String actualId);

  Future<Map<String, String>> _getValues();

  Future<void> _setValues(Map<String, String> favourites);

}