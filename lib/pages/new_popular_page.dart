import 'package:flutter/material.dart';
import 'package:flutterinternal/pages/popular_movies_page.dart';
import 'package:flutterinternal/widgets/popular_movie_list_cubit.dart';

class NewPopularMovies extends StatefulWidget {
  const NewPopularMovies({super.key});

  @override
  State<NewPopularMovies> createState() => _NewPopularMoviesState();
}

class _NewPopularMoviesState extends State<NewPopularMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
        backgroundColor: Color(0xFF0EF6D3), // Set AppBar color
      ),
      body: const PopularMoviesPage(),
      backgroundColor: Color(0xFF58E8D2), // Set background color for the page
    );
  }
}
