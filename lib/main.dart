import 'package:flutter/material.dart';
import 'package:stone_shop/app.dart';
import 'package:stone_shop/component/widgets/kq-public-widget-ui.dart';
import 'package:stone_shop/views/complaint.dart';
import 'package:stone_shop/views/forget_password.dart';
import 'package:stone_shop/views/home/exchange_product.dart';
import 'package:stone_shop/views/home/home_customer_service.dart';
import 'package:stone_shop/views/home/home_main.dart';
import 'package:stone_shop/views/home/home_user_center.dart';
import 'package:stone_shop/views/home/home.dart';
import 'package:stone_shop/views/home/home_user_center_edit.dart';
import 'package:stone_shop/views/home/search.dart';
import 'package:stone_shop/views/launch.dart';
import 'package:stone_shop/views/login.dart';
import 'package:stone_shop/views/orders/order_apply_deliver.dart';
import 'package:stone_shop/views/orders/order_buy.dart';
import 'package:stone_shop/views/orders/order_buy_details.dart';
import 'package:stone_shop/views/orders/order_transfer.dart';
import 'package:stone_shop/views/orders/order_transfer_details.dart';
import 'package:stone_shop/views/product/product_info.dart';
import 'package:stone_shop/views/register.dart';
import 'package:stone_shop/views/security/change_password.dart';
import 'package:stone_shop/views/security/retrieve_secondary_pd.dart';

import 'package:stone_shop/views/security/security.dart';
import 'package:stone_shop/views/security/security_password.dart';
import 'package:stone_shop/views/security/setting_secondary_pd.dart';
import 'package:stone_shop/views/system_messages.dart';
import 'package:stone_shop/views/treaty/treaty.dart';
import 'package:stone_shop/views/user_center/comit_receiver_message.dart';
import 'package:stone_shop/views/user_center/heart_coin.dart';
import 'package:stone_shop/views/user_center/help_center.dart';
import 'package:stone_shop/views/user_center/my_product.dart';
import 'package:stone_shop/views/user_center/my_product_info.dart';
import 'package:stone_shop/views/user_center/my_star.dart';
import 'package:stone_shop/views/user_center/my_team.dart';
import 'package:stone_shop/views/user_center/paymeny_option.dart';
import 'package:stone_shop/views/user_center/release_product.dart';
import 'package:stone_shop/views/user_center/share_friend.dart';

void main() => runApp(StoneShopApp());
class StoneShopApp extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
        return _StoneShopApp();
    }
}

class _StoneShopApp extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        return _StoneShopAppState();
    }
}

class _StoneShopAppState extends State<_StoneShopApp> {
    @override
    void initState() {
        super.initState();
        App.start(context);
    }

    @override
    void dispose(){
        super.dispose();
        KQPublicWidgetUI.stopTimer();
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: Launch(),
            debugShowCheckedModeBanner: false,
            routes: <String, WidgetBuilder>{
                "/launch": (BuildContext context) => Launch(),
            },
            theme: ThemeData(
                primaryColor: Colors.white,
            ),
        );
    }
}