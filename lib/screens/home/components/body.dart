import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sunglasses_show/utils/data_utils.dart';
import 'package:sunglasses_show/utils/widget_utils.dart';
import '../../../constants.dart';
import 'item_category_list.dart';

class Body extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);
  final movieList = getMovies();
  final tvShowList = getTVShows();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: edgeInsetsMd),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ItemCategoryList(controller),
            ),
            Expanded(
              flex: 6,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: controller,
                onPageChanged: (selectedIndex) {
                  //
                },
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  buildMoviesLayout(),
                  buildTVShowsLayout(),
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

        return buildCardItem(containerTitleWidth, radiusSize, fontSize,
            movie.title, movie.rating, movie.posterUrl, () {
          print('you clicked: ' + movie.title);
        });
      }).toList();

  List<Widget> _generateTVShowCardList(BuildContext ctx, double radiusSize) =>
      tvShowList.map((tvShow) {
        var fontSize = getResponsiveDimension(ctx, 8.0);
        final containerTitleWidth =
            getResponsiveLongDimension(ctx, 100.0, 240.0);

        return buildCardItem(containerTitleWidth, radiusSize, fontSize,
            tvShow.title, tvShow.rating, tvShow.posterUrl, () {
          print('you clicked: ' + tvShow.title);
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
                          style: getResponsiveTextStyle(fontSize),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      RatingBar.builder(
                        initialRating: rating,
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
