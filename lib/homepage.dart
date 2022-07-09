import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/widgets/toprated.dart';
import 'package:movieapp/widgets/trending.dart';
import 'package:movieapp/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  final String apiKey = '91e15891697b6b7866a7448b30083782';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MWUxNTg5MTY5N2I2Yjc4NjZhNzQ0OGIzMDA4Mzc4MiIsInN1YiI6IjYxNmZhZThjODk0ZWQ2MDA4ZTNjZjQxMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EJuuqPRRYurtnzbw7yoJB5SKSrEVuW77nwckOowPkEM';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdnWithCustomLogs = TMDB(
      ApiKeys(
        apiKey,
        readAccessToken,
      ),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingResult = await tmdnWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdnWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdnWithCustomLogs.v3.tv.getPopular();

    print(tv);
    setState(
      () {
        trendingMovies = trendingResult['results'];
        topRatedMovies = topRatedResult['results'];
        tv = tvResult['results'];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: KText(
          text: "Flutter Movie App",
          color: null,
        ),
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRated(toprated: topRatedMovies),
          TrendingMovies(trendingMovies: trendingMovies),
        ],
      ),
    );
  }
}
