import 'package:scoped_model/scoped_model.dart';
import 'package:right_direction/model/SpiritLevelViewModel.dart';
import 'dart:async';
import 'dart:math';
import 'package:right_direction/model/Direction.dart';

class GameLogic extends Model {

  int score;
  Direction direction;
  Timer timer;
  SpiritLevelViewModel spiritLevelViewModel;

  GameLogic() {

    score = 0;

    spiritLevelViewModel = SpiritLevelViewModel();
    spiritLevelViewModel.gameLogic = this;

    startTimeout(1000);
  }

  int counter = 0;

  var timeout = const Duration(seconds: 3);
  var ms = const Duration(milliseconds: 1);

  startTimeout([int milliseconds]) {

    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, roundTimedOut);
  }

  void movementDetected(Direction direction) {

    if (direction == this.direction) {
      score ++;

      changeDirection();

      if (counter < 10) {
        startTimeout(1000);
      } else {
        return;
      }
    }
  }

  void roundTimedOut() {

    changeDirection();

    if (counter < 10) {
      counter ++;

      startTimeout(1000);
    } else {
      return;
    }
  }

  void changeDirection() {

    direction = newRndDir();

    notifyListeners();
  }

  Direction newRndDir() {

    Random rng = new Random();

    int randomDirection = rng.nextInt(4);

    switch (randomDirection) {
      case 0:
        if (direction != Direction.up) {
          return Direction.up;
        } else {
          return newRndDir();
        }

        break;
      case 1:
        if (direction != Direction.right) {
          return Direction.right;
        } else {
          return newRndDir();
        }

        break;
      case 2:
        if (direction != Direction.down) {
          return Direction.down;
        } else {
          return newRndDir();
        }

        break;
      case 3:
        if (direction != Direction.left) {
          return Direction.left;
        } else {
          return newRndDir();
        }

        break;
    }
  }
}