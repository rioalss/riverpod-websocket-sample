// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coinbase_ticker_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinbaseTickerModel {
  String? get type;
  @JsonKey(name: 'product_id')
  String? get productId;
  String? get price;
  @JsonKey(name: 'volume_24h')
  String? get volume24h;
  @JsonKey(name: 'best_bid')
  String? get bestBid;
  @JsonKey(name: 'best_ask')
  String? get bestAsk;
  String? get time;

  /// Create a copy of CoinbaseTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoinbaseTickerModelCopyWith<CoinbaseTickerModel> get copyWith =>
      _$CoinbaseTickerModelCopyWithImpl<CoinbaseTickerModel>(
          this as CoinbaseTickerModel, _$identity);

  /// Serializes this CoinbaseTickerModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoinbaseTickerModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.volume24h, volume24h) ||
                other.volume24h == volume24h) &&
            (identical(other.bestBid, bestBid) || other.bestBid == bestBid) &&
            (identical(other.bestAsk, bestAsk) || other.bestAsk == bestAsk) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, productId, price, volume24h, bestBid, bestAsk, time);

  @override
  String toString() {
    return 'CoinbaseTickerModel(type: $type, productId: $productId, price: $price, volume24h: $volume24h, bestBid: $bestBid, bestAsk: $bestAsk, time: $time)';
  }
}

/// @nodoc
abstract mixin class $CoinbaseTickerModelCopyWith<$Res> {
  factory $CoinbaseTickerModelCopyWith(
          CoinbaseTickerModel value, $Res Function(CoinbaseTickerModel) _then) =
      _$CoinbaseTickerModelCopyWithImpl;
  @useResult
  $Res call(
      {String? type,
      @JsonKey(name: 'product_id') String? productId,
      String? price,
      @JsonKey(name: 'volume_24h') String? volume24h,
      @JsonKey(name: 'best_bid') String? bestBid,
      @JsonKey(name: 'best_ask') String? bestAsk,
      String? time});
}

/// @nodoc
class _$CoinbaseTickerModelCopyWithImpl<$Res>
    implements $CoinbaseTickerModelCopyWith<$Res> {
  _$CoinbaseTickerModelCopyWithImpl(this._self, this._then);

  final CoinbaseTickerModel _self;
  final $Res Function(CoinbaseTickerModel) _then;

  /// Create a copy of CoinbaseTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? productId = freezed,
    Object? price = freezed,
    Object? volume24h = freezed,
    Object? bestBid = freezed,
    Object? bestAsk = freezed,
    Object? time = freezed,
  }) {
    return _then(_self.copyWith(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      volume24h: freezed == volume24h
          ? _self.volume24h
          : volume24h // ignore: cast_nullable_to_non_nullable
              as String?,
      bestBid: freezed == bestBid
          ? _self.bestBid
          : bestBid // ignore: cast_nullable_to_non_nullable
              as String?,
      bestAsk: freezed == bestAsk
          ? _self.bestAsk
          : bestAsk // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CoinbaseTickerModel].
extension CoinbaseTickerModelPatterns on CoinbaseTickerModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CoinbaseTickerModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoinbaseTickerModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CoinbaseTickerModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoinbaseTickerModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CoinbaseTickerModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoinbaseTickerModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? type,
            @JsonKey(name: 'product_id') String? productId,
            String? price,
            @JsonKey(name: 'volume_24h') String? volume24h,
            @JsonKey(name: 'best_bid') String? bestBid,
            @JsonKey(name: 'best_ask') String? bestAsk,
            String? time)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoinbaseTickerModel() when $default != null:
        return $default(_that.type, _that.productId, _that.price,
            _that.volume24h, _that.bestBid, _that.bestAsk, _that.time);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? type,
            @JsonKey(name: 'product_id') String? productId,
            String? price,
            @JsonKey(name: 'volume_24h') String? volume24h,
            @JsonKey(name: 'best_bid') String? bestBid,
            @JsonKey(name: 'best_ask') String? bestAsk,
            String? time)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoinbaseTickerModel():
        return $default(_that.type, _that.productId, _that.price,
            _that.volume24h, _that.bestBid, _that.bestAsk, _that.time);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? type,
            @JsonKey(name: 'product_id') String? productId,
            String? price,
            @JsonKey(name: 'volume_24h') String? volume24h,
            @JsonKey(name: 'best_bid') String? bestBid,
            @JsonKey(name: 'best_ask') String? bestAsk,
            String? time)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoinbaseTickerModel() when $default != null:
        return $default(_that.type, _that.productId, _that.price,
            _that.volume24h, _that.bestBid, _that.bestAsk, _that.time);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CoinbaseTickerModel implements CoinbaseTickerModel {
  const _CoinbaseTickerModel(
      {this.type,
      @JsonKey(name: 'product_id') this.productId,
      this.price,
      @JsonKey(name: 'volume_24h') this.volume24h,
      @JsonKey(name: 'best_bid') this.bestBid,
      @JsonKey(name: 'best_ask') this.bestAsk,
      this.time});
  factory _CoinbaseTickerModel.fromJson(Map<String, dynamic> json) =>
      _$CoinbaseTickerModelFromJson(json);

  @override
  final String? type;
  @override
  @JsonKey(name: 'product_id')
  final String? productId;
  @override
  final String? price;
  @override
  @JsonKey(name: 'volume_24h')
  final String? volume24h;
  @override
  @JsonKey(name: 'best_bid')
  final String? bestBid;
  @override
  @JsonKey(name: 'best_ask')
  final String? bestAsk;
  @override
  final String? time;

  /// Create a copy of CoinbaseTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoinbaseTickerModelCopyWith<_CoinbaseTickerModel> get copyWith =>
      __$CoinbaseTickerModelCopyWithImpl<_CoinbaseTickerModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CoinbaseTickerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoinbaseTickerModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.volume24h, volume24h) ||
                other.volume24h == volume24h) &&
            (identical(other.bestBid, bestBid) || other.bestBid == bestBid) &&
            (identical(other.bestAsk, bestAsk) || other.bestAsk == bestAsk) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, productId, price, volume24h, bestBid, bestAsk, time);

  @override
  String toString() {
    return 'CoinbaseTickerModel(type: $type, productId: $productId, price: $price, volume24h: $volume24h, bestBid: $bestBid, bestAsk: $bestAsk, time: $time)';
  }
}

/// @nodoc
abstract mixin class _$CoinbaseTickerModelCopyWith<$Res>
    implements $CoinbaseTickerModelCopyWith<$Res> {
  factory _$CoinbaseTickerModelCopyWith(_CoinbaseTickerModel value,
          $Res Function(_CoinbaseTickerModel) _then) =
      __$CoinbaseTickerModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? type,
      @JsonKey(name: 'product_id') String? productId,
      String? price,
      @JsonKey(name: 'volume_24h') String? volume24h,
      @JsonKey(name: 'best_bid') String? bestBid,
      @JsonKey(name: 'best_ask') String? bestAsk,
      String? time});
}

/// @nodoc
class __$CoinbaseTickerModelCopyWithImpl<$Res>
    implements _$CoinbaseTickerModelCopyWith<$Res> {
  __$CoinbaseTickerModelCopyWithImpl(this._self, this._then);

  final _CoinbaseTickerModel _self;
  final $Res Function(_CoinbaseTickerModel) _then;

  /// Create a copy of CoinbaseTickerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = freezed,
    Object? productId = freezed,
    Object? price = freezed,
    Object? volume24h = freezed,
    Object? bestBid = freezed,
    Object? bestAsk = freezed,
    Object? time = freezed,
  }) {
    return _then(_CoinbaseTickerModel(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      volume24h: freezed == volume24h
          ? _self.volume24h
          : volume24h // ignore: cast_nullable_to_non_nullable
              as String?,
      bestBid: freezed == bestBid
          ? _self.bestBid
          : bestBid // ignore: cast_nullable_to_non_nullable
              as String?,
      bestAsk: freezed == bestAsk
          ? _self.bestAsk
          : bestAsk // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
