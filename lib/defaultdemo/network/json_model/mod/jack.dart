import 'package:json_annotation/json_annotation.dart';

part 'jack.g.dart';


@JsonSerializable()
class Jack extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'email')
  String email;

  Jack(this.name,this.email,);

  factory Jack.fromJson(Map<String, dynamic> srcJson) => _$JackFromJson(srcJson);

  Map<String, dynamic> toJson() => _$JackToJson(this);

}


