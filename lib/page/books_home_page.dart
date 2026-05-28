import 'package:flutter/material.dart';
import 'package:books_app/model/books.dart';
import 'package:books_app/page/book_detail_page.dart';

import '../model/book.dart';
import '../widget/book_list_item.dart';

class BooksHomePage extends StatelessWidget {
  const BooksHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFebddc0),
        body: Column(
          children: [
            Padding(
              padding: .all(15),
              child: SearchBar(
                hintText: "Start book search...",
                elevation: WidgetStatePropertyAll(0.0),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Color(0xFFebddc0),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  //return Container();
                  return GestureDetector(
                    onTap: () => _showBookDetail(context: context, book: books[index]),
                    child: BookListItem(book: books[index]),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFF8c6c0b),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.favorite,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
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
