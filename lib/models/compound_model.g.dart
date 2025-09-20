// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compound_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompoundModel _$CompoundModelFromJson(Map<String, dynamic> json) =>
    CompoundModel()
      ..id = (json['id'] as num?)?.toInt()
      ..areaId = (json['area_id'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..imagePath = json['image_path'] as String?;

Map<String, dynamic> _$CompoundModelToJson(CompoundModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'area_id': instance.areaId,
      'name': instance.name,
      'image_path': instance.imagePath,
    };
