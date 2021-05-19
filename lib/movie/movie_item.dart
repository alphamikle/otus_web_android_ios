import 'package:flutter/material.dart';
import 'package:web_android_ios/movie/model/movie.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    required this.movie,
    Key? key,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Color cardColor = Theme.of(context).colorScheme.secondaryVariant;
    final Color textColor = Theme.of(context).colorScheme.onSecondary;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie.imageUrl,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                movie.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: textColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Text(
                movie.overview,
                style: TextStyle(color: textColor),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                movie.rating.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
