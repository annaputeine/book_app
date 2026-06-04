import 'package:books_app/domain/model/book.dart';
import 'package:books_app/domain/repository/book_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/book_api_client.dart';
import 'dart:convert';
import '../api/favourite_api_client.dart';

class NetworkBookRepository implements BookRepository {
  final BookApiClient _bookApiClient;
  final FavouriteApiClient _favouriteApiClient;

  NetworkBookRepository({required this._bookApiClient, required this._favouriteApiClient});

  @override
  Future<List<Book>> getBooks(String query) async {
    final bookResponse = await _bookApiClient.searchBooks(query);

    return bookResponse.items.map((item) => item.toBook()).toList();
  }

  @override
  Future<Book> getOneBook(String id) async {
    final response = await _bookApiClient.getOneBook(id);
    return response.toBook();
  }

  @override
  Future<List<Book>> getFavouriteBooks() async {
    final favourites = await _getValues();
    final response = await _bookApiClient.getTheseBooks(
      favourites.keys.toList(),
    );
    return response.map((item) => item.toBook()).toList();
  }

  @override
  Future<void> addFavourite(String actualId) async {
    final favourites = await _getValues();

    final faveId = await _favouriteApiClient.addToFavourite(actualId);

    favourites[actualId] = faveId;

    await _setValues(favourites);
  }

  @override
  Future<void> removeFavourite(String actualId) async {
    final favourites = await _getValues();

    final faveId = favourites[actualId];

    if (faveId == null) {
      return;
    }

    await _favouriteApiClient.removeFromFavourite(
      faveId,
    );

    favourites.remove(actualId);

    await _setValues(favourites);
  }

  @override
  Future<bool> checkFavourite(
    String actualId,
  ) async {
    final favourites = await _getValues();

    return favourites.containsKey(actualId);
  }

  Future<Map<String, String>> _getValues() async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString('fave_ids');

    if (jsonString == null) {
      return {};
    }

    return Map<String, String>.from(
      jsonDecode(jsonString),
    );
  }

  Future<void> _setValues(
    Map<String, String> favourites,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      'fave_ids',
      jsonEncode(favourites),
    );
  }
}
