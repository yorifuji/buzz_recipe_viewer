// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StorageImage _$StorageImageFromJson(Map<String, dynamic> json) {
  return _StorageImage.fromJson(json);
}

/// @nodoc
mixin _$StorageImage {
  String get imageId => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this StorageImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StorageImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StorageImageCopyWith<StorageImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageImageCopyWith<$Res> {
  factory $StorageImageCopyWith(
          StorageImage value, $Res Function(StorageImage) then) =
      _$StorageImageCopyWithImpl<$Res, StorageImage>;
  @useResult
  $Res call({String imageId, String url});
}

/// @nodoc
class _$StorageImageCopyWithImpl<$Res, $Val extends StorageImage>
    implements $StorageImageCopyWith<$Res> {
  _$StorageImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StorageImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StorageImageImplCopyWith<$Res>
    implements $StorageImageCopyWith<$Res> {
  factory _$$StorageImageImplCopyWith(
          _$StorageImageImpl value, $Res Function(_$StorageImageImpl) then) =
      __$$StorageImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imageId, String url});
}

/// @nodoc
class __$$StorageImageImplCopyWithImpl<$Res>
    extends _$StorageImageCopyWithImpl<$Res, _$StorageImageImpl>
    implements _$$StorageImageImplCopyWith<$Res> {
  __$$StorageImageImplCopyWithImpl(
      _$StorageImageImpl _value, $Res Function(_$StorageImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of StorageImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageId = null,
    Object? url = null,
  }) {
    return _then(_$StorageImageImpl(
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StorageImageImpl implements _StorageImage {
  const _$StorageImageImpl({required this.imageId, required this.url});

  factory _$StorageImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageImageImplFromJson(json);

  @override
  final String imageId;
  @override
  final String url;

  @override
  String toString() {
    return 'StorageImage(imageId: $imageId, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageImageImpl &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageId, url);

  /// Create a copy of StorageImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageImageImplCopyWith<_$StorageImageImpl> get copyWith =>
      __$$StorageImageImplCopyWithImpl<_$StorageImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageImageImplToJson(
      this,
    );
  }
}

abstract class _StorageImage implements StorageImage {
  const factory _StorageImage(
      {required final String imageId,
      required final String url}) = _$StorageImageImpl;

  factory _StorageImage.fromJson(Map<String, dynamic> json) =
      _$StorageImageImpl.fromJson;

  @override
  String get imageId;
  @override
  String get url;

  /// Create a copy of StorageImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StorageImageImplCopyWith<_$StorageImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
