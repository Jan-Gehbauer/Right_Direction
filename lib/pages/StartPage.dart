import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:right_direction/model/GameLogic.dart';
import 'package:right_direction/pages/GamePage.dart';

class StartPage extends StatelessWidget {

  GameLogic gameLogic;

  StartPage(this.gameLogic);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xff00751f),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width / 2,
              ),
              Text(
                "Right Direction",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 5,
                  color: Colors.blue,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width / 3,
              ),
              RaisedButton(
                child: Icon(Icons.play_arrow),
                textColor: Color(0xff000ead),
                color: Color(0xff6b77ff),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage(gameLogic)),
                  );
                }
              )
            ],
          )
        ),
    );
  }
}