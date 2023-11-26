import 'package:favorite_movies/widgets/popularMovies_widget.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'package:favorite_movies/widgets/nowPlayingMovies_widget.dart';
import 'package:favorite_movies/widgets/upcomingMovies_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List nowPlayingMovies = [];
  List popularMovies = [];
  List upcomingMovies = [];

  final String apiKey = 'ace96559b8fb0dd613fdfd48023afa84';
  final readaccesToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhY2U5NjU1OWI4ZmIwZGQ2MTNmZGZkNDgwMjNhZmE4NCIsInN1YiI6IjVmOWJmNWYzMjljNjI2MDAzNzU3MjQ4MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qXfNM2Xqp5d6aQ0jfssatlcWCKQeKcqlOGLcsrq_q-E';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies()async{
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map nowPlayingMoviesResults = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    Map popularMoviesResults = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map upComingMoviesResults = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    setState(() {
      nowPlayingMovies = nowPlayingMoviesResults['results'];
      popularMovies = popularMoviesResults['results'];
      upcomingMovies = upComingMoviesResults['results'];
    });
    // print(nowPlayingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text("Home",
            style:
              TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                  fontSize: 22
              ),
          ),
        ),
        body: ListView(
          children: [
            NowPlayingMoviesWidget(nowPlaying: nowPlayingMovies),
            PopularMoviesWidget(popular: popularMovies),
            UpcomingMoviesWidget(upcoming: upcomingMovies),
          ],
        )
    );
  }
}
