import 'package:json_annotation/json_annotation.dart';
part 'app_config.g.dart';

@JsonSerializable()
class AppConfig{
    //ID
    int id;
    //认证审核联系客服
    String reviewCustomerService;
    //申请发货联系客服
    String shipCustomerService;
    //申诉联系客服
    String appealCustomerService;
    //首页轮播图
    String homeCarousel;
    //平台服务协议
    String serviceProtocol;
    //用户隐私政策
    String privacyProtocol;
    //支付宝页面的提示
    String remindAliPay;
    //微信页面的提示
    String remindWeChat;
    //银行卡页面的提示
    String remindBank;
    //帮助中心
    String remindHelp;
    //我要发布
    String remindRelease;
    //申请发货
    String remindShip;
    //提交收货人信息
    String remindSubmit;
    //分享二维码
    String downloadUrl;
    //是否被禁用
    int isDisable;
    //创建时间
    DateTime createAt;
    //更新时间
    DateTime updateAt;

    AppConfig();
    factory AppConfig.of(Map<String, dynamic> json) => _$AppConfigFromJson(json);

    /// jsonEncode时默认调用的方法
    Map<String, dynamic> toJson() =>  _$AppConfigToJson(this);
}