import 'package:books_app/page/books_search_page.dart';
import 'package:flutter/material.dart';

class BooksMainPage extends StatelessWidget {
  const BooksMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFebddc0),
      body: SafeArea(
        bottom: false,
        child: BooksSearchPage(),
      ),

    );
  }
}
