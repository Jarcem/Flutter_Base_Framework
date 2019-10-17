import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stone_shop/views/launch.dart';

class LeoNavigator {
    /// 示例  当 a跳转到b 后，a需要接受b的返回值  可以通过async  await的方式实现
    // static Future toOtherUserInfoPage(BuildContext context, int userId) async{
    //     return await Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) {
    //         return Launch();
    //     }));
    // }


    ///  更具不同的数据跳转不同的页面
    // static Future<void> toHomeHandle(BuildContext context, User user) async{
    //     if (user == null) {
                ///  通过 (router) => router == null 来移除上一个界面
    //         Navigator.pushNamedAndRemoveUntil(context, "/login", (router) => router == null);
    //         return;
    //     }
    //     await LabelService.start();
    //     //已经登录过  验证信息
    //     if (user.sex == 0) {    //sex未填写
    //         Navigator.pushNamedAndRemoveUntil(context, "/sex_select", (router) => router == null);
    //         return;
    //     }
    // }
}