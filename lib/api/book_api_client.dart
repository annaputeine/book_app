import 'package:dio/dio.dart';
import 'package:books_app/model/book/book_response.dart';
import '../model/favourites/favourite_response.dart';

class BookApiClient {
  final Dio _dio;

  BookApiClient(this._dio);

  static const _apiKeyBook = String.fromEnvironment("apiKeyBook");

  Future<BookResponse> searchBooks(String query) async {
    query = query
        .trim()
        .isEmpty ? "harry potter" : query;
    final response = await _dio.get('/volumes?q=$query&key=$_apiKeyBook ');
    return BookResponse.fromJson(response.data as Map<String, dynamic>);
  }

  Future<FavouriteResponse> getOneBook(String id) async {
    final response = await _dio.get(
      '/volumes/$id?&key=$_apiKeyBook ',
    );
    return FavouriteResponse.fromJson(response as Map<String, dynamic>);
  }

  Future<List<FavouriteResponse>> getTheseBooks(List<String> ids,) async {
    return Future.wait(
      ids.map((id) async {
        final response = await _dio.get(
          '/volumes/$id?&key=$_apiKeyBook',
        );
        return FavouriteResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
      }),
    );
  }
}


