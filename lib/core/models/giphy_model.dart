import 'package:json_annotation/json_annotation.dart';

part 'giphy_model.g.dart';

@JsonSerializable()
class GiphyModel {
  final List<GifData> data;

  GiphyModel({required this.data});

  factory GiphyModel.fromJson(Map<String, dynamic> json) => _$GiphyModelFromJson(json);
  Map<String, dynamic> toJson() => _$GiphyModelToJson(this);
}

@JsonSerializable()
class GifData {
  final String id;
  final String url;
  final Images images;

  GifData({required this.id, required this.url, required this.images});

  factory GifData.fromJson(Map<String, dynamic> json) => _$GifDataFromJson(json);
  Map<String, dynamic> toJson() => _$GifDataToJson(this);
}

@JsonSerializable()
class Images {
  @JsonKey(name: 'fixed_width_small')
  final FixedWidthSmall fixedWidthSmall;

  Images({required this.fixedWidthSmall});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class FixedWidthSmall {
  final String url;
  final String width;
  final String height;

  FixedWidthSmall({required this.url, required this.width, required this.height});

  factory FixedWidthSmall.fromJson(Map<String, dynamic> json) => _$FixedWidthSmallFromJson(json);
  Map<String, dynamic> toJson() => _$FixedWidthSmallToJson(this);
}