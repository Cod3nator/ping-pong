import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pong/ball.dart';
import 'package:pong/brick.dart';
import 'package:pong/coverscreen.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}
enum Direction{up, down, left, right}

class _HomePageState extends State<HomePage> {
  double playerX=0;
  double ballX=0;
  double ballY=0;
  bool gameHasStarted=false;
  var ballYDirection=Direction.down;
  var ballXDirection=Direction.left;
  void startGame(){
    gameHasStarted=true;
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      // to change the direction of the ball
    updateDirection();
    // to move the ball up or down
     moveBall();

    });
  }

  void updateDirection(){
    setState(() {
      //veritical direction
      if(ballY>=0.9){
        ballYDirection=Direction.up;
      }else if(ballY<=-0.9){
        ballYDirection=Direction.down;
      }
      // horizontal direction
      if(ballX>=1){
        ballXDirection=Direction.left;
      }else if(ballX<=-1){
        ballXDirection=Direction.right;
      }

    });
  }
  void moveBall(){
    setState(() {
      //vertical movement
      if(ballYDirection==Direction.down){
        ballY+=0.01;
      }else if(ballYDirection==Direction.up){
        ballY-=0.01;
      }
      // horizontal movement
      if(ballXDirection==Direction.left){
        ballX-=0.01;
      }else if(ballXDirection==Direction.right){
        ballX+=0.01;
      }
    });
  }
  void moveLeft(){
   setState(() {
     playerX-=0.05;
   });

  }
  void moveRight(){
    setState(() {
      playerX+=0.05;
    });

  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event){
        if(event.isKeyPressed(LogicalKeyboardKey.arrowLeft)){
          moveLeft();
        }else if(event.isKeyPressed(LogicalKeyboardKey.arrowRight)){
          moveRight();
        }
      },
      child: GestureDetector(
        onTap: startGame,
        child: Scaffold(
          backgroundColor: Colors.greenAccent,
          body: Center(
            child: Stack(
              children:[
                //tap to play
                CoverScreen(gameHasStarteed: gameHasStarted,),
                //top brick
                MyBrick(x: 0, y:-0.9,),





                //bottom brick
                MyBrick(x: playerX,y: 0.9,),
              // the ball
                MyBall(x: ballX,y: ballY),
              ]

            ),
          ),

        ),
      ),
    );
  }
}
