import 'package:flutter/material.dart';
import '../model/book.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebddc0),
      appBar: AppBar(
        title: Text('Book Details'),
        titleTextStyle: TextStyle(
          color: Colors.grey[900],
          fontWeight: .w600,
          fontSize: 20,
        ),
        centerTitle: false,
        backgroundColor: Color(0xFFebddc0),
      ),
      body: Padding(
        padding: .symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: .start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    book.coverImageUrl,
                    width: double.infinity,
                    height: 196,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  book.title,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: .w700,
                    fontSize: 24,
                  ),
                ),
                Text(
                  book.subtitle,
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: .w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  book.authors,
                  style: TextStyle(
                    color: Color(0xFF8c6c0b),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    _LinedTextBox(text: "Released", number: book.releaseYear),
                    SizedBox(
                      width: 12,
                    ),
                    _LinedTextBox(text: "Pages", number: book.pageCount.toString()),
                    SizedBox(
                      width: 12,
                    ),
                    _LinedTextBox(text: "Rating", number: book.averageRating.toString()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontWeight: .w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  book.description,
                  style: TextStyle(
                    color: Colors.grey[900],
                    //fontWeight: .w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.viewPaddingOf(context).bottom,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LinedTextBox extends StatelessWidget {
  final String number;
  final String text;

  const _LinedTextBox({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 112,
      ),

      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF8c6c0b),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: .symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        child: Column(
          children: [
            Text(text),
            number == 'null'
                ? Text(
                    "none",
                    style: TextStyle(
                      color: Color(0xFF8c6c0b),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                : Text(
                    number,
                    style: TextStyle(
                      color: Color(0xFF8c6c0b),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
