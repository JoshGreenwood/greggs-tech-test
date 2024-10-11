// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return _ProductResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductResponse {
  String get articleName => throw _privateConstructorUsedError;
  String get customerDescription => throw _privateConstructorUsedError;
  @DecimalResponseConverter()
  Decimal get eatOutPrice => throw _privateConstructorUsedError;
  String get thumbnailUri => throw _privateConstructorUsedError;
  String get imageUri => throw _privateConstructorUsedError;

  /// Serializes this ProductResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductResponseCopyWith<ProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductResponseCopyWith<$Res> {
  factory $ProductResponseCopyWith(
          ProductResponse value, $Res Function(ProductResponse) then) =
      _$ProductResponseCopyWithImpl<$Res, ProductResponse>;
  @useResult
  $Res call(
      {String articleName,
      String customerDescription,
      @DecimalResponseConverter() Decimal eatOutPrice,
      String thumbnailUri,
      String imageUri});
}

/// @nodoc
class _$ProductResponseCopyWithImpl<$Res, $Val extends ProductResponse>
    implements $ProductResponseCopyWith<$Res> {
  _$ProductResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleName = null,
    Object? customerDescription = null,
    Object? eatOutPrice = null,
    Object? thumbnailUri = null,
    Object? imageUri = null,
  }) {
    return _then(_value.copyWith(
      articleName: null == articleName
          ? _value.articleName
          : articleName // ignore: cast_nullable_to_non_nullable
              as String,
      customerDescription: null == customerDescription
          ? _value.customerDescription
          : customerDescription // ignore: cast_nullable_to_non_nullable
              as String,
      eatOutPrice: null == eatOutPrice
          ? _value.eatOutPrice
          : eatOutPrice // ignore: cast_nullable_to_non_nullable
              as Decimal,
      thumbnailUri: null == thumbnailUri
          ? _value.thumbnailUri
          : thumbnailUri // ignore: cast_nullable_to_non_nullable
              as String,
      imageUri: null == imageUri
          ? _value.imageUri
          : imageUri // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductResponseImplCopyWith<$Res>
    implements $ProductResponseCopyWith<$Res> {
  factory _$$ProductResponseImplCopyWith(_$ProductResponseImpl value,
          $Res Function(_$ProductResponseImpl) then) =
      __$$ProductResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String articleName,
      String customerDescription,
      @DecimalResponseConverter() Decimal eatOutPrice,
      String thumbnailUri,
      String imageUri});
}

/// @nodoc
class __$$ProductResponseImplCopyWithImpl<$Res>
    extends _$ProductResponseCopyWithImpl<$Res, _$ProductResponseImpl>
    implements _$$ProductResponseImplCopyWith<$Res> {
  __$$ProductResponseImplCopyWithImpl(
      _$ProductResponseImpl _value, $Res Function(_$ProductResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articleName = null,
    Object? customerDescription = null,
    Object? eatOutPrice = null,
    Object? thumbnailUri = null,
    Object? imageUri = null,
  }) {
    return _then(_$ProductResponseImpl(
      articleName: null == articleName
          ? _value.articleName
          : articleName // ignore: cast_nullable_to_non_nullable
              as String,
      customerDescription: null == customerDescription
          ? _value.customerDescription
          : customerDescription // ignore: cast_nullable_to_non_nullable
              as String,
      eatOutPrice: null == eatOutPrice
          ? _value.eatOutPrice
          : eatOutPrice // ignore: cast_nullable_to_non_nullable
              as Decimal,
      thumbnailUri: null == thumbnailUri
          ? _value.thumbnailUri
          : thumbnailUri // ignore: cast_nullable_to_non_nullable
              as String,
      imageUri: null == imageUri
          ? _value.imageUri
          : imageUri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductResponseImpl implements _ProductResponse {
  const _$ProductResponseImpl(
      {required this.articleName,
      required this.customerDescription,
      @DecimalResponseConverter() required this.eatOutPrice,
      required this.thumbnailUri,
      required this.imageUri});

  factory _$ProductResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductResponseImplFromJson(json);

  @override
  final String articleName;
  @override
  final String customerDescription;
  @override
  @DecimalResponseConverter()
  final Decimal eatOutPrice;
  @override
  final String thumbnailUri;
  @override
  final String imageUri;

  @override
  String toString() {
    return 'ProductResponse(articleName: $articleName, customerDescription: $customerDescription, eatOutPrice: $eatOutPrice, thumbnailUri: $thumbnailUri, imageUri: $imageUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductResponseImpl &&
            (identical(other.articleName, articleName) ||
                other.articleName == articleName) &&
            (identical(other.customerDescription, customerDescription) ||
                other.customerDescription == customerDescription) &&
            (identical(other.eatOutPrice, eatOutPrice) ||
                other.eatOutPrice == eatOutPrice) &&
            (identical(other.thumbnailUri, thumbnailUri) ||
                other.thumbnailUri == thumbnailUri) &&
            (identical(other.imageUri, imageUri) ||
                other.imageUri == imageUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, articleName, customerDescription,
      eatOutPrice, thumbnailUri, imageUri);

  /// Create a copy of ProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductResponseImplCopyWith<_$ProductResponseImpl> get copyWith =>
      __$$ProductResponseImplCopyWithImpl<_$ProductResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductResponseImplToJson(
      this,
    );
  }
}

abstract class _ProductResponse implements ProductResponse {
  const factory _ProductResponse(
      {required final String articleName,
      required final String customerDescription,
      @DecimalResponseConverter() required final Decimal eatOutPrice,
      required final String thumbnailUri,
      required final String imageUri}) = _$ProductResponseImpl;

  factory _ProductResponse.fromJson(Map<String, dynamic> json) =
      _$ProductResponseImpl.fromJson;

  @override
  String get articleName;
  @override
  String get customerDescription;
  @override
  @DecimalResponseConverter()
  Decimal get eatOutPrice;
  @override
  String get thumbnailUri;
  @override
  String get imageUri;

  /// Create a copy of ProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductResponseImplCopyWith<_$ProductResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
