import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:rxdart/rxdart.dart';
import 'package:convert/convert.dart';
import 'package:stone_shop/entity/amap_location.dart';
import 'package:stone_shop/entity/app_config.dart';
import 'package:stone_shop/entity/category.dart';
import 'package:stone_shop/entity/categoryinfo.dart';
import 'package:stone_shop/entity/cert.dart';
import 'package:stone_shop/entity/get_tab.dart';
import 'package:stone_shop/entity/notice_system.dart';
import 'package:stone_shop/entity/notice_user.dart';
import 'package:stone_shop/entity/orderList.dart';
import 'package:stone_shop/entity/product.dart';
import 'package:stone_shop/entity/user.dart';
import 'package:stone_shop/entity/wallet.dart';
import 'package:stone_shop/leolib/utils/utils.dart';
import 'package:stone_shop/service/user-service.dart';

final lxlUrl = "http://192.168.31.188:3014";
final qxUrl = "http://192.168.31.75:3014";
final localUrl = "http://127.0.0.1:3014";
final ybUrl = "http://192.168.31.66:3014";
final lpUrl = "http://192.168.31.103:3030";
final wyUrl = "http://192.168.31.88:3030";

final testUrl = "http://112.74.93.225:3030";

final proUrl = 'http://112.74.93.225:3030';
final debugUrl = testUrl;

final connectTimeout = 10000;
final receiveTimeout = 10000;
final isDebug = true;

class Http {
    static bool get isTest => isDebug;
    String path;
    Map<String, dynamic> params = {};

    Http(String path, [Map<String, dynamic> params]) {
        this.path = path;
        if (params == null) {
            params = {};
        }
        this.params.addAll(params);
    }

    String _joint(Map<String, dynamic> params, [ignoreSign = true]) {
        var keys = params.keys.toList()
                    ..sort();
        if (keys.length == 0) {
            return "";
        }
        var str = "";

        keys.forEach((key) {
            if (ignoreSign && key == 'sign') {
                return;
            }
            str = str + (str.length > 0 ? "&" : "");
            var value = params[key];
            if (value == null) {
                return;
            }
            str += '$key=$value';
        });
        return str;
    }

    String _signature(Map<String, dynamic> params) {
        var string = _joint(params);
        string = "oj)\$&!@" + string + '@#jfanb*(.';
        var content = Utf8Encoder().convert(string);
        var md5 = crypto.md5;
        var digest = md5.convert(content);
        return hex.encode(digest.bytes);
    }

    get body {
        if (this.params == null) {
            this.params = {};
        }
        var userId = UserService.curUserId;
        // var token = UserService.curToken;

        if (userId != null && this.params["userId"] == null) {
            this.params["userId"] = userId.toString();
        }
        // if (!Utils.isEmpty(token) && this.params["token"] == null) {
        //     this.params["token"] = token;
        // }
        // if (isDebug) {
            params['__leo__test'] = "!(FALKJSDdi101-fjLQ91hvl~@#\$-we13";
        // }

        params.removeWhere((key, value) => value == null);
        params.forEach((key, value) {
            params[key] = value.toString();
        });
        // params['sign'] = _signature(params);
        return this.params;
    }

    Observable<dynamic> post() {
        print("开始请求:" + debugUrl + this.path);
        var optioins = BaseOptions(baseUrl: isDebug ? debugUrl : proUrl, connectTimeout: connectTimeout, receiveTimeout: receiveTimeout);
        var dio = Dio(optioins);
        var observable = Observable.fromFuture(dio.post(this.path, data: body)
                .catchError((err) {
                    dio.clear();
                    print("${this.path}${err.message}");
                    throw DioError(message: "网络连接失败");
                }));
        return observable.flatMap<dynamic>((response) {
                if (response.statusCode == HttpStatus.ok) {
                    if (response.data['code'] == 0) {
                        print("${this.path} 请求成功:" + response.data.toString() + "\n");
                        return Observable.just(response.data['value']);
                    }
                    print("${this.path} 请求失败:" + response.data['message']);
                    return Observable.error(DioError(message: response.data['message']));
                }
                print("${this.path} 网络请求错误:" + debugUrl + this.path + ", code:" + response.statusCode.toString());
                return Observable.error(DioError(message: "网络请求错误"));
            });
    }

    Observable<dynamic> getLocationRequest() {
        print("开始请求:" + 'https://restapi.amap.com' + this.path);
        var optioins = BaseOptions(baseUrl: 'https://restapi.amap.com', connectTimeout: connectTimeout, receiveTimeout: receiveTimeout);
        var dio = Dio(optioins);
        var observable = Observable.fromFuture(dio.get(this.path, queryParameters: body)
                .catchError((err) {
                    dio.clear();
                    print("报错啦！！！${this.path}${err.message}");
                    throw DioError(message: "网络连接失败");
                }));
        return observable.flatMap<dynamic>((response) {
                if (response.statusCode == HttpStatus.ok) {
                    if (response.data['code'] == 0) {
                        print("${this.path} 请求成功:" + response.data.toString() + "\n");
                        return Observable.just(response.data['value']);
                    }
                    print("${this.path} 请求失败:" + response.data['message']);
                    return Observable.error(DioError(message: response.data['message']));
                }
                print("${this.path} 网络请求错误:" + debugUrl + this.path + ", code:" + response.statusCode.toString());
                return Observable.error(DioError(message: "网络请求错误"));
            });
    }



    ///---------------接口---------------
    ///高德定位
    static Future getLocationInfo(List<dynamic> coodinate)async{
        try{
            Response response;
            var data={'key':'0990b01ee890c815f9f46394f77fe3cf', "location": "${coodinate[0]},${coodinate[1]}"};
            response = await Dio().get(
                "https://restapi.amap.com/v3/geocode/regeo",
                queryParameters:data
            );
            print('${response.data}');
            return response.data;
        }catch(e){
            print(e);
        }
    }
    ///传地理位置信息给后台
    static Observable sendLocation(String address){
        return Http('/api/user/setAddress', {"sessionToken": UserService.curToken, "userId": UserService.curUserId, "address": address}).post();
    }

    ///下载文件
    static Future downloadFile(String urlPath) async {
      Dio dio = Dio();
      dio.options.connectTimeout = 10000;
      dio.options.receiveTimeout = 10000;
      String fileName = Utils.generateMd5(urlPath);
      Response response = await dio.download(
          '$urlPath', "/storage/emulated/0/DCIM/Camera/${fileName}.png");
      if (response.statusCode == 200) {
        return '图片保存在/storage/emulated/0/DCIM/Camera文件下';
      }else{
          return '下载失败';
      }
    }
}