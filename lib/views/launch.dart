import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stone_shop/component/alert.dart';
import 'package:stone_shop/component/widgets/kq-public-widget-ui.dart';
import 'package:stone_shop/entity/app_config.dart';
import 'package:stone_shop/entity/user.dart';
import 'package:stone_shop/leolib/KqToast.dart';
import 'package:stone_shop/leolib/network/http-client.dart';
import 'package:stone_shop/leolib/utils/flutter_screenutil.dart';
import 'package:stone_shop/leolib/utils/utils.dart';
import 'package:stone_shop/service/app-config-service.dart';
import 'package:stone_shop/service/currentProduct.dart';
import 'package:stone_shop/service/user-service.dart';
import 'package:stone_shop/store/app_config.dart';
import 'package:stone_shop/store/user.dart';
import 'package:stone_shop/views/login.dart';

class Launch extends StatelessWidget{
    @override
    Widget build(BuildContext context) {

      ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
        return Theme(
            data: ThemeData(appBarTheme: AppBarTheme(brightness: Brightness.dark)),
            child: Scaffold(
                body: new LaunchBody(),
            )
        );
    }
}

class LaunchBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LaunchBodyState();
  }
}
class LaunchBodyState extends State<LaunchBody> {
    Timer timer;
    User user;
    bool isShowBtn = false;

    @override
    void initState() {
        super.initState();
        loadLocalUserInfo();
    }

    @override
    void dispose(){
        super.dispose();
        timer.cancel();
    }

    loadLocalUserInfo() async {
        await StoreUser.loadUser().then((res){
            handUserLogined(res);
            user = res;
        });
        await StoreAppConfig.loadUser().then((res){
            handGlobalConfigLogined(res);
        });
        timer = Timer.periodic(Duration(milliseconds: 3000), (timer) {
            if (user != null){
                loginStateCheck();
            }else{
                isShowBtn = true;
                this.setState((){});
                timer.cancel();
            }
        });
    }

    loginStateCheck() async {
        Http.loginCheck().listen((res) async {
            timer.cancel();
            if (user == null || res != 0){
                print('没有自动登录');
                isShowBtn = true;
                this.setState((){});
            }
            if (res == 0 && user != null){
                Http.globalConfig().listen((config){
                    handGlobalConfigLogined(config);
                    Navigator.pushNamedAndRemoveUntil(context, "/home", (router) => router == null);
                });
            }
        }, onError: (e){
            isShowBtn = true;
            this.setState((){});
            KqToast('${e.message}');
        });
    }

    getAppConfig() async {
        Http.globalConfig().listen((config){
            handGlobalConfigLogined(config);
            this.setState((){});
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                child: Stack(children: <Widget>[
                    Image.asset('images/launch_bgImg.png', height: double.infinity, width: double.infinity, fit: BoxFit.cover,),

                    Positioned(child: Column(children: <Widget>[
                        Container(
                            width: KQPublicWidgetUI.deviceWidth,
                                child: Text('',
                                        style: TextStyle(fontSize: Utils.setFs(28),
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),textAlign: TextAlign.center,)
                            ),
                            SizedBox(height: Utils.setHeight(50),),
                            InkWell(
                                child: isShowBtn?Container(
                                    child: Center(child: Text('开始体验', style: TextStyle(color: Colors.white, fontSize: Utils.setFs(40)),),),
                                    width: Utils.setWidth(350),
                                    height: Utils.setHeight(80),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white, width: 1.5),
                                        borderRadius: BorderRadius.circular(100.0),
                                    ),
                                ):Container(),
                                onTap: () => Navigator.pushNamedAndRemoveUntil(context, "/login", (router) => router == null)
                            ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    bottom: Utils.setHeight(150),
                    )
                ],),
                height: double.infinity,
            ),
        );
    }
}