import 'package:json_annotation/json_annotation.dart';
part 'number_fact_resp.g.dart';

@JsonSerializable()
class NumberFactResp {
  @JsonKey(name: 'userId')
  int? userId;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? title;

  NumberFactResp({this.userId, this.id, this.title});

  factory NumberFactResp.fromJson(Map<String, dynamic> json) {
    return _$NumberFactRespFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NumberFactRespToJson(this);
}
