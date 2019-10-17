// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return AppConfig()
    ..id = json['id'] as int
    ..reviewCustomerService = json['reviewCustomerService'] as String
    ..shipCustomerService = json['shipCustomerService'] as String
    ..appealCustomerService = json['appealCustomerService'] as String
    ..homeCarousel = json['homeCarousel'] as String
    ..serviceProtocol = json['serviceProtocol'] as String
    ..privacyProtocol = json['privacyProtocol'] as String
    ..remindAliPay = json['remindAliPay'] as String
    ..remindWeChat = json['remindWeChat'] as String
    ..remindBank = json['remindBank'] as String
    ..remindHelp = json['remindHelp'] as String
    ..remindRelease = json['remindRelease'] as String
    ..remindShip = json['remindShip'] as String
    ..remindSubmit = json['remindSubmit'] as String
    ..downloadUrl = json['downloadUrl'] as String
    ..isDisable = json['isDisable'] as int
    ..createAt = json['createAt'] == null
        ? null
        : DateTime.parse(json['createAt'] as String)
    ..updateAt = json['updateAt'] == null
        ? null
        : DateTime.parse(json['updateAt'] as String);
}

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'id': instance.id,
      'reviewCustomerService': instance.reviewCustomerService,
      'shipCustomerService': instance.shipCustomerService,
      'appealCustomerService': instance.appealCustomerService,
      'homeCarousel': instance.homeCarousel,
      'serviceProtocol': instance.serviceProtocol,
      'privacyProtocol': instance.privacyProtocol,
      'remindAliPay': instance.remindAliPay,
      'remindWeChat': instance.remindWeChat,
      'remindBank': instance.remindBank,
      'remindHelp': instance.remindHelp,
      'remindRelease': instance.remindRelease,
      'remindShip': instance.remindShip,
      'remindSubmit': instance.remindSubmit,
      'downloadUrl': instance.downloadUrl,
      'isDisable': instance.isDisable,
      'createAt': instance.createAt?.toIso8601String(),
      'updateAt': instance.updateAt?.toIso8601String(),
    };
