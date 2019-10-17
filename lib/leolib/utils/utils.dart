import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

import 'package:stone_shop/leolib/utils/flutter_screenutil.dart';

class Utils {
  /// 字符串判空
  static isEmpty(String str) {
        return str == null || str == "";
    }
  ///  电话号码匹配
  static bool isChinaPhoneLegal(String str) {
        return new RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
    }
  /// 设置自适应宽度
  static double setWidth(int width) {
      return ScreenUtil().setWidth(width.toDouble());
  }
  /// 设置自适应高度
  static double setHeight(int height) {
      return ScreenUtil().setHeight(height.toDouble());
  }
  /// 设置自适应double宽度
  static double setWidthDouble(double width) {
      return ScreenUtil().setWidth(width);
  }
  /// 设置自适应double高度
  static double setHeightDouble(double height) {
      return ScreenUtil().setHeight(height);
  }
  /// 设置自适应字体大小
  static double setFs(int fontSize) {
      return ScreenUtil().setSp(fontSize);
  }
  /// 设置bar高度
  static double tabBarHeight() {
      return ScreenUtil.statusBarHeight;
  }
  /// MD5加密
  static String generateMd5(String data) {
        var content = new Utf8Encoder().convert(data);
        var digest = md5.convert(content);
        return hex.encode(digest.bytes);
    }
}