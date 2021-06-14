import 'package:flutter/material.dart';
import 'package:sunglasses_show/model/movie.dart';
import 'package:sunglasses_show/model/tv_shows.dart';
import '../../../constants.dart';
import 'item_category_list.dart';

class Body extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: paddingMd),
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
        return buildCardItem(radiusSize, movie.posterUrl, () {
          print('you clicked: ' + movie.title);
        });
      }).toList();

  List<Widget> _generateTVShowCardList(BuildContext ctx, double radiusSize) =>
      tvShowList.map((tvShow) {
        return buildCardItem(radiusSize, tvShow.posterUrl, () {
          print('you clicked: ' + tvShow.title);
        });
      }).toList();

  InkWell buildCardItem(
          double radiusSize, String posterUrl, GestureTapCallback onTap) =>
      InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSize),
          ),
          elevation: 2,
          shadowColor: Colors.black26,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radiusSize),
            child: buildImagePreview(posterUrl),
          ),
        ),
      );

  Image buildImagePreview(String posterUrl) => Image.asset(
        posterUrl,
        fit: BoxFit.fill,
      );
}
