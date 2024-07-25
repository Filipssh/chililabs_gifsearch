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
  final String title;
  final String url;
  final GiphyUser? user;
  final Images images;

  GifData({required this.id, required this.title, required this.url, required this.user, required this.images});

  factory GifData.fromJson(Map<String, dynamic> json) => _$GifDataFromJson(json);
  Map<String, dynamic> toJson() => _$GifDataToJson(this);
}

@JsonSerializable()
class Images {
  @JsonKey(name: 'original')
  final ImageData original;

  @JsonKey(name: 'fixed_width_downsampled')
  final ImageData fixedWidthDownsampled;

  Images({required this.original, required this.fixedWidthDownsampled});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class GiphyUser {
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  @JsonKey(name: 'profile_url')
  final String profileUrl;

  final String? username;

  @JsonKey(name: 'display_name')
  final String? displayName;

  GiphyUser({required this.avatarUrl, required this.profileUrl, required this.username, required this.displayName});

  factory GiphyUser.fromJson(Map<String, dynamic> json) => _$GiphyUserFromJson(json);
  Map<String, dynamic> toJson() => _$GiphyUserToJson(this);
}

@JsonSerializable()
class ImageData {
  final String url;
  final String width;
  final String height;

  ImageData({required this.url, required this.width, required this.height});

  factory ImageData.fromJson(Map<String, dynamic> json) => _$ImageDataFromJson(json);
  Map<String, dynamic> toJson() => _$ImageDataToJson(this);
}