// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_fact_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NumberFactResp _$NumberFactRespFromJson(Map<String, dynamic> json) =>
    NumberFactResp(
      userId: (json['userId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$NumberFactRespToJson(NumberFactResp instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
    };
