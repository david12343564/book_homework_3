import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class BookDetails extends StatefulWidget {
  final dynamic book;
  const BookDetails({
    Key? key,
    this.book,
  }) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  bool descripcion = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: const Text('Detalles del libro'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.public)),
            IconButton(
                onPressed: () {
                  var titulo = widget.book["volumeInfo"]["title"];
                  var numPaginas =
                      "${widget.book["volumeInfo"]["pageCount"] ?? "-"}";
                  Share.share(
                      'Mira esta libro: \n $titulo\n Paginas: $numPaginas',
                      subject: "Compartir libro");
                },
                icon: Icon(Icons.share))
          ],
        ),
        body: SizedBox.expand(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Image.network(
                      "${widget.book["volumeInfo"]["imageLinks"] != null ? widget.book["volumeInfo"]["imageLinks"]["thumbnail"] : "https://storage.googleapis.com/colimdo-media/2017/10/not-available.jpg"}",
                      fit: BoxFit.fill,
                      height: 250,
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: Text(
                              "${widget.book["volumeInfo"]["title"]}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w200),
                            ),
                          ),
                        ),
                        Text(
                          "${widget.book["volumeInfo"]["publishedDate"] ?? "-"}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "Paginas: ${widget.book["volumeInfo"]["pageCount"] ?? "-"}"),
                        GestureDetector(
                          onTap: () {
                            descripcion = !descripcion;
                            setState(() {});
                          },
                          child: Text(
                            "${widget.book["volumeInfo"]["description"] ?? "-"}",
                            maxLines: descripcion ? 50 : 6,
                            overflow:
                                descripcion ? null : TextOverflow.ellipsis,
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
