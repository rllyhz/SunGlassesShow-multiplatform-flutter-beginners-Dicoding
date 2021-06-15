import 'package:flutter/material.dart';
import 'package:sunglasses_show/model/movie.dart';
import 'package:sunglasses_show/model/tv_show.dart';
import '../../constants.dart';

class DetailScreen extends StatelessWidget {
  final Movie? movie;
  final TVShow? tvShow;
  final bool isContentForMovies;

  const DetailScreen(
      {Key? key, required this.isContentForMovies, this.movie, this.tvShow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = isContentForMovies ? movie!.title : tvShow!.title;
    final synopsis = isContentForMovies ? movie!.synopsis : tvShow!.synopsis;
    final genres = isContentForMovies ? movie!.genres : tvShow!.genres;
    final year = isContentForMovies ? movie!.year : tvShow!.year;
    final duration = isContentForMovies ? movie!.duration : tvShow!.duration;
    final releasedAt =
        isContentForMovies ? movie!.releasedAt : tvShow!.releasedAt;
    final directorOrCreator =
        isContentForMovies ? movie!.director : tvShow!.creator;
    final language = isContentForMovies ? movie!.language : tvShow!.language;
    final rate = isContentForMovies ? movie!.rate : tvShow!.rate;

    return Scaffold(
      body: SingleChildScrollView(
        child: Text("$title ($year)"),
      ),
      backgroundColor: backgroundColor,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      primary: false,
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back,
          color: secondaryColor,
        ),
      ),
    );
  }
}
