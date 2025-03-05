// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StorageImage {
  String get imageId;
  String get url;

  /// Create a copy of StorageImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StorageImageCopyWith<StorageImage> get copyWith =>
      _$StorageImageCopyWithImpl<StorageImage>(
          this as StorageImage, _$identity);

  /// Serializes this StorageImage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StorageImage &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageId, url);

  @override
  String toString() {
    return 'StorageImage(imageId: $imageId, url: $url)';
  }
}

/// @nodoc
abstract mixin class $StorageImageCopyWith<$Res> {
  factory $StorageImageCopyWith(
          StorageImage value, $Res Function(StorageImage) _then) =
      _$StorageImageCopyWithImpl;
  @useResult
  $Res call({String imageId, String url});
}

/// @nodoc
class _$StorageImageCopyWithImpl<$Res> implements $StorageImageCopyWith<$Res> {
  _$StorageImageCopyWithImpl(this._self, this._then);

  final StorageImage _self;
  final $Res Function(StorageImage) _then;

  /// Create a copy of StorageImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? url = null,
  }) {
    return _then(_self.copyWith(
      imageId: null == imageId
          ? _self.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _StorageImage implements StorageImage {
  const _StorageImage({required this.imageId, required this.url});
  factory _StorageImage.fromJson(Map<String, dynamic> json) =>
      _$StorageImageFromJson(json);

  @override
  final String imageId;
  @override
  final String url;

  /// Create a copy of StorageImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StorageImageCopyWith<_StorageImage> get copyWith =>
      __$StorageImageCopyWithImpl<_StorageImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StorageImageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StorageImage &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageId, url);

  @override
  String toString() {
    return 'StorageImage(imageId: $imageId, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$StorageImageCopyWith<$Res>
    implements $StorageImageCopyWith<$Res> {
  factory _$StorageImageCopyWith(
          _StorageImage value, $Res Function(_StorageImage) _then) =
      __$StorageImageCopyWithImpl;
  @override
  @useResult
  $Res call({String imageId, String url});
}

/// @nodoc
class __$StorageImageCopyWithImpl<$Res>
    implements _$StorageImageCopyWith<$Res> {
  __$StorageImageCopyWithImpl(this._self, this._then);

  final _StorageImage _self;
  final $Res Function(_StorageImage) _then;

  /// Create a copy of StorageImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageId = null,
    Object? url = null,
  }) {
    return _then(_StorageImage(
      imageId: null == imageId
          ? _self.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
