import 'package:book_homework_3/book_details.dart';
import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  final dynamic book;
  const Book({
    Key? key,
    this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          MaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BookDetails(
                          book: book,
                        )));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.network(
                  "${book["volumeInfo"]["imageLinks"] != null ? book["volumeInfo"]["imageLinks"]["thumbnail"] : "https://storage.googleapis.com/colimdo-media/2017/10/not-available.jpg"}",
                  width: 150,
                  height: 150,
                ),
              )),
          SizedBox(),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              "${book["volumeInfo"]["title"] ?? "Titulo no disponbile"}",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
