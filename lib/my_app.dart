import 'package:books_app/page/books_main_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Stack(
        children: [
          const BooksMainPage(),
          Positioned(
            bottom: 34,
            right: 16,
            child: FloatingActionButton(
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
        ],
      ),
    );
  }
}
