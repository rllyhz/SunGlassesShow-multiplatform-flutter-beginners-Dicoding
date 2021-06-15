import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sunglasses_show/utils/widget_utils.dart';
import '../../constants.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  final _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: buildAppBar(context),
      drawer: buildDrawerMenu(context),
      body: Body(),
      backgroundColor: backgroundColor,
    );
  }

  Drawer buildDrawerMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: secondaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appName,
                  style: buildTextStyleBold(18.0, Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  emailDescription,
                  style: buildTextStyleLight(
                    12.0,
                    Color.fromARGB(0x88, 0xFF, 0xFF, 0xFF),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              drawerMenuItems[0],
              style: buildTextStyleNormal(12.0, Colors.black87),
            ),
            onTap: () {
              _showSnackbar(
                  context, "'${drawerMenuItems[0]}' not implemented yet!");
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              drawerMenuItems[1],
              style: buildTextStyleNormal(12.0, Colors.black87),
            ),
            onTap: () {
              _showSnackbar(
                  context, "'${drawerMenuItems[1]}' not implemented yet!");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) => AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            menuIconPath,
            color: secondaryColor,
          ),
          onPressed: () => _globalKey.currentState!.openDrawer(),
        ),
      );

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
