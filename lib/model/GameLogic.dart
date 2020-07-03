import 'package:scoped_model/scoped_model.dart';
import 'package:right_direction/model/SpiritLevelViewModel.dart';
import 'dart:async';
import 'dart:math';
import 'package:right_direction/model/Direction.dart';
import 'package:vibration/vibration.dart';

class GameLogic extends Model {

  int score;
  int counter;

  Direction direction;
  Timer timer;
  SpiritLevelViewModel spiritLevelViewModel;

  var timeout = const Duration(seconds: 3);
  var ms = const Duration(milliseconds: 1);

  void start() {

    score = 0;
    counter = 0;

    spiritLevelViewModel = SpiritLevelViewModel();
    spiritLevelViewModel.gameLogic = this;

    startTimeout(1000);
  }

  startTimeout([int milliseconds]) {

    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return timer = new Timer(duration, roundTimedOut);
  }

  void movementDetected(Direction direction) {

    if (counter < 25) {
      if (direction == this.direction) {
        score ++;

        if (counter < 25) {
          changeDirection();

          counter ++;

          timer.cancel();

          startTimeout(1000);
        } else {
          Vibration.vibrate(duration: 500);

          return;
        }
      }
    }
  }

  void roundTimedOut() {

    if (counter < 25) {
      changeDirection();

      counter ++;

      timer.cancel();

      startTimeout(1000);
    } else {
      Vibration.vibrate(duration: 500);

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