import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      return SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints.expand(),
            child: buildBody(context),
          ),
        ),
      );
    } else if (screenWidth < 900) {
      return SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.symmetric(horizontal: 80.0),
          child: buildBody(context),
        ),
      );
    } else {
      return Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(horizontal: 180.0),
        child: buildBody(context),
      );
    }
  }

  Widget buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      //Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: secondaryColor,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
