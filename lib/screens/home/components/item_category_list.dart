import 'package:flutter/material.dart';
import 'package:sunglasses_show/utils/widget_utils.dart';
import '../../../constants.dart';

class ItemCategoryList extends StatelessWidget {
  final int selectedTabIndex;
  final Function onTapItemCard;

  ItemCategoryList(this.selectedTabIndex, this.onTapItemCard);

  @override
  Widget build(BuildContext context) {
    final fontSize = getResponsiveDimension(context, 10.0);

    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: itemCategories.length,
        itemBuilder: (context, index) =>
            buildItemCatogories(context, index, fontSize),
      ),
    );
  }

  Padding buildItemCatogories(
      BuildContext context, int index, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: edgeInsetsMd, vertical: edgeInsetsSm),
      child: InkWell(
        onTap: () => onTapItemCard(index),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              itemCategories[index],
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontFamily: "Manrope",
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize,
                  color: index == selectedTabIndex
                      ? textColorActive
                      : textColorInActive),
            ),
            Container(
              margin: EdgeInsets.only(top: edgeInsetsSm - 3.0),
              height: 6,
              width: (fontSize * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: index == selectedTabIndex
                    ? secondaryColor
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
