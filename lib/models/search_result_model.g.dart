// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultModel _$SearchResultModelFromJson(Map<String, dynamic> json) =>
    SearchResultModel()
      ..values = (json['values'] as List<dynamic>?)
          ?.map((e) => SearchItemModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SearchResultModelToJson(SearchResultModel instance) =>
    <String, dynamic>{
      'values': instance.values,
    };

SearchItemModel _$SearchItemModelFromJson(Map<String, dynamic> json) =>
    SearchItemModel()
      ..id = (json['id'] as num?)?.toInt()
      ..propertyType = json['property_type'] == null
          ? null
          : PropertyTypeModel.fromJson(
              json['property_type'] as Map<String, dynamic>)
      ..compound = json['compound'] == null
          ? null
          : CompoundModel.fromJson(json['compound'] as Map<String, dynamic>)
      ..area = json['area'] == null
          ? null
          : AreasModel.fromJson(json['area'] as Map<String, dynamic>)
      ..image = json['image'] as String?
      ..minUnitArea = (json['min_unit_area'] as num?)?.toInt()
      ..maxUnitArea = (json['max_unit_area'] as num?)?.toInt()
      ..numberOfBathrooms = (json['number_of_bathrooms'] as num?)?.toInt()
      ..numberOfBedrooms = (json['number_of_bedrooms'] as num?)?.toInt()
      ..currency = json['currency'] as String?
      ..minInstallments = (json['min_installments'] as num?)?.toInt()
      ..maxInstallmentYears = (json['max_installment_years'] as num?)?.toInt()
      ..maxPrice = (json['max_price'] as num?)?.toInt()
      ..minReadyBy = json['min_ready_by'] as String?;

Map<String, dynamic> _$SearchItemModelToJson(SearchItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_type': instance.propertyType,
      'compound': instance.compound,
      'area': instance.area,
      'image': instance.image,
      'min_unit_area': instance.minUnitArea,
      'max_unit_area': instance.maxUnitArea,
      'number_of_bathrooms': instance.numberOfBathrooms,
      'number_of_bedrooms': instance.numberOfBedrooms,
      'currency': instance.currency,
      'min_installments': instance.minInstallments,
      'max_installment_years': instance.maxInstallmentYears,
      'max_price': instance.maxPrice,
      'min_ready_by': instance.minReadyBy,
    };

PropertyTypeModel _$PropertyTypeModelFromJson(Map<String, dynamic> json) =>
    PropertyTypeModel()
      ..id = (json['id'] as num?)?.toInt()
      ..name = json['name'] as String?;

Map<String, dynamic> _$PropertyTypeModelToJson(PropertyTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
