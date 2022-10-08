import 'package:book_homework_3/bloc/books_bloc.dart';
import 'package:book_homework_3/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => BooksBloc(),
        child: home(),
      ),
    );
  }
}
