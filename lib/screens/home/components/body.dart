import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'item_category_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingMd, vertical: paddingSm),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ItemCategoryList(),
          ),
          Expanded(
            flex: 6,
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints contraints) {
              if (contraints.maxWidth < 600) {
                return GridView.count(
                  crossAxisCount: 2,
                  children: _generateList(),
                );
              } else if (contraints.maxWidth < 900) {
                return GridView.count(
                  crossAxisCount: 3,
                  children: _generateList(),
                );
              } else {
                return GridView.count(
                  crossAxisCount: 4,
                  children: _generateList(),
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  List<Widget> _generateList() {
    return List<Widget>.generate(20, (index) {
      return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(4.0),
        ),
        height: 200,
      );
    });
  }
}
