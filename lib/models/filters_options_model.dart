import 'package:json_annotation/json_annotation.dart';

part 'filters_options_model.g.dart';

@JsonSerializable()
class FiltersOptionsModel {
  @JsonKey(name: 'min_bedrooms')
  int? minBedrooms;
  @JsonKey(name: 'max_bedrooms')
  int? manBedrooms;
  @JsonKey(name: 'min_bathrooms')
  int? minBathrooms;
  @JsonKey(name: 'max_bathrooms')
  int? maxBathrooms;
  @JsonKey(name: 'price_list')
  List<int>? priceList;

  FiltersOptionsModel();

  factory FiltersOptionsModel.fromJson(Map<String, dynamic> json) =>
      _$FiltersOptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FiltersOptionsModelToJson(this);
}
