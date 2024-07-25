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
      title: json['title'] as String,
      url: json['url'] as String,
      user: json['user'] == null
          ? null
          : GiphyUser.fromJson(json['user'] as Map<String, dynamic>),
      images: Images.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GifDataToJson(GifData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'user': instance.user,
      'images': instance.images,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      original: ImageData.fromJson(json['original'] as Map<String, dynamic>),
      fixedWidthDownsampled: ImageData.fromJson(
          json['fixed_width_downsampled'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'original': instance.original,
      'fixed_width_downsampled': instance.fixedWidthDownsampled,
    };

GiphyUser _$GiphyUserFromJson(Map<String, dynamic> json) => GiphyUser(
      avatarUrl: json['avatar_url'] as String,
      profileUrl: json['profile_url'] as String,
      username: json['username'] as String?,
      displayName: json['display_name'] as String?,
    );

Map<String, dynamic> _$GiphyUserToJson(GiphyUser instance) => <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'profile_url': instance.profileUrl,
      'username': instance.username,
      'display_name': instance.displayName,
    };

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
      url: json['url'] as String,
      width: json['width'] as String,
      height: json['height'] as String,
    );

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
