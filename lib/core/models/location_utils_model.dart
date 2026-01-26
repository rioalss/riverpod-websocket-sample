import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_utils_model.freezed.dart';
part 'location_utils_model.g.dart';

@freezed
abstract class LocationUtilsModel with _$LocationUtilsModel {
  const factory LocationUtilsModel({
    double? lat,
    double? lng,
    double? accuracy,
    double? altitude,
    double? speed,
    int? timestamp,
    String? address,
  }) = _LocationUtilsModel;

  factory LocationUtilsModel.fromJson(Map<String, dynamic> json) =>
      _$LocationUtilsModelFromJson(json);
}
