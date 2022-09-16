import 'package:qualif/models/game.dart';
import 'package:qualif/models/user.dart';

class Review {
  User user;
  Game game;
  String review;
  Review(this.user, this.game, this.review);
}
