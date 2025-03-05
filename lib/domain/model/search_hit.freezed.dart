// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_hit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchHit implements DiagnosticableTreeMixin {
  String get id;
  String get videoId;
  String get title;
  String get description;
  String get published;
  int get timestamp;
  int get views;
  int get likes;
  String get image;
  String get url;

  /// Create a copy of SearchHit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchHitCopyWith<SearchHit> get copyWith =>
      _$SearchHitCopyWithImpl<SearchHit>(this as SearchHit, _$identity);

  /// Serializes this SearchHit to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SearchHit'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('videoId', videoId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('published', published))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('views', views))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchHit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.published, published) ||
                other.published == published) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, videoId, title, description,
      published, timestamp, views, likes, image, url);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchHit(id: $id, videoId: $videoId, title: $title, description: $description, published: $published, timestamp: $timestamp, views: $views, likes: $likes, image: $image, url: $url)';
  }
}

/// @nodoc
abstract mixin class $SearchHitCopyWith<$Res> {
  factory $SearchHitCopyWith(SearchHit value, $Res Function(SearchHit) _then) =
      _$SearchHitCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String videoId,
      String title,
      String description,
      String published,
      int timestamp,
      int views,
      int likes,
      String image,
      String url});
}

/// @nodoc
class _$SearchHitCopyWithImpl<$Res> implements $SearchHitCopyWith<$Res> {
  _$SearchHitCopyWithImpl(this._self, this._then);

  final SearchHit _self;
  final $Res Function(SearchHit) _then;

  /// Create a copy of SearchHit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? videoId = null,
    Object? title = null,
    Object? description = null,
    Object? published = null,
    Object? timestamp = null,
    Object? views = null,
    Object? likes = null,
    Object? image = null,
    Object? url = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      published: null == published
          ? _self.published
          : published // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      views: null == views
          ? _self.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
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
class _SearchHit with DiagnosticableTreeMixin implements SearchHit {
  const _SearchHit(
      {required this.id,
      required this.videoId,
      required this.title,
      required this.description,
      required this.published,
      required this.timestamp,
      required this.views,
      required this.likes,
      required this.image,
      required this.url});
  factory _SearchHit.fromJson(Map<String, dynamic> json) =>
      _$SearchHitFromJson(json);

  @override
  final String id;
  @override
  final String videoId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String published;
  @override
  final int timestamp;
  @override
  final int views;
  @override
  final int likes;
  @override
  final String image;
  @override
  final String url;

  /// Create a copy of SearchHit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchHitCopyWith<_SearchHit> get copyWith =>
      __$SearchHitCopyWithImpl<_SearchHit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SearchHitToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SearchHit'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('videoId', videoId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('published', published))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('views', views))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchHit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.published, published) ||
                other.published == published) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, videoId, title, description,
      published, timestamp, views, likes, image, url);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchHit(id: $id, videoId: $videoId, title: $title, description: $description, published: $published, timestamp: $timestamp, views: $views, likes: $likes, image: $image, url: $url)';
  }
}

/// @nodoc
abstract mixin class _$SearchHitCopyWith<$Res>
    implements $SearchHitCopyWith<$Res> {
  factory _$SearchHitCopyWith(
          _SearchHit value, $Res Function(_SearchHit) _then) =
      __$SearchHitCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String videoId,
      String title,
      String description,
      String published,
      int timestamp,
      int views,
      int likes,
      String image,
      String url});
}

/// @nodoc
class __$SearchHitCopyWithImpl<$Res> implements _$SearchHitCopyWith<$Res> {
  __$SearchHitCopyWithImpl(this._self, this._then);

  final _SearchHit _self;
  final $Res Function(_SearchHit) _then;

  /// Create a copy of SearchHit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? videoId = null,
    Object? title = null,
    Object? description = null,
    Object? published = null,
    Object? timestamp = null,
    Object? views = null,
    Object? likes = null,
    Object? image = null,
    Object? url = null,
  }) {
    return _then(_SearchHit(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      published: null == published
          ? _self.published
          : published // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      views: null == views
          ? _self.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _self.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SearchHitItem implements DiagnosticableTreeMixin {
  SearchHit get searchHit;

  /// Create a copy of SearchHitItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchHitItemCopyWith<SearchHitItem> get copyWith =>
      _$SearchHitItemCopyWithImpl<SearchHitItem>(
          this as SearchHitItem, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SearchHitItem'))
      ..add(DiagnosticsProperty('searchHit', searchHit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchHitItem &&
            (identical(other.searchHit, searchHit) ||
                other.searchHit == searchHit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchHit);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchHitItem(searchHit: $searchHit)';
  }
}

/// @nodoc
abstract mixin class $SearchHitItemCopyWith<$Res> {
  factory $SearchHitItemCopyWith(
          SearchHitItem value, $Res Function(SearchHitItem) _then) =
      _$SearchHitItemCopyWithImpl;
  @useResult
  $Res call({SearchHit searchHit});

  $SearchHitCopyWith<$Res> get searchHit;
}

/// @nodoc
class _$SearchHitItemCopyWithImpl<$Res>
    implements $SearchHitItemCopyWith<$Res> {
  _$SearchHitItemCopyWithImpl(this._self, this._then);

  final SearchHitItem _self;
  final $Res Function(SearchHitItem) _then;

  /// Create a copy of SearchHitItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchHit = null,
  }) {
    return _then(_self.copyWith(
      searchHit: null == searchHit
          ? _self.searchHit
          : searchHit // ignore: cast_nullable_to_non_nullable
              as SearchHit,
    ));
  }

  /// Create a copy of SearchHitItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchHitCopyWith<$Res> get searchHit {
    return $SearchHitCopyWith<$Res>(_self.searchHit, (value) {
      return _then(_self.copyWith(searchHit: value));
    });
  }
}

/// @nodoc

class _SearchHitItem with DiagnosticableTreeMixin implements SearchHitItem {
  const _SearchHitItem({required this.searchHit});

  @override
  final SearchHit searchHit;

  /// Create a copy of SearchHitItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchHitItemCopyWith<_SearchHitItem> get copyWith =>
      __$SearchHitItemCopyWithImpl<_SearchHitItem>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'SearchHitItem'))
      ..add(DiagnosticsProperty('searchHit', searchHit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchHitItem &&
            (identical(other.searchHit, searchHit) ||
                other.searchHit == searchHit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchHit);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchHitItem(searchHit: $searchHit)';
  }
}

/// @nodoc
abstract mixin class _$SearchHitItemCopyWith<$Res>
    implements $SearchHitItemCopyWith<$Res> {
  factory _$SearchHitItemCopyWith(
          _SearchHitItem value, $Res Function(_SearchHitItem) _then) =
      __$SearchHitItemCopyWithImpl;
  @override
  @useResult
  $Res call({SearchHit searchHit});

  @override
  $SearchHitCopyWith<$Res> get searchHit;
}

/// @nodoc
class __$SearchHitItemCopyWithImpl<$Res>
    implements _$SearchHitItemCopyWith<$Res> {
  __$SearchHitItemCopyWithImpl(this._self, this._then);

  final _SearchHitItem _self;
  final $Res Function(_SearchHitItem) _then;

  /// Create a copy of SearchHitItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? searchHit = null,
  }) {
    return _then(_SearchHitItem(
      searchHit: null == searchHit
          ? _self.searchHit
          : searchHit // ignore: cast_nullable_to_non_nullable
              as SearchHit,
    ));
  }

  /// Create a copy of SearchHitItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SearchHitCopyWith<$Res> get searchHit {
    return $SearchHitCopyWith<$Res>(_self.searchHit, (value) {
      return _then(_self.copyWith(searchHit: value));
    });
  }
}

// dart format on
