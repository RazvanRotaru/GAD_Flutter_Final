import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_db/container/error_container.dart';
import 'package:movie_db/container/selected_movie_container.dart';
import 'package:movie_db/models/index.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorContainer(
      builder: (BuildContext context, String? errorMessage) {
        if (errorMessage != null) {
          return ErrorWidget(errorMessage);
        }

        return SelectedMovieContainer(
          builder: (BuildContext context, Movie movie) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Movie Details'),
              ),
              body: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.network(movie.mediumCoverImage),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            movie.title,
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text(
                            '${movie.rating}/10',
                            style: const TextStyle(color: Colors.yellow),
                          ),
                          Text(movie.genres.join('/')),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(movie.synopsis),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
