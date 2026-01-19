// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coinbase_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinbaseStatusModel {
  String? get type;
  List<CoinbaseProductStatusModel>? get products;

  /// Create a copy of CoinbaseStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoinbaseStatusModelCopyWith<CoinbaseStatusModel> get copyWith =>
      _$CoinbaseStatusModelCopyWithImpl<CoinbaseStatusModel>(
          this as CoinbaseStatusModel, _$identity);

  /// Serializes this CoinbaseStatusModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoinbaseStatusModel &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.products, products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(products));

  @override
  String toString() {
    return 'CoinbaseStatusModel(type: $type, products: $products)';
  }
}

/// @nodoc
abstract mixin class $CoinbaseStatusModelCopyWith<$Res> {
  factory $CoinbaseStatusModelCopyWith(
          CoinbaseStatusModel value, $Res Function(CoinbaseStatusModel) _then) =
      _$CoinbaseStatusModelCopyWithImpl;
  @useResult
  $Res call({String? type, List<CoinbaseProductStatusModel>? products});
}

/// @nodoc
class _$CoinbaseStatusModelCopyWithImpl<$Res>
    implements $CoinbaseStatusModelCopyWith<$Res> {
  _$CoinbaseStatusModelCopyWithImpl(this._self, this._then);

  final CoinbaseStatusModel _self;
  final $Res Function(CoinbaseStatusModel) _then;

  /// Create a copy of CoinbaseStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? products = freezed,
  }) {
    return _then(_self.copyWith(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _self.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CoinbaseProductStatusModel>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CoinbaseStatusModel].
extension CoinbaseStatusModelPatterns on CoinbaseStatusModel {
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
    TResult Function(_CoinbaseStatusModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoinbaseStatusModel() when $default != null:
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
    TResult Function(_CoinbaseStatusModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoinbaseStatusModel():
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
    TResult? Function(_CoinbaseStatusModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoinbaseStatusModel() when $default != null:
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
    TResult Function(String? type, List<CoinbaseProductStatusModel>? products)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoinbaseStatusModel() when $default != null:
        return $default(_that.type, _that.products);
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
    TResult Function(String? type, List<CoinbaseProductStatusModel>? products)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoinbaseStatusModel():
        return $default(_that.type, _that.products);
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
    TResult? Function(String? type, List<CoinbaseProductStatusModel>? products)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoinbaseStatusModel() when $default != null:
        return $default(_that.type, _that.products);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CoinbaseStatusModel implements CoinbaseStatusModel {
  const _CoinbaseStatusModel(
      {this.type, final List<CoinbaseProductStatusModel>? products = const []})
      : _products = products;
  factory _CoinbaseStatusModel.fromJson(Map<String, dynamic> json) =>
      _$CoinbaseStatusModelFromJson(json);

  @override
  final String? type;
  final List<CoinbaseProductStatusModel>? _products;
  @override
  @JsonKey()
  List<CoinbaseProductStatusModel>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CoinbaseStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoinbaseStatusModelCopyWith<_CoinbaseStatusModel> get copyWith =>
      __$CoinbaseStatusModelCopyWithImpl<_CoinbaseStatusModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CoinbaseStatusModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoinbaseStatusModel &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'CoinbaseStatusModel(type: $type, products: $products)';
  }
}

/// @nodoc
abstract mixin class _$CoinbaseStatusModelCopyWith<$Res>
    implements $CoinbaseStatusModelCopyWith<$Res> {
  factory _$CoinbaseStatusModelCopyWith(_CoinbaseStatusModel value,
          $Res Function(_CoinbaseStatusModel) _then) =
      __$CoinbaseStatusModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? type, List<CoinbaseProductStatusModel>? products});
}

/// @nodoc
class __$CoinbaseStatusModelCopyWithImpl<$Res>
    implements _$CoinbaseStatusModelCopyWith<$Res> {
  __$CoinbaseStatusModelCopyWithImpl(this._self, this._then);

  final _CoinbaseStatusModel _self;
  final $Res Function(_CoinbaseStatusModel) _then;

  /// Create a copy of CoinbaseStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = freezed,
    Object? products = freezed,
  }) {
    return _then(_CoinbaseStatusModel(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      products: freezed == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CoinbaseProductStatusModel>?,
    ));
  }
}

/// @nodoc
mixin _$CoinbaseProductStatusModel {
  String? get id;
  String? get status;
  @JsonKey(name: 'base_currency')
  String? get baseCurrency;
  @JsonKey(name: 'quote_currency')
  String? get quoteCurrency;

  /// Create a copy of CoinbaseProductStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoinbaseProductStatusModelCopyWith<CoinbaseProductStatusModel>
      get copyWith =>
          _$CoinbaseProductStatusModelCopyWithImpl<CoinbaseProductStatusModel>(
              this as CoinbaseProductStatusModel, _$identity);

  /// Serializes this CoinbaseProductStatusModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoinbaseProductStatusModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.baseCurrency, baseCurrency) ||
                other.baseCurrency == baseCurrency) &&
            (identical(other.quoteCurrency, quoteCurrency) ||
                other.quoteCurrency == quoteCurrency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, baseCurrency, quoteCurrency);

  @override
  String toString() {
    return 'CoinbaseProductStatusModel(id: $id, status: $status, baseCurrency: $baseCurrency, quoteCurrency: $quoteCurrency)';
  }
}

/// @nodoc
abstract mixin class $CoinbaseProductStatusModelCopyWith<$Res> {
  factory $CoinbaseProductStatusModelCopyWith(CoinbaseProductStatusModel value,
          $Res Function(CoinbaseProductStatusModel) _then) =
      _$CoinbaseProductStatusModelCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? status,
      @JsonKey(name: 'base_currency') String? baseCurrency,
      @JsonKey(name: 'quote_currency') String? quoteCurrency});
}

/// @nodoc
class _$CoinbaseProductStatusModelCopyWithImpl<$Res>
    implements $CoinbaseProductStatusModelCopyWith<$Res> {
  _$CoinbaseProductStatusModelCopyWithImpl(this._self, this._then);

  final CoinbaseProductStatusModel _self;
  final $Res Function(CoinbaseProductStatusModel) _then;

  /// Create a copy of CoinbaseProductStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? baseCurrency = freezed,
    Object? quoteCurrency = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      baseCurrency: freezed == baseCurrency
          ? _self.baseCurrency
          : baseCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      quoteCurrency: freezed == quoteCurrency
          ? _self.quoteCurrency
          : quoteCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CoinbaseProductStatusModel].
extension CoinbaseProductStatusModelPatterns on CoinbaseProductStatusModel {
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
    TResult Function(_CoinbaseProductStatusModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoinbaseProductStatusModel() when $default != null:
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
    TResult Function(_CoinbaseProductStatusModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoinbaseProductStatusModel():
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
    TResult? Function(_CoinbaseProductStatusModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoinbaseProductStatusModel() when $default != null:
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
            String? id,
            String? status,
            @JsonKey(name: 'base_currency') String? baseCurrency,
            @JsonKey(name: 'quote_currency') String? quoteCurrency)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CoinbaseProductStatusModel() when $default != null:
        return $default(
            _that.id, _that.status, _that.baseCurrency, _that.quoteCurrency);
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
            String? id,
            String? status,
            @JsonKey(name: 'base_currency') String? baseCurrency,
            @JsonKey(name: 'quote_currency') String? quoteCurrency)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoinbaseProductStatusModel():
        return $default(
            _that.id, _that.status, _that.baseCurrency, _that.quoteCurrency);
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
            String? id,
            String? status,
            @JsonKey(name: 'base_currency') String? baseCurrency,
            @JsonKey(name: 'quote_currency') String? quoteCurrency)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CoinbaseProductStatusModel() when $default != null:
        return $default(
            _that.id, _that.status, _that.baseCurrency, _that.quoteCurrency);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CoinbaseProductStatusModel implements CoinbaseProductStatusModel {
  const _CoinbaseProductStatusModel(
      {this.id,
      this.status,
      @JsonKey(name: 'base_currency') this.baseCurrency,
      @JsonKey(name: 'quote_currency') this.quoteCurrency});
  factory _CoinbaseProductStatusModel.fromJson(Map<String, dynamic> json) =>
      _$CoinbaseProductStatusModelFromJson(json);

  @override
  final String? id;
  @override
  final String? status;
  @override
  @JsonKey(name: 'base_currency')
  final String? baseCurrency;
  @override
  @JsonKey(name: 'quote_currency')
  final String? quoteCurrency;

  /// Create a copy of CoinbaseProductStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoinbaseProductStatusModelCopyWith<_CoinbaseProductStatusModel>
      get copyWith => __$CoinbaseProductStatusModelCopyWithImpl<
          _CoinbaseProductStatusModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CoinbaseProductStatusModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoinbaseProductStatusModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.baseCurrency, baseCurrency) ||
                other.baseCurrency == baseCurrency) &&
            (identical(other.quoteCurrency, quoteCurrency) ||
                other.quoteCurrency == quoteCurrency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, baseCurrency, quoteCurrency);

  @override
  String toString() {
    return 'CoinbaseProductStatusModel(id: $id, status: $status, baseCurrency: $baseCurrency, quoteCurrency: $quoteCurrency)';
  }
}

/// @nodoc
abstract mixin class _$CoinbaseProductStatusModelCopyWith<$Res>
    implements $CoinbaseProductStatusModelCopyWith<$Res> {
  factory _$CoinbaseProductStatusModelCopyWith(
          _CoinbaseProductStatusModel value,
          $Res Function(_CoinbaseProductStatusModel) _then) =
      __$CoinbaseProductStatusModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? status,
      @JsonKey(name: 'base_currency') String? baseCurrency,
      @JsonKey(name: 'quote_currency') String? quoteCurrency});
}

/// @nodoc
class __$CoinbaseProductStatusModelCopyWithImpl<$Res>
    implements _$CoinbaseProductStatusModelCopyWith<$Res> {
  __$CoinbaseProductStatusModelCopyWithImpl(this._self, this._then);

  final _CoinbaseProductStatusModel _self;
  final $Res Function(_CoinbaseProductStatusModel) _then;

  /// Create a copy of CoinbaseProductStatusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? baseCurrency = freezed,
    Object? quoteCurrency = freezed,
  }) {
    return _then(_CoinbaseProductStatusModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      baseCurrency: freezed == baseCurrency
          ? _self.baseCurrency
          : baseCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      quoteCurrency: freezed == quoteCurrency
          ? _self.quoteCurrency
          : quoteCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
