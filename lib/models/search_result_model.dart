import 'package:json_annotation/json_annotation.dart';
import 'package:nawy_task/models/areas_model.dart';
import 'package:nawy_task/models/compound_model.dart';

part 'search_result_model.g.dart';

@JsonSerializable()
class SearchResultModel {
  List<SearchItemModel>? values;

  SearchResultModel();

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultModelToJson(this);
}


@JsonSerializable()
class SearchItemModel {
  int? id;
  @JsonKey(name: 'property_type')
  PropertyTypeModel? propertyType;
  CompoundModel? compound;
  AreasModel? area;
  String? image;
  @JsonKey(name: 'min_unit_area')
  int? minUnitArea;
  @JsonKey(name: 'max_unit_area')
  int? maxUnitArea;
  @JsonKey(name: 'number_of_bathrooms')
  int? numberOfBathrooms;
  @JsonKey(name: 'number_of_bedrooms')
  int? numberOfBedrooms;
  String? currency;
  @JsonKey(name: 'min_installments')
  int? minInstallments;
  @JsonKey(name: 'max_installment_years')
  int? maxInstallmentYears;
  @JsonKey(name: 'max_price')
  int? maxPrice;
  @JsonKey(name: 'min_ready_by')
  String? minReadyBy;

  SearchItemModel();

  factory SearchItemModel.fromJson(Map<String, dynamic> json) =>
      _$SearchItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchItemModelToJson(this);
}

@JsonSerializable()
class PropertyTypeModel {
  int? id;
  String? name;

  PropertyTypeModel();

  factory PropertyTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyTypeModelToJson(this);
}
