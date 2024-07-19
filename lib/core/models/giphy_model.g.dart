// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giphy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiphyModel _$GiphyModelFromJson(Map<String, dynamic> json) => GiphyModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => GifData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GiphyModelToJson(GiphyModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GifData _$GifDataFromJson(Map<String, dynamic> json) => GifData(
      id: json['id'] as String,
      url: json['url'] as String,
      images: Images.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GifDataToJson(GifData instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'images': instance.images,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      fixedWidthSmall: FixedWidthSmall.fromJson(
          json['fixed_width_small'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'fixed_width_small': instance.fixedWidthSmall,
    };

FixedWidthSmall _$FixedWidthSmallFromJson(Map<String, dynamic> json) =>
    FixedWidthSmall(
      url: json['url'] as String,
      width: json['width'] as String,
      height: json['height'] as String,
    );

Map<String, dynamic> _$FixedWidthSmallToJson(FixedWidthSmall instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
