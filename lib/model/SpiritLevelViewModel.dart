import 'package:scoped_model/scoped_model.dart';
import 'package:sensors/sensors.dart';
import 'package:right_direction/model/GameLogic.dart';
import 'package:right_direction/model/Direction.dart';

class SpiritLevelViewModel extends Model {

  double xNorm;
  double yNorm;

  GameLogic gameLogic;

  SpiritLevelViewModel() {
    accelerometerEvents.listen(
      (event) {
        xNorm = _norm(event.x);
        yNorm = _norm(event.y);

        if (xNorm > 0.5) {
          gameLogic.movementDetected(Direction.left);
          print(xNorm);
        }
        else if (xNorm < -0.5) {
          gameLogic.movementDetected(Direction.right);
          print(xNorm);
        }
        else if (yNorm > 0.5) {
          gameLogic.movementDetected(Direction.down);
          print(yNorm);
        }
        else if (yNorm < -0.5) {
          gameLogic.movementDetected(Direction.up);
          print(yNorm);
        }
      }
    );
  }

  double _norm(double value) {

    double tmp = value / 9.8;

    if (tmp < -1) {
      tmp = -1;
    }
    else if (tmp > 1) {
      tmp = 1;
    }

    return tmp;
  }
}