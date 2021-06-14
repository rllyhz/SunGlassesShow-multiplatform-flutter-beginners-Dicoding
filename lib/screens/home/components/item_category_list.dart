import 'package:flutter/material.dart';
import '../../../constants.dart';

class ItemCategoryList extends StatefulWidget {
  @override
  _ItemCategoryListState createState() => _ItemCategoryListState();
}

class _ItemCategoryListState extends State<ItemCategoryList> {
  int _selectedCategoryIndex = 0;
  List<String> _itemCategories = ["Movies", "Tv Shows"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _itemCategories.length,
        itemBuilder: (context, index) => buildItemCatogories(context, index),
      ),
    );
  }

  Padding buildItemCatogories(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: paddingMd, vertical: paddingSm),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedCategoryIndex = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _itemCategories[index],
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: index == _selectedCategoryIndex
                      ? textColorActive
                      : textColorInActive),
            ),
            Container(
              margin: EdgeInsets.only(top: paddingSm - 3.0),
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: index == _selectedCategoryIndex
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
