import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:right_direction/model/GameLogic.dart';
import 'package:right_direction/model/Direction.dart';

class GamePage extends StatefulWidget {

  GameLogic gameLogic;

  GamePage(this.gameLogic);

  @override
  State<StatefulWidget> createState() => _GamePageState(gameLogic);
}

class _GamePageState extends State<GamePage> {

  _GamePageState(gameLogic) {

    gameLogic.start();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xff00751f),
        appBar: AppBar(
          title: Text('Right Direction'),
        ),
        body: ScopedModelDescendant<GameLogic>(
            builder: (context, child, GameLogic gameLogic) =>
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 10, 0, MediaQuery.of(context).size.height / 15),
                        child: Text('Score: ${gameLogic.score}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                      ),
                      Flexible(
                          flex: 2,
                          child: GridView.count(
                            primary: false,
                            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height / 25, 20, 20),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                            children: <Widget>[
                              Container(),
                              getArrowForDirection(Direction.up, gameLogic.direction), //arrowUp,
                              Container(),
                              getArrowForDirection(Direction.left, gameLogic.direction),
                              Container(),
                              getArrowForDirection(Direction.right, gameLogic.direction),
                              Container(),
                              getArrowForDirection(Direction.down, gameLogic.direction),
                              Container(),
                            ],
                          )
                      )
                    ]
                )
        )
    );
  }

  Widget getArrowForDirection(Direction showDir, Direction direction) {

    switch (showDir) {
      case Direction.up:
        return Container(
          padding: const EdgeInsets.all(8),
          child: const Icon(Icons.arrow_upward, size: 75,),
          color: direction == showDir ? Color(0xff0008ff) : Color(0x550008ff),
        );
        break;
      case Direction.down:
        return Container(
          padding: const EdgeInsets.all(8),
          child: const Icon(Icons.arrow_downward, size: 75,),
          color: direction == showDir ? Color(0xffff0000) : Color(0x55ff0000),
        );
        break;
      case Direction.right:
        return Container(
          padding: const EdgeInsets.all(8),
          child: const Icon(Icons.arrow_forward, size: 75,),
          color: direction == showDir ? Color(0xffffea00) : Color(0x55ffea00),
        );
        break;
      case Direction.left:
        return Container(
          padding: const EdgeInsets.all(8),
          child: const Icon(Icons.arrow_forward, size: 75, textDirection: TextDirection.rtl,),
          color: direction == showDir ? Color(0xffff00cc) : Color(0x55ff00cc),
        );
        break;
    }
  }
}