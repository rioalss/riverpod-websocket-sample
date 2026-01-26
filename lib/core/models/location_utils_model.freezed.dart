// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_utils_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationUtilsModel {
  double? get lat;
  double? get lng;
  double? get accuracy;
  double? get altitude;
  double? get speed;
  int? get timestamp;
  String? get address;

  /// Create a copy of LocationUtilsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationUtilsModelCopyWith<LocationUtilsModel> get copyWith =>
      _$LocationUtilsModelCopyWithImpl<LocationUtilsModel>(
          this as LocationUtilsModel, _$identity);

  /// Serializes this LocationUtilsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationUtilsModel &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, lat, lng, accuracy, altitude, speed, timestamp, address);

  @override
  String toString() {
    return 'LocationUtilsModel(lat: $lat, lng: $lng, accuracy: $accuracy, altitude: $altitude, speed: $speed, timestamp: $timestamp, address: $address)';
  }
}

/// @nodoc
abstract mixin class $LocationUtilsModelCopyWith<$Res> {
  factory $LocationUtilsModelCopyWith(
          LocationUtilsModel value, $Res Function(LocationUtilsModel) _then) =
      _$LocationUtilsModelCopyWithImpl;
  @useResult
  $Res call(
      {double? lat,
      double? lng,
      double? accuracy,
      double? altitude,
      double? speed,
      int? timestamp,
      String? address});
}

/// @nodoc
class _$LocationUtilsModelCopyWithImpl<$Res>
    implements $LocationUtilsModelCopyWith<$Res> {
  _$LocationUtilsModelCopyWithImpl(this._self, this._then);

  final LocationUtilsModel _self;
  final $Res Function(LocationUtilsModel) _then;

  /// Create a copy of LocationUtilsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
    Object? accuracy = freezed,
    Object? altitude = freezed,
    Object? speed = freezed,
    Object? timestamp = freezed,
    Object? address = freezed,
  }) {
    return _then(_self.copyWith(
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      altitude: freezed == altitude
          ? _self.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: freezed == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [LocationUtilsModel].
extension LocationUtilsModelPatterns on LocationUtilsModel {
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
    TResult Function(_LocationUtilsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationUtilsModel() when $default != null:
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
    TResult Function(_LocationUtilsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationUtilsModel():
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
    TResult? Function(_LocationUtilsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationUtilsModel() when $default != null:
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
    TResult Function(double? lat, double? lng, double? accuracy,
            double? altitude, double? speed, int? timestamp, String? address)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationUtilsModel() when $default != null:
        return $default(_that.lat, _that.lng, _that.accuracy, _that.altitude,
            _that.speed, _that.timestamp, _that.address);
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
    TResult Function(double? lat, double? lng, double? accuracy,
            double? altitude, double? speed, int? timestamp, String? address)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationUtilsModel():
        return $default(_that.lat, _that.lng, _that.accuracy, _that.altitude,
            _that.speed, _that.timestamp, _that.address);
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
    TResult? Function(double? lat, double? lng, double? accuracy,
            double? altitude, double? speed, int? timestamp, String? address)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationUtilsModel() when $default != null:
        return $default(_that.lat, _that.lng, _that.accuracy, _that.altitude,
            _that.speed, _that.timestamp, _that.address);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocationUtilsModel implements LocationUtilsModel {
  const _LocationUtilsModel(
      {this.lat,
      this.lng,
      this.accuracy,
      this.altitude,
      this.speed,
      this.timestamp,
      this.address});
  factory _LocationUtilsModel.fromJson(Map<String, dynamic> json) =>
      _$LocationUtilsModelFromJson(json);

  @override
  final double? lat;
  @override
  final double? lng;
  @override
  final double? accuracy;
  @override
  final double? altitude;
  @override
  final double? speed;
  @override
  final int? timestamp;
  @override
  final String? address;

  /// Create a copy of LocationUtilsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationUtilsModelCopyWith<_LocationUtilsModel> get copyWith =>
      __$LocationUtilsModelCopyWithImpl<_LocationUtilsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationUtilsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationUtilsModel &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.altitude, altitude) ||
                other.altitude == altitude) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, lat, lng, accuracy, altitude, speed, timestamp, address);

  @override
  String toString() {
    return 'LocationUtilsModel(lat: $lat, lng: $lng, accuracy: $accuracy, altitude: $altitude, speed: $speed, timestamp: $timestamp, address: $address)';
  }
}

/// @nodoc
abstract mixin class _$LocationUtilsModelCopyWith<$Res>
    implements $LocationUtilsModelCopyWith<$Res> {
  factory _$LocationUtilsModelCopyWith(
          _LocationUtilsModel value, $Res Function(_LocationUtilsModel) _then) =
      __$LocationUtilsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double? lat,
      double? lng,
      double? accuracy,
      double? altitude,
      double? speed,
      int? timestamp,
      String? address});
}

/// @nodoc
class __$LocationUtilsModelCopyWithImpl<$Res>
    implements _$LocationUtilsModelCopyWith<$Res> {
  __$LocationUtilsModelCopyWithImpl(this._self, this._then);

  final _LocationUtilsModel _self;
  final $Res Function(_LocationUtilsModel) _then;

  /// Create a copy of LocationUtilsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
    Object? accuracy = freezed,
    Object? altitude = freezed,
    Object? speed = freezed,
    Object? timestamp = freezed,
    Object? address = freezed,
  }) {
    return _then(_LocationUtilsModel(
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      altitude: freezed == altitude
          ? _self.altitude
          : altitude // ignore: cast_nullable_to_non_nullable
              as double?,
      speed: freezed == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
