import 'package:favorite_movies/widgets/movieSliderTitle_widget.dart';
import 'package:flutter/material.dart';

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({super.key, required this.popular});

  final List popular;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: MovieSliderTitle(
              text: 'Popular movies',
              color: Colors.black87,
              size: 24,
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 280,
            child: ListView.builder(
              itemCount: popular.length,
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
                                    'http://image.tmdb.org/t/p/w500'+popular[index]['poster_path']
                                ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              popular[index]['title']!=null?
                              popular[index]['title']:'Loading',
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
