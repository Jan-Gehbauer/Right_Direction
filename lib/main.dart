import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:right_direction/pages/GamePage.dart';
import 'package:right_direction/model/GameLogic.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(RightDirectionApp());
}

class RightDirectionApp extends StatefulWidget {

  GameLogic gameLogic;

  RightDirectionApp() {

    gameLogic = GameLogic();
  }

  @override
  State<StatefulWidget> createState() => _RightDirectionAppState(gameLogic);
}

class _RightDirectionAppState extends State<RightDirectionApp> {

  GameLogic gameLogic;

  _RightDirectionAppState(this.gameLogic);

  @override
  Widget build(BuildContext context) {

    return ScopedModel<GameLogic>(
        model: gameLogic,
        child: MaterialApp(
            title: 'Spirit Level',
            theme: ThemeData(
                primarySwatch: Colors.green
            ),
            home: GamePage()
        )
    );
  }
}