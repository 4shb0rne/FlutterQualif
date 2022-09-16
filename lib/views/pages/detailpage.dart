import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qualif/models/game.dart';
import 'package:qualif/models/review.dart';
import 'package:qualif/models/user.dart';
import 'package:qualif/views/components/navigation.dart';
import 'package:qualif/models/globals.dart' as globals;

class GameDetailPage extends StatefulWidget {
  late Game _game;
  GameDetailPage(this._game);
  @override
  State<StatefulWidget> createState() {
    return GameDetailPageState(_game);
  }
}

class GameDetailPageState extends State<GameDetailPage> {
  late Game _game;
  var _context;
  var _firstTab, _secondTab;
  var _ctrlReview = TextEditingController();
  void _validateReview() {
    String comment = _ctrlReview.text;
    if (comment.isEmpty) {
      ScaffoldMessenger.of(_context)
          .showSnackBar(SnackBar(content: Text('Review must not be Empty!')));
    } else {
      setState(() {
        var user = globals.currentUser;
        Review review = Review(user, _game, comment);
        globals.reviews.add(review);
        refreshReview();
      });
      ScaffoldMessenger.of(_context)
          .showSnackBar(SnackBar(content: Text('Review submitted!')));
    }
  }

  GameDetailPageState(Game game) {
    this._game = game;
    this._firstTab = ListView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      children: [
        Container(
          decoration: BoxDecoration(
            border:
                Border.all(width: 2, color: Color.fromRGBO(235, 235, 235, 1)),
            borderRadius: BorderRadius.circular(2),
          ),
          margin: EdgeInsets.all(30),
          height: 200,
          width: 200,
          child: Center(
            child: Image.asset('assets/${_game.image}'),
          ),
        ),
        Text(
          _game.name,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
          textAlign: TextAlign.center,
        ),
        Text(
          _game.description,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        Text(
          "Rp." + _game.price.toString(),
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'Buy Now!',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return Colors.orange;
              return Colors.orange.shade200;
            }),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide()),
          ),
          padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
          child: Column(
            children: [
              Text(
                'Input Review',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Review',
                    // errorText: _errorField == 'PASS' ? _errorMessage : null,
                  ),
                  controller: _ctrlReview,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 100,
                ),
                child: ElevatedButton(
                  onPressed: _validateReview,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.orange;
                      return Colors.orange.shade200;
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    refreshReview();
    // this._secondTab =
  }

  void refreshReview() {
    dynamic reviews =
        globals.reviews.where((r) => r.game == this._game).toList();
    this._secondTab = ListView(
      children: reviews.map<Widget>((r) => _buildReviewWidget(r)).toList(),
    );
  }

  Widget _buildReviewWidget(Review r) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: ListTile(
        leading: Text(r.user.fullname),
        title: Text(r.review),
        trailing: Icon(Icons.star),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    Navigation nav = Navigation(context, isProductPage: true);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Camera'),
          actions: nav.getAppBarActions(),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.info_outline),
                text: 'Details',
              ),
              Tab(
                icon: Icon(Icons.star_border_outlined),
                text: 'Review',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [_firstTab, _secondTab],
        ),
      ),
    );
  }
}
