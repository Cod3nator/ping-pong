import 'package:flutter/material.dart';

class CoverScreen extends StatelessWidget {

  final gameHasStarteed;
  CoverScreen({this.gameHasStarteed});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0,-0.2),
      child: Text(gameHasStarteed?'':'Tap to Play',
      style:TextStyle(fontWeight: FontWeight.w100,
      color: Colors.white70),
        ),
    );
  }
}
