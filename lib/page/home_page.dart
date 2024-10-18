import 'package:flutter/material.dart';
import 'package:flutter_movie_manip/model/movie.dart';
import 'package:flutter_movie_manip/page/movie_details.dart';
import 'package:flutter_movie_manip/utils/http_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HttpHelper httpHelper = HttpHelper();
  List<Movie> movieList = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  void fetchMovies() async {
    List<Movie> movies = await httpHelper.getUpComing();
    setState(() {
      movieList = movies;
    });
  }
  void navigateToMovieDetails(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetail(movie: movie),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upcoming Movies')),
      body: Center(
        child: movieList.isEmpty
            ? const Text('No movies available')
            : ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                      movieList[index].posterPath,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(movieList[index].title),
                    subtitle: Text(movieList[index].releaseDate),
                    onTap: () => navigateToMovieDetails(movieList[index]),
                  );
                },
              ),
      ),
    );
  }
}
