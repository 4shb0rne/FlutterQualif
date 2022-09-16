import 'package:flutter/material.dart';
import 'package:qualif/models/game.dart';
import 'package:qualif/models/globals.dart' as globals;
import 'package:qualif/views/components/navigation.dart';
import 'package:qualif/views/pages/detailpage.dart';

class GamePage extends StatelessWidget {
  var _context;
  void _viewDetail(Game c) {
    Navigator.push(
      _context,
      MaterialPageRoute(builder: (builder) {
        return GameDetailPage(c);
      }),
    );
  }

  Widget _buildWidget(Game c) {
    return Card(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 80,
              maxWidth: 80,
              minHeight: 80,
              minWidth: 80,
            ),
            child: Image.asset('assets/${c.image}', fit: BoxFit.cover),
          ),
          Text(
            c.name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
          ),
          ElevatedButton(
            child: Text('Detail'),
            onPressed: () => _viewDetail(c),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    Navigation nav = Navigation(context, isProductPage: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
        actions: nav.getAppBarActions(),
      ),
      drawer: nav.getDrawer(),
      body: GridView.count(
        primary: false,
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: globals.games.map((e) => _buildWidget(e)).toList(),
      ),
    );
  }
}
