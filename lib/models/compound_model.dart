import 'package:json_annotation/json_annotation.dart';

part 'compound_model.g.dart';

@JsonSerializable()
class CompoundModel {
  int? id;
  @JsonKey(name: 'area_id')
  int? areaId;
  String? name;
  @JsonKey(name: 'image_path')
  String? imagePath;

  CompoundModel();

  factory CompoundModel.fromJson(Map<String, dynamic> json) =>
      _$CompoundModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompoundModelToJson(this);
}
