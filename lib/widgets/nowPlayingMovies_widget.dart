import 'package:favorite_movies/widgets/movieSliderTitle_widget.dart';
import 'package:flutter/material.dart';

class NowPlayingMoviesWidget extends StatelessWidget {
  const NowPlayingMoviesWidget({super.key, required this.nowPlaying});

  final List nowPlaying;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: MovieSliderTitle(
              text: 'Now showing',
              color: Colors.black87,
              size: 24,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 280,
            child: ListView.builder(
              itemCount: nowPlaying.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'http://image.tmdb.org/t/p/w500'+nowPlaying[index]['poster_path']
                                ), fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              nowPlaying[index]['title']!=null?
                              nowPlaying[index]['title']:'Loading',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
