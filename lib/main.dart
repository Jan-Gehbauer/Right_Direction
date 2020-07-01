import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:right_direction/model/SpiritLevelViewModel.dart';
import 'package:right_direction/pages/GamePage.dart';

void main() {

  runApp(RightDirectionApp());
}

class RightDirectionApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _RightDirectionAppState();
}

class _RightDirectionAppState extends State<RightDirectionApp> {

  SpiritLevelViewModel model;

  @override
  Widget build(BuildContext context) {

    return ScopedModel<SpiritLevelViewModel>(
        model: model,
        child: MaterialApp(
          title: 'Right Direction',
          theme: ThemeData(
            primarySwatch: Colors.green
          ),
          home: GamePage()
        )
    );
  }

  @override
  void initState() {

    super.initState();

    model = SpiritLevelViewModel();
  }

  @override
  void dispose() {

    super.dispose();
  }
}