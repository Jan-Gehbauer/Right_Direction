import 'package:scoped_model/scoped_model.dart';
import 'package:sensors/sensors.dart';

class SpiritLevelViewModel extends Model {

  double xNorm;
  double yNorm;
  double zNorm;

  get xDegree => xNorm * 90;
  get yDegree => yNorm * 90;
  get zDegree => zNorm * 90;

  SpiritLevelViewModel() {
    accelerometerEvents.listen(
      (event) {
        xNorm = _norm(event.x);
        yNorm = _norm(event.y);
        zNorm = _norm(event.z);

        notifyListeners();
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