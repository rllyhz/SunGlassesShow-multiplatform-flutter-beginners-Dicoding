import 'package:flutter/material.dart';
import '../../../constants.dart';

class ItemCategoryList extends StatefulWidget {
  final PageController controller;

  ItemCategoryList(this.controller);

  @override
  _ItemCategoryListState createState() =>
      _ItemCategoryListState(controller: controller);
}

class _ItemCategoryListState extends State<ItemCategoryList> {
  final PageController controller;
  int _selectedCategoryIndex = 0;

  _ItemCategoryListState({required this.controller});

  void setSelectedCategoryIndex(int newIndex) {
    setState(() {
      _selectedCategoryIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCategories.length,
        itemBuilder: (context, index) => buildItemCatogories(context, index),
      ),
    );
  }

  Padding buildItemCatogories(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: edgeInsetsMd, vertical: edgeInsetsSm),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedCategoryIndex = index;
          });

          controller.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              itemCategories[index],
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: index == _selectedCategoryIndex
                      ? textColorActive
                      : textColorInActive),
            ),
            Container(
              margin: EdgeInsets.only(top: edgeInsetsSm - 3.0),
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
