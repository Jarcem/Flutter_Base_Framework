import 'package:json_annotation/json_annotation.dart';
import 'package:stone_shop/entity/regeocode.dart';
part 'amap_location.g.dart';

@JsonSerializable()
class AmapLocation{
    RegeoCode regeocode;
    String info;
    String infocode;

    AmapLocation();
    factory AmapLocation.of(Map<String, dynamic> json) => _$AmapLocationFromJson(json);
    factory AmapLocation.formJson(Map<String, dynamic> json) => _$AmapLocationFromJson(json);
    /// jsonEncode时默认调用的方法
    Map<String, dynamic> toJson() =>  _$AmapLocationToJson(this);
}