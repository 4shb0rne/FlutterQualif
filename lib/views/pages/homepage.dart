import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:qualif/models/globals.dart' as globals;
import 'package:qualif/main.dart';
import 'package:qualif/views/components/navigation.dart';
import 'package:qualif/views/pages/loginpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Navigation nav = Navigation(context, isHomePage: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: nav.getAppBarActions(),
      ),
      drawer: nav.getDrawer(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
            child: Text(
              'Welcome to Gamestop!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide()),
            ),
          ),
          Text(
            'Events & Promotions',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
          ),
          CarouselSlider(
            items: globals.carouselImages
                .map((c) => Image(
                      image: AssetImage(c),
                    ))
                .toList(),
            options: CarouselOptions(
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                autoPlay: true,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 2)),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
            decoration: BoxDecoration(
              border: Border(top: BorderSide()),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                  ],
                ),
                Text(
                  'About Us',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                ),
                Text(
                  '\nGamestop is the world largest retail gaming and trade-in destination for Xbox, PlayStation, and Nintendo games, systems, consoles & accessories.',
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
