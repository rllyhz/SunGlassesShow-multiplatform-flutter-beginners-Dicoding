import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      backgroundColor: backgroundColor,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      primary: false,
      backgroundColor: backgroundColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back,
          color: secondaryColor,
        ),
      ),
    );
  }
}
