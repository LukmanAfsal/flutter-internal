import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutterinternal/cubits/favourite_movie_cubit.dart';
import 'package:flutterinternal/cubits/popular_movie_cubit.dart';
import 'package:flutterinternal/cubits/top_rated_movie_cubit.dart';
import 'package:flutterinternal/models/popular_movie_hive.dart';
import 'package:flutterinternal/models/top_rated_movie_response.dart';
import 'package:flutterinternal/pages/login_page.dart';
import 'package:flutterinternal/pages/movie_grid_screen.dart';
import 'package:flutterinternal/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PopularMovieAdapter()); // Registering Adapter
  await Hive.openBox<PopularMovieHive>('popular-movies');
  runApp(const flutterinternalApp());
}

class flutterinternalApp extends StatelessWidget {
  const flutterinternalApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => PopularMovieCubit()),
        BlocProvider(create: (BuildContext context) => FavouriteMovieCubit()),
        BlocProvider(create: (context) => TopRatedMovieCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MovieGridscreen(),
      ),
    );
  }
}
