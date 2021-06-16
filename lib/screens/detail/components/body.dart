import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sunglasses_show/utils/widget_utils.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  final title;
  final synopsis;
  final posterUrl;
  final genres;
  final year;
  final duration;
  final rating;
  final releasedAt;
  final directorOrCreator;
  final language;
  final rate;
  final isContentForMovies;

  const Body(
      {Key? key,
      this.title,
      this.synopsis,
      this.posterUrl,
      this.genres,
      this.year,
      this.duration,
      this.rating,
      this.releasedAt,
      this.directorOrCreator,
      this.language,
      this.rate,
      this.isContentForMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(itemRadiusSm),
            child: Image.asset(
              posterUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Card(
            margin: EdgeInsets.only(left: edgeInsetsSm),
            child: Padding(
              padding: const EdgeInsets.all(edgeInsetsSm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title ($year)",
                    style: buildTextStyleBold(
                      getTitleTextSize(screenWidth),
                      Colors.black,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: rating - 3.6,
                    itemCount: 5,
                    itemSize: 18.0,
                    itemBuilder: (_, __) => Icon(
                      Icons.star,
                      color: secondaryColor,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(height: 12.0),
                  buildDescriptionInfo(screenWidth, 'Rate:', rate),
                  buildDescriptionInfo(screenWidth, 'Genres:', genres),
                  buildDescriptionInfo(
                    screenWidth,
                    'Released At:',
                    releasedAt,
                  ),
                  buildDescriptionInfo(screenWidth, 'Duration:', duration),
                  buildDescriptionInfo(screenWidth, 'Language:', language),
                  buildDescriptionInfo(
                    screenWidth,
                    "${isContentForMovies ? 'Director' : 'Creator'}:",
                    directorOrCreator,
                  ),
                  SizedBox(height: edgeInsetsMd),
                  Text(
                    "Synopsis",
                    style: buildTextStyleBold(
                      getDescriptionLabelTextSize(screenWidth),
                      Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    synopsis,
                    style: buildTextStyleLight(
                      getDescriptionInfoTextSize(screenWidth),
                      Colors.black,
                    ),
                  ),
                  SizedBox(height: edgeInsetsMd),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: secondaryColor,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("'Watch Now' not implemented yet!"),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: getIconSize(screenWidth),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Watch Now',
                              style: TextStyle(
                                fontSize:
                                    getDescriptionLabelTextSize(screenWidth),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildDescriptionInfo(double screenWidth, String label, String info) {
    return Row(
      children: <Widget>[
        Text(
          label,
          style: buildTextStyleMedium(
            getDescriptionLabelTextSize(screenWidth),
            Colors.black,
          ),
        ),
        SizedBox(width: 8.0),
        Text(
          info,
          style: buildTextStyleLight(
            getDescriptionInfoTextSize(screenWidth),
            Colors.black,
          ),
        ),
      ],
    );
  }

  double getTitleTextSize(double screenWidth) {
    if (screenWidth < 600) {
      return 16.0;
    } else if (screenWidth < 900) {
      return 18.0;
    } else {
      return 24.0;
    }
  }

  double getDescriptionLabelTextSize(double screenWidth) {
    if (screenWidth < 600) {
      return 12.0;
    } else if (screenWidth < 900) {
      return 14.0;
    } else {
      return 16.0;
    }
  }

  double getDescriptionInfoTextSize(double screenWidth) {
    if (screenWidth < 600) {
      return 10.0;
    } else if (screenWidth < 900) {
      return 12.0;
    } else {
      return 14.0;
    }
  }

  double getIconSize(double screenWidth) {
    if (screenWidth < 600) {
      return 16.0;
    } else if (screenWidth < 900) {
      return 24.0;
    } else {
      return 26.0;
    }
  }
}
