import 'package:flutter/material.dart';
import 'package:qualif/main.dart';
import 'package:qualif/models/game.dart';
import 'package:qualif/models/review.dart';
import 'package:qualif/models/user.dart';

var currentUser = null;

AppState? currState = null;

bool isDarkTheme = false;

ThemeData darkTheme = ThemeData(
  fontFamily: 'Montserrat',
  accentColor: Colors.red,
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: Colors.blueGrey),
  ),
);

ThemeData lightTheme = ThemeData(
  fontFamily: 'Montserrat',
  accentColor: Colors.orange,
  brightness: Brightness.light,
  primaryColor: Colors.orange.shade200,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: Colors.orange.shade900),
  ),
);

var carouselImages = [
  'assets/carousel1.webp',
  'assets/carousel2.webp',
  'assets/carousel3.webp',
  'assets/carousel4.webp',
  'assets/carousel5.webp',
  'assets/carousel6.webp',
];

//akun untuk login
var users = [
  User('user user', 'users@gmail.com', 'users123'),
  User('william', 'william@gmail.com', 'william123'),
  User('helloworld', 'hello@gmail.com', 'hello123')
];

var reviews = [
  Review(users[0], games[0], 'gg'),
  Review(users[1], games[1], 'Nice game bruh'),
  Review(users[1], games[2], 'GOTY POG'),
  Review(users[1], games[4], 'BEST GAME EVER'),
  Review(users[0], games[1], '7/10')
];

var games = [
  Game(
    'God of War',
    'God of War is an action-adventure game developed by Santa Monica Studio and published by Sony Interactive Entertainment (SIE). It was released in April 2018 for the PlayStation 4, with a Microsoft Windows version released in January 2022. The game is the eighth installment in the God of War series, the eighth chronologically, and the sequel to 2010s God of War III.',
    639000,
    'gow.jpg',
  ),
  Game(
    'FIFA 23',
    'EA SPORTS™ FIFA 23 brings The Worlds Game to the pitch, with next-gen HyperMotion2 Technology, womens club football, two FIFA World Cup™ tournaments',
    799000,
    'fifa.jpg',
  ),
  Game(
    'Ghost of Tsushima',
    'Uncover the hidden wonders of Tsushima in this open-world action adventure from Sucker Punch Productions and PlayStation Studios, available for PS5 and PS4. Forge a new path and wage an unconventional war for the freedom of Tsushima. Challenge opponents with your katana, master the bow to eliminate distant threats, develop stealth tactics to ambush enemies and explore a new story on Iki Island.',
    739000,
    'ghost.jpg',
  ),
  Game(
    'Elden Ring',
    'In the Lands Between ruled by Queen Marika the Eternal, the ELDEN RING, the source of the Erdtree, has been shattered. Marika offspring, demigods all, claimed the shards of the ELDEN RING known as the Great Runes, and the mad taint of their newfound strength triggered a war: The Shattering. A war that meant abandonment by the Greater Will.And now the guidance of grace will be brought to the Tarnished who were spurned by the grace of gold and exiled from the Lands Between.Ye dead who yet live, your grace long lost, follow the path to the Lands Between beyond the foggy sea to stand before the ELDEN RING. And become the Elden Lord.',
    759000,
    'eldenring.jpg',
  ),
  Game(
    'Sekiro : Shadow Die Twice',
    'Carve your own clever path to vengeance in the critically acclaimed adventure from developer FromSoftware, creators of the Dark Souls series.In Sekiro™: Shadows Die Twice you are the one-armed wolf, a disgraced and disfigured warrior rescued from the brink of death. Bound to protect a young lord who is the descendant of an ancient bloodline, you become the target of many vicious enemies, including the dangerous Ashina clan. When the young lord is captured, nothing will stop you on a perilous quest to regain your honor, not even death itself. Explore late 1500s Sengoku Japan, a brutal period of constant life and death conflict, as you come face to face with larger than life foes in a dark and twisted world. Unleash an arsenal of deadly prosthetic tools and powerful ninja abilities while you blend stealth, vertical traversal, and visceral head to head combat in a bloody confrontation. Take Revenge. Restore Your Honor. Kill Ingeniously.',
    749000,
    'sekiro.jpg',
  ),
  Game(
    'Zelda : Breath of the wild',
    'The Legend of Zelda: Breath of the Wild is a 2017 action-adventure game developed and published by Nintendo for the Nintendo Switch and Wii U consoles. The game is an installment of The Legend of Zelda series and is set at the end of its timeline. The player controls an amnesiac Link, who awakens from a hundred-year slumber, and attempts to regain his memories and prevent the destruction of Hyrule by Calamity Ganon.',
    739999,
    'zelda.jpg',
  ),
];
