import 'package:flutter/widgets.dart';
import 'package:stone_shop/leolib/utils/flutter_screenutil.dart';
import 'package:stone_shop/service/user-service.dart';

class App {
    static bool _isStart = false;
    static BuildContext _context;

    static start(BuildContext context) {
        if (_isStart) {
            return;
        }
        _isStart = true;
        App._context = context;

        App._serviceStart();
        App._initScreenUtils();
    }

    static _serviceStart() {
        UserService.start();
    }

    static _initScreenUtils(){
    }
}