import 'package:flutter/material.dart';
import 'package:movieapp/description.dart';
import 'package:movieapp/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trendingMovies;

  const TrendingMovies({
    Key? key,
    required this.trendingMovies,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KText(
            text: 'Trending Movies',
            size: 24,
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trendingMovies.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: trendingMovies[index]['title'],
                          bannerurl: 'http://image.tmdb.org/t/p/w500' +
                              trendingMovies[index]['backdrop_path'],
                          posturl: 'http://image.tmdb.org/t/p/w500' +
                              trendingMovies[index]['poster_path'],
                          description: 'http://image.tmdb.org/t/p/w500' +
                              trendingMovies[index]['overview'],
                          vote: 'http://image.tmdb.org/t/p/w500' +
                              trendingMovies[index]['vote_average'].toString(),
                          launchon: 'http://image.tmdb.org/t/p/w500' +
                              trendingMovies[index]['release_date'],
                        ),
                      ),
                    );
                  },
                  child: trendingMovies[index]['title'] != null
                      ? Container(
                          width: 140,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'http://image.tmdb.org/t/p/w500' +
                                          trendingMovies[index]['poster_path'],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                child: KText(
                                    text: trendingMovies[index]['title'] != null
                                        ? trendingMovies[index]['title']
                                        : 'Loading'),
                              )
                            ],
                          ),
                        )
                      : Container(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
