
import 'package:fluttertoast/fluttertoast.dart';

class LeoToast {
    LeoToast(String msg, {ToastGravity gravity, int timeInSecForIos = 1}) {
        if (msg == null) {
            return;
        }
        Fluttertoast.showToast(msg: msg, gravity: gravity, timeInSecForIos: timeInSecForIos);
    }
}