import 'package:dio/dio.dart';
import 'package:books_app/model/book_response.dart';

class BookApiClient {
  final Dio _dio;

  BookApiClient(this._dio);

  Future<BookResponse> searchBooks(String query) async {
    query = query.trim().isEmpty ? "harry potter" : query;
    final response = await _dio.get('/volumes?q=$query&key=AIzaSyCTYF9mjqFoDJeaPXamIocs-dqvl7SHNds');
    return BookResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
