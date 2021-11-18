import '../screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, tapHandler) {
      return ListTile(
          leading: Icon(
            icon,
            size: 26,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "RobotoCondensed",
            ),
          ),
          onTap: tapHandler);
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(255, 179, 0, 1)),
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Belisimmo",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Meals", Icons.restaurant, () {
            return Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile("Filters", Icons.settings, () {
            return Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
