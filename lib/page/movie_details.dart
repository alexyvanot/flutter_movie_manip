import 'package:flutter/material.dart';
import 'package:flutter_movie_manip/model/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  const MovieDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(movie.title),
      ), // AppBar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(movie.posterPath),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.overview,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ), // Column
      ), // SingleChildScrollView
    ); // Scaffold
  }
}