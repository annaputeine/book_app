import 'dart:async';

import 'package:flutter/material.dart';
import 'package:books_app/page/book_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/book.dart';
import '../repository/book_repository.dart';
import '../widget/book_list_item.dart';

class BooksSearchPage extends StatefulWidget {
  const BooksSearchPage({super.key});

  @override
  State<BooksSearchPage> createState() => _BooksSearchPageState();
}

class _BooksSearchPageState extends State<BooksSearchPage> {
  late final BookRepository _bookRepository;

  final _searchController = TextEditingController();

  Timer? _debouncer;
  Future<List<Book>>? _booksFuture;

  @override
  void initState() {
    super.initState();
    _bookRepository = context.read<BookRepository>();
    _booksFuture = _bookRepository.getBooks("");
    _searchController.addListener(_debounceSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebddc0),
      body: Padding(
        padding: .symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(
              height: 8,
            ),
            SearchBar(
              controller: _searchController,
              hintText: "Start book search...",
              onSubmitted: (query) {
                _debouncer?.cancel();
                _performSearch(query);
              },
              leading: const Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Icons.search),
                ],
              ),
              elevation: const WidgetStatePropertyAll(0.0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              backgroundColor: const WidgetStatePropertyAll(
                Color(0xFFebddc0),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Books Search',
              style: TextStyle(
                color: Colors.grey[900],
                fontWeight: .w600,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: FutureBuilder<List<Book>>(
                future: _booksFuture,
                builder: (context, snapshot) {
                  print('state=${snapshot.connectionState}');
                  print('hasData=${snapshot.hasData}');
                  print('hasError=${snapshot.hasError}');
                  print('data=${snapshot.data}');
                  print('error=${snapshot.error}');
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final bookList = snapshot.data ?? [];
                  return bookList.isEmpty
                      ? const Center(child: Text('No books found.'))
                      : ListView.builder(
                          itemCount: bookList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => _showBookDetail(context: context, book: bookList[index]),
                              child: BookListItem(book: bookList[index]),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer?.cancel();
    super.dispose();
  }

  void _debounceSearch() {
    _debouncer?.cancel();

    _debouncer = Timer(
      const Duration(seconds: 1),
      () => _performSearch(_searchController.text),
    );
  }

  void _performSearch(String query) {
    setState(() {
      _booksFuture = _bookRepository.getBooks(query);
    });
  }

  void _showBookDetail({
    required BuildContext context,
    required Book book,
  }) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BookDetailPage(book: book),
    ),
  );
}
