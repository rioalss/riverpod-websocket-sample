// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coinbase_ticker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinbaseTickerState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CoinbaseTickerState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CoinbaseTickerState()';
  }
}

/// @nodoc
class $CoinbaseTickerStateCopyWith<$Res> {
  $CoinbaseTickerStateCopyWith(
      CoinbaseTickerState _, $Res Function(CoinbaseTickerState) __);
}

/// Adds pattern-matching-related methods to [CoinbaseTickerState].
extension CoinbaseTickerStatePatterns on CoinbaseTickerState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Data value)? data,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Data() when data != null:
        return data(_that);
      case _Error() when error != null:
        return error(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Data value) data,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Data():
        return data(_that);
      case _Error():
        return error(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Data value)? data,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Data() when data != null:
        return data(_that);
      case _Error() when error != null:
        return error(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String productId)? initial,
    TResult Function()? loading,
    TResult Function(CoinbaseTickerEntity ticker, DateTime lastUpdated)? data,
    TResult Function(String message, CoinbaseTickerEntity? cachedTicker)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.productId);
      case _Loading() when loading != null:
        return loading();
      case _Data() when data != null:
        return data(_that.ticker, _that.lastUpdated);
      case _Error() when error != null:
        return error(_that.message, _that.cachedTicker);
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
  TResult when<TResult extends Object?>({
    required TResult Function(String productId) initial,
    required TResult Function() loading,
    required TResult Function(CoinbaseTickerEntity ticker, DateTime lastUpdated)
        data,
    required TResult Function(
            String message, CoinbaseTickerEntity? cachedTicker)
        error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that.productId);
      case _Loading():
        return loading();
      case _Data():
        return data(_that.ticker, _that.lastUpdated);
      case _Error():
        return error(_that.message, _that.cachedTicker);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String productId)? initial,
    TResult? Function()? loading,
    TResult? Function(CoinbaseTickerEntity ticker, DateTime lastUpdated)? data,
    TResult? Function(String message, CoinbaseTickerEntity? cachedTicker)?
        error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.productId);
      case _Loading() when loading != null:
        return loading();
      case _Data() when data != null:
        return data(_that.ticker, _that.lastUpdated);
      case _Error() when error != null:
        return error(_that.message, _that.cachedTicker);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements CoinbaseTickerState {
  const _Initial(this.productId);

  final String productId;

  /// Create a copy of CoinbaseTickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @override
  String toString() {
    return 'CoinbaseTickerState.initial(productId: $productId)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $CoinbaseTickerStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of CoinbaseTickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? productId = null,
  }) {
    return _then(_Initial(
      null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Loading implements CoinbaseTickerState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CoinbaseTickerState.loading()';
  }
}

/// @nodoc

class _Data implements CoinbaseTickerState {
  const _Data({required this.ticker, required this.lastUpdated});

  final CoinbaseTickerEntity ticker;
  final DateTime lastUpdated;

  /// Create a copy of CoinbaseTickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticker, lastUpdated);

  @override
  String toString() {
    return 'CoinbaseTickerState.data(ticker: $ticker, lastUpdated: $lastUpdated)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res>
    implements $CoinbaseTickerStateCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @useResult
  $Res call({CoinbaseTickerEntity ticker, DateTime lastUpdated});
}

/// @nodoc
class __$DataCopyWithImpl<$Res> implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

  /// Create a copy of CoinbaseTickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ticker = null,
    Object? lastUpdated = null,
  }) {
    return _then(_Data(
      ticker: null == ticker
          ? _self.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as CoinbaseTickerEntity,
      lastUpdated: null == lastUpdated
          ? _self.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _Error implements CoinbaseTickerState {
  const _Error({required this.message, this.cachedTicker});

  final String message;
  final CoinbaseTickerEntity? cachedTicker;

  /// Create a copy of CoinbaseTickerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.cachedTicker, cachedTicker) ||
                other.cachedTicker == cachedTicker));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, cachedTicker);

  @override
  String toString() {
    return 'CoinbaseTickerState.error(message: $message, cachedTicker: $cachedTicker)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $CoinbaseTickerStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message, CoinbaseTickerEntity? cachedTicker});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of CoinbaseTickerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? cachedTicker = freezed,
  }) {
    return _then(_Error(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      cachedTicker: freezed == cachedTicker
          ? _self.cachedTicker
          : cachedTicker // ignore: cast_nullable_to_non_nullable
              as CoinbaseTickerEntity?,
    ));
  }
}

// dart format on
