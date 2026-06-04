import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/book/book.dart';
import '../repository/book_repository.dart';
import '../widget/book_list_item.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  late final BookRepository _bookRepository;

  @override
  void initState() {
    super.initState();
    _bookRepository = context.read();
  }

  @override
  Widget build(BuildContext context) {
    late Future<List<Book>>? _favouritesFuture = _bookRepository.getFavouriteBooks();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("your favourite books"),
      ),
      body: FutureBuilder<List<Book>>(
        future: _favouritesFuture,
        builder: (context, snapshot) {
          final connectionState = snapshot.connectionState;
          if (connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final favourites = snapshot.data ?? [];
          return favourites.isEmpty
              ? const Center(child: Text('You have no favourites.'))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final book = favourites[index];
                    return Dismissible(
                      key: ValueKey(book.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 24),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      onDismissed: (_) async {
                        await _bookRepository.removeFavourite(book.id);

                        setState(() {});
                      },
                      child: GestureDetector(
                        onTap: () {},
                        child: BookListItem(book: favourites[index]),
                      ),
                    );
                  },
                  itemCount: favourites.length,
                );
        },
      ),
    );
  }
}
