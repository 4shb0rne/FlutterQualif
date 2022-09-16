import 'package:flutter/material.dart';
import 'package:qualif/views/pages/gamepage.dart';
import 'package:qualif/views/pages/homepage.dart';
import 'package:qualif/views/pages/loginpage.dart';
import 'package:qualif/models/globals.dart' as globals;

class Navigation {
  var _context;
  var _listViewDrawerChildren;

  Navigation(var context,
      {bool isHomePage = false, bool isProductPage = false}) {
    this._context = context;

    this._listViewDrawerChildren = [
      Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide()),
        ),
        child: ListTile(
          leading: Icon(Icons.person_rounded),
          title: Text('Hello, ' + globals.currentUser!.fullname + ' !'),
          trailing: Icon(Icons.verified),
        ),
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: TextButton(
          child: Text(
            'Home',
          ),
          onPressed: null,
        ),
      ),
      ListTile(
        leading: Icon(Icons.shopping_cart),
        title: TextButton(
          child: Text('Buy Game'),
          onPressed: null,
        ),
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: TextButton(
          child: Text('Logout'),
          onPressed: () {
            Navigator.push(
              _context,
              MaterialPageRoute(builder: (builder) {
                return LoginPage();
              }),
            );
          },
        ),
      ),
    ];

    _listViewDrawerChildren[1] = ListTile(
      leading: Icon(Icons.home),
      title: TextButton(
        child: Text(
          'Home',
        ),
        onPressed: () {
          Navigator.push(
            _context,
            MaterialPageRoute(builder: (builder) {
              return HomePage();
            }),
          );
        },
      ),
      selected: isHomePage,
    );

    _listViewDrawerChildren[2] = ListTile(
      leading: Icon(Icons.shopping_cart),
      title: TextButton(
        child: Text('View All Games'),
        onPressed: () {
          Navigator.push(
            _context,
            MaterialPageRoute(builder: (builder) {
              return GamePage();
            }),
          );
        },
      ),
      selected: isProductPage,
    );
  }

  Drawer getDrawer() {
    return Drawer(
      child: ListView(
        children: _listViewDrawerChildren,
      ),
    );
  }

  dynamic getAppBarActions() {
    return _appBarActions;
  }

  var _appBarActions = [
    PopupMenuButton(itemBuilder: (context) {
      return List.generate(1, (e) {
        return PopupMenuItem(
          child: TextButton(
            child: Text(globals.isDarkTheme
                ? 'Change to Light theme'
                : 'Change to Dark Theme'),
            onPressed: () {
              globals.currState!.setState(() {
                globals.isDarkTheme = !globals.isDarkTheme;
              });
            },
          ),
        );
      }).toList();
    })
  ];
}
