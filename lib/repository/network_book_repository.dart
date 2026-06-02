import 'package:books_app/model/book.dart';
import 'package:books_app/repository/book_repository.dart';
import '../api/book_api_client.dart';

class NetworkBookRepository implements BookRepository {
  final BookApiClient _bookApiClient;

  NetworkBookRepository(this._bookApiClient);

  @override
  Future<List<Book>> getBooks(String query) async {

    final bookResponse = await _bookApiClient.searchBooks(query);

    return bookResponse.items.map((item) => item.toBook()).toList();
  }
}
