// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'areas_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AreasModel _$AreasModelFromJson(Map<String, dynamic> json) => AreasModel()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?;

Map<String, dynamic> _$AreasModelToJson(AreasModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
