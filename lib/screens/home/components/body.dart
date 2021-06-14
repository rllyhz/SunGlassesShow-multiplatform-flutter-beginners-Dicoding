import 'package:flutter/material.dart';
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
            childAspectRatio: (2 / 3),
            children: _generateCardList(context, 12.0, buildMoviesPreview()),
          );
        } else if (constraints.maxWidth < 900) {
          return GridView.count(
            crossAxisCount: 3,
            childAspectRatio: (2 / 3),
            children: _generateCardList(context, 16.0, buildMoviesPreview()),
          );
        } else {
          return GridView.count(
            crossAxisCount: 4,
            childAspectRatio: (2 / 3),
            children: _generateCardList(context, 18.0, buildMoviesPreview()),
          );
        }
      });

  LayoutBuilder buildTVShowsLayout() => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (2 / 3),
            children: _generateCardList(context, 12.0, buildTVShowsPreview()),
          );
        } else if (constraints.maxWidth < 900) {
          return GridView.count(
            crossAxisCount: 3,
            childAspectRatio: (2 / 3),
            children: _generateCardList(context, 16.0, buildTVShowsPreview()),
          );
        } else {
          return GridView.count(
            crossAxisCount: 4,
            childAspectRatio: (2 / 3),
            children: _generateCardList(context, 18.0, buildTVShowsPreview()),
          );
        }
      });

  List<Widget> _generateCardList(
          BuildContext ctx, double radiusSize, Image imagePreview) =>
      List<Widget>.generate(20, (index) {
        return InkWell(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radiusSize),
            ),
            elevation: 2,
            shadowColor: Colors.black38,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radiusSize),
              child: imagePreview,
            ),
          ),
        );
      });

  Image buildMoviesPreview() => Image.asset(
        'assets/images/poster_overlord.jpg',
        fit: BoxFit.fill,
      );

  Image buildTVShowsPreview() => Image.asset(
        'assets/images/poster_arrow.jpg',
        fit: BoxFit.fill,
      );
}
