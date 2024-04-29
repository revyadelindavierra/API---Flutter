import 'package:bab_4/models/movie.dart';
import 'package:bab_4/pages/MovieDetail.dart';
import 'package:bab_4/services/http_service.dart';
import 'package:flutter/material.dart';

class Movielist extends StatefulWidget {
  const Movielist({Key? key}) : super(key: key);

  @override
  State<Movielist> createState() => _MovielistState();
}

class _MovielistState extends State<Movielist> {
  late Future<List<Movie>> _moviesFuture;
  late HttpService _service;

  @override
  void initState() {
    super.initState();
    _service = HttpService();
    _moviesFuture = _service.getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Popular Movies',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(137, 72, 57, 57),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: Color(0xFF232227),
      body: FutureBuilder<List<Movie>>(
          future: _moviesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final List<Movie> movies = snapshot.data!;
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, position) {
                  final movie = movies[position];
                  return Card(
                    elevation: 2.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(movie.posterpath!),
                      ),
                      title: Text('${movie.title}'),
                      subtitle: Text('Rating: ${movie.voteaverage ?? 0}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetail(movie),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text('No data available'));
            }
          }),
    );
  }
}
