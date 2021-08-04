import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:movie_db/actions/index.dart';
import 'package:movie_db/container/error_container.dart';
import 'package:movie_db/container/loading_container.dart';
import 'package:movie_db/container/movies_container.dart';
import 'package:movie_db/models/index.dart';
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  final double elementHeight = 300;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    final bool isLoading = store.state.isLoading;
    final double dy = scrollController.position.maxScrollExtent - scrollController.offset;

    if (dy < 4 * elementHeight && !isLoading) {
      store.dispatch(const GetMoviesAction());
    }
  }

  void _refresh() {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    if (!store.state.isLoading) {
      store.dispatch(ReloadMoviesAction());
    }
  }

  void _selectMovie(int id) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    store.dispatch(SelectMovieAction(id: id));
    Navigator.pushNamed(context, '/movie_details');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Database'),
      ),
      floatingActionButton: LoadingContainer(
        builder: (BuildContext context, bool isLoading) {
          return FloatingActionButton(
            onPressed: _refresh,
            child: const Icon(Icons.refresh),
          );
        },
      ),
      body: MoviesContainer(
        builder: (BuildContext context, List<Movie> movies) {
          return LoadingContainer(
            builder: (BuildContext context, bool isLoading) {
              if (isLoading && movies.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ErrorContainer(
                builder: (BuildContext context, String? errMessage) {
                  if (errMessage != null) {
                    return ErrorWidget(errMessage);
                  }

                  return GridView.builder(
                    controller: scrollController,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.69,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Movie movie = movies[index];

                      return GestureDetector(
                        onTap: () => _selectMovie(movie.id),
                        child: SizedBox(
                            height: elementHeight,
                            child: GridTile(
                              child: Image.network(movie.mediumCoverImage),
                              footer: GridTileBar(
                                backgroundColor: Colors.black45,
                                title: Text(movie.title),
                              ),
                            )),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
