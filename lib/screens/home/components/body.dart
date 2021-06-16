import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sunglasses_show/screens/detail/detail_screen.dart';
import 'package:sunglasses_show/utils/data_utils.dart';
import 'package:sunglasses_show/utils/widget_utils.dart';
import '../../../constants.dart';
import 'item_category_list.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController controller = PageController(initialPage: 0);
  var movieList = getMovies();
  var tvShowList = getTVShows();
  int seletedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ItemCategoryList(seletedTabIndex, (index) {
                setState(() {
                  seletedTabIndex = index;
                });

                controller.animateToPage(
                  index,
                  duration: Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                );
              }),
            ),
            Expanded(
              flex: 7,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                onPageChanged: (selectedIndex) {
                  setState(() {
                    seletedTabIndex = selectedIndex;
                  });
                },
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: edgeInsetsSm),
                    child: buildMoviesLayout(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: edgeInsetsSm),
                    child: buildTVShowsLayout(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  LayoutBuilder buildMoviesLayout() => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: itemCardRatio,
            children: _generateMovieCardList(context, itemRadiusSm),
          );
        } else if (constraints.maxWidth < 900) {
          return GridView.count(
            crossAxisCount: 3,
            childAspectRatio: itemCardRatio,
            children: _generateMovieCardList(context, itemRadiusMd),
          );
        } else {
          return GridView.count(
            crossAxisCount: 4,
            childAspectRatio: itemCardRatio,
            children: _generateMovieCardList(context, itemRadiusXl),
          );
        }
      });

  LayoutBuilder buildTVShowsLayout() => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: itemCardRatio,
            children: _generateTVShowCardList(context, itemRadiusSm),
          );
        } else if (constraints.maxWidth < 900) {
          return GridView.count(
            crossAxisCount: 3,
            childAspectRatio: itemCardRatio,
            children: _generateTVShowCardList(context, itemRadiusMd),
          );
        } else {
          return GridView.count(
            crossAxisCount: 4,
            childAspectRatio: itemCardRatio,
            children: _generateTVShowCardList(context, itemRadiusXl),
          );
        }
      });

  List<Widget> _generateMovieCardList(BuildContext ctx, double radiusSize) =>
      movieList.map((movie) {
        var fontSize = getResponsiveDimension(ctx, 8.0);
        final containerTitleWidth =
            getResponsiveLongDimension(ctx, 100.0, 240.0);

        return buildCardItem(
            containerTitleWidth,
            radiusSize,
            fontSize,
            "${movie.title} (${movie.year})",
            movie.rating,
            movie.posterUrl, () {
          Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (ctx) => DetailScreen(
                isContentForMovies: true,
                movie: movie,
              ),
            ),
          );
        });
      }).toList();

  List<Widget> _generateTVShowCardList(BuildContext ctx, double radiusSize) =>
      tvShowList.map((tvShow) {
        var fontSize = getResponsiveDimension(ctx, 8.0);
        final containerTitleWidth =
            getResponsiveLongDimension(ctx, 100.0, 240.0);

        return buildCardItem(
            containerTitleWidth,
            radiusSize,
            fontSize,
            "${tvShow.title} (${tvShow.year})",
            tvShow.rating,
            tvShow.posterUrl, () {
          Navigator.push(
            ctx,
            MaterialPageRoute(
              builder: (ctx) => DetailScreen(
                isContentForMovies: false,
                tvShow: tvShow,
              ),
            ),
          );
        });
      }).toList();

  InkWell buildCardItem(
          double containerTitleWidth,
          double radiusSize,
          double fontSize,
          String title,
          double rating,
          String posterUrl,
          GestureTapCallback onTap) =>
      InkWell(
        onTap: onTap,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSize),
          ),
          elevation: 2,
          shadowColor: Colors.black26,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned.fill(
                child: buildImagePreview(posterUrl),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radiusSize),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.transparent,
                        Colors.black,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: edgeInsetsSm,
                left: edgeInsetsSm,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: containerTitleWidth,
                        child: Text(
                          title,
                          style: buildTextStyleNormal(fontSize, Colors.white),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      RatingBar.builder(
                        initialRating: rating - 3.6,
                        itemCount: 5,
                        allowHalfRating: true,
                        minRating: 1,
                        itemSize: 16.0,
                        itemBuilder: (ctx, _) => Icon(
                          Icons.star,
                          color: secondaryColor,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Image buildImagePreview(String posterUrl) => Image.asset(
        posterUrl,
        fit: BoxFit.fill,
      );
}
