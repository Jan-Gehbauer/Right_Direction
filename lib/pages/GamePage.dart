import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:right_direction/model/SpiritLevelViewModel.dart';

class GamePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xff00751f),
        appBar: AppBar(
          title: Text('Right Direction'),
        ),
        body: ScopedModelDescendant<SpiritLevelViewModel>(
          builder: (context, child, SpiritLevelViewModel model) =>
            GridView.count(
              primary: false,
              padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height / 5, 20, 20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget>[
                Container(),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.arrow_upward, size: 75,),
                  color: Color(0x550008ff),
                ),
                Container(),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.arrow_forward, size: 75, textDirection: TextDirection.rtl,),
                  color: Color(0x55ff00cc),
                ),
                Container(),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.arrow_forward, size: 75,),
                  color: Color(0x55ffea00),
                ),
                Container(),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.arrow_downward, size: 75,),
                  color: Color(0x55ff0000),
                ),
                Container(),
              ],
            )
        )
    );
  }
}