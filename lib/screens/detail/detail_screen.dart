import 'package:flutter/material.dart';
import 'package:sunglasses_show/model/movie.dart';
import 'package:sunglasses_show/model/tv_show.dart';
import 'package:sunglasses_show/utils/widget_utils.dart';

import '../../constants.dart';
import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  final Movie? movie;
  final TVShow? tvShow;
  final bool isContentForMovies;

  const DetailScreen(
      {Key? key, required this.isContentForMovies, this.movie, this.tvShow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final header = "Detail ${this.isContentForMovies ? 'Movie' : 'TV Show'}";
    final title = isContentForMovies ? movie!.title : tvShow!.title;
    final synopsis = isContentForMovies ? movie!.synopsis : tvShow!.synopsis;
    final posterUrl = isContentForMovies ? movie!.posterUrl : tvShow!.posterUrl;
    final genres = isContentForMovies ? movie!.genres : tvShow!.genres;
    final year = isContentForMovies ? movie!.year : tvShow!.year;
    final duration = isContentForMovies ? movie!.duration : tvShow!.duration;
    final rating = isContentForMovies ? movie!.rating : tvShow!.rating;
    final releasedAt =
        isContentForMovies ? movie!.releasedAt : tvShow!.releasedAt;
    final directorOrCreator =
        isContentForMovies ? movie!.director : tvShow!.creator;
    final language = isContentForMovies ? movie!.language : tvShow!.language;
    final rate = isContentForMovies ? movie!.rate : tvShow!.rate;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: secondaryColor,
            expandedHeight: getHeaderHeight(screenWidth),
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                header,
                style: buildTextStyleMedium(18.0, Colors.white),
              ),
              centerTitle: true,
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    posterUrl,
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: buildOverlayBackground(),
                  ),
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    width: screenWidth,
                    child: buildAppBar(context),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.only(top: 12.0),
                padding: EdgeInsets.symmetric(
                  horizontal: getPaddingBody(screenWidth),
                ),
                child: Body(
                  title: title,
                  synopsis: synopsis,
                  posterUrl: posterUrl,
                  genres: genres,
                  rating: rating,
                  rate: rate,
                  year: year,
                  duration: duration,
                  releasedAt: releasedAt,
                  language: language,
                  directorOrCreator: directorOrCreator,
                  isContentForMovies: isContentForMovies,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildOverlayBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: <Color>[
          Color(0xEE000000),
          Color(0x88000000),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      primary: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          color: Colors.white,
        ),
      ),
    );
  }

  double getHeaderHeight(double screenWidth) {
    if (screenWidth < 600) {
      return 240.0;
    } else if (screenWidth < 900) {
      return 220.0;
    } else {
      return 210.0;
    }
  }

  double getPaddingBody(double screenWidth) {
    if (screenWidth < 600) {
      return 8.0;
    } else if (screenWidth < 900) {
      return 80.0;
    } else {
      return 120.0;
    }
  }

  double getCardFlexSize(double screenWidth) {
    if (screenWidth < 600) {
      return 3;
    } else {
      return 2;
    }
  }
}
