import 'package:book_homework_3/bloc/books_bloc.dart';
import 'package:book_homework_3/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';

class home extends StatefulWidget {
  const home({
    Key? key,
  }) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Libreria Free to play'),
          backgroundColor: Colors.grey[800],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  label: Text("Ingresa titulo"),
                  labelStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                      onPressed: () async {
                        BlocProvider.of<BooksBloc>(context).add(
                            SearchingEvent(bookTitle: searchController.text));
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                ),
              ),
              SizedBox(),
              Expanded(
                child: BlocBuilder<BooksBloc, BooksState>(
                    builder: (context, state) {
                  if (state is LoadingState) {
                    return ListView.builder(
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return const VideoShimmer();
                      },
                    );
                  } else if (state is ResultFoundState) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 5,
                          crossAxisCount: 2,
                        ),
                        itemCount: state.books.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Book(book: state.books[index]);
                        });
                  } else if (state is NoResultsSate) {
                    return const Center(
                        child: Text(
                            "No se encontraron libros que coincidan con el titulo"));
                  } else if (state is LoadingErrorState) {
                    return const Center(
                        child:
                            Text("Error al buscar el libro, intente de nuevo"));
                  } else {
                    return const Center(
                      child: Text("Ingrese palabra para buscar libro"),
                    );
                  }
                }),
              )
            ],
          ),
        ));
  }
}
