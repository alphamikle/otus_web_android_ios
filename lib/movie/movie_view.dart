import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_android_ios/movie/logic/movie_state.dart';
import 'package:web_android_ios/movie/model/movie.dart';
import 'package:web_android_ios/movie/movie_item.dart';

class MovieView extends StatefulWidget {
  const MovieView({
    Key? key,
  }) : super(key: key);

  @override
  _MovieViewState createState() {
    return _MovieViewState();
  }
}

class _MovieViewState extends State<MovieView> {
  Widget _movieBuilder(BuildContext context, int index) {
    final Movie movie = context.read<MovieState>().moviesData.results[index];
    return MovieItem(movie: movie);
  }

  @override
  Widget build(BuildContext context) {
    late int crossAxisCount;
    final double width = MediaQuery.of(context).size.width;
    if (width <= 450) {
      crossAxisCount = 1;
    } else if (width <= 680) {
      crossAxisCount = 2;
    } else if (width <= 900) {
      crossAxisCount = 3;
    } else if (width <= 1300) {
      crossAxisCount = 4;
    } else if (width <= 1600) {
      crossAxisCount = 6;
    } else {
      crossAxisCount = 8;
    }

    print('Current width -> $width');

    return Consumer<MovieState>(
      builder: (BuildContext context, MovieState state, Widget? child) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: _movieBuilder,
            itemCount: state.moviesCount,
          ),
        );
      },
    );
  }
}
