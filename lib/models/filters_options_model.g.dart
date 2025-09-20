// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_options_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiltersOptionsModel _$FiltersOptionsModelFromJson(Map<String, dynamic> json) =>
    FiltersOptionsModel()
      ..minBedrooms = (json['min_bedrooms'] as num?)?.toInt()
      ..manBedrooms = (json['max_bedrooms'] as num?)?.toInt()
      ..minBathrooms = (json['min_bathrooms'] as num?)?.toInt()
      ..maxBathrooms = (json['max_bathrooms'] as num?)?.toInt()
      ..priceList = (json['price_list'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList();

Map<String, dynamic> _$FiltersOptionsModelToJson(
        FiltersOptionsModel instance) =>
    <String, dynamic>{
      'min_bedrooms': instance.minBedrooms,
      'max_bedrooms': instance.manBedrooms,
      'min_bathrooms': instance.minBathrooms,
      'max_bathrooms': instance.maxBathrooms,
      'price_list': instance.priceList,
    };
