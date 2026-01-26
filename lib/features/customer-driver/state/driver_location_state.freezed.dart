// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverLocationState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DriverLocationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DriverLocationState()';
  }
}

/// @nodoc
class $DriverLocationStateCopyWith<$Res> {
  $DriverLocationStateCopyWith(
      DriverLocationState _, $Res Function(DriverLocationState) __);
}

/// Adds pattern-matching-related methods to [DriverLocationState].
extension DriverLocationStatePatterns on DriverLocationState {
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
    TResult Function(_Idle value)? idle,
    TResult Function(_Listening value)? listening,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle(_that);
      case _Listening() when listening != null:
        return listening(_that);
      case _Tracking() when tracking != null:
        return tracking(_that);
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
    required TResult Function(_Idle value) idle,
    required TResult Function(_Listening value) listening,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle():
        return idle(_that);
      case _Listening():
        return listening(_that);
      case _Tracking():
        return tracking(_that);
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
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Listening value)? listening,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle(_that);
      case _Listening() when listening != null:
        return listening(_that);
      case _Tracking() when tracking != null:
        return tracking(_that);
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
    TResult Function()? idle,
    TResult Function()? listening,
    TResult Function(LatLng pickupLocation, LatLng dropoffLocation,
            LatLng driverLocation, double progress, DateTime lastUpdate)?
        tracking,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle();
      case _Listening() when listening != null:
        return listening();
      case _Tracking() when tracking != null:
        return tracking(_that.pickupLocation, _that.dropoffLocation,
            _that.driverLocation, _that.progress, _that.lastUpdate);
      case _Error() when error != null:
        return error(_that.message);
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
    required TResult Function() idle,
    required TResult Function() listening,
    required TResult Function(LatLng pickupLocation, LatLng dropoffLocation,
            LatLng driverLocation, double progress, DateTime lastUpdate)
        tracking,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle():
        return idle();
      case _Listening():
        return listening();
      case _Tracking():
        return tracking(_that.pickupLocation, _that.dropoffLocation,
            _that.driverLocation, _that.progress, _that.lastUpdate);
      case _Error():
        return error(_that.message);
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
    TResult? Function()? idle,
    TResult? Function()? listening,
    TResult? Function(LatLng pickupLocation, LatLng dropoffLocation,
            LatLng driverLocation, double progress, DateTime lastUpdate)?
        tracking,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle();
      case _Listening() when listening != null:
        return listening();
      case _Tracking() when tracking != null:
        return tracking(_that.pickupLocation, _that.dropoffLocation,
            _that.driverLocation, _that.progress, _that.lastUpdate);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Idle implements DriverLocationState {
  const _Idle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DriverLocationState.idle()';
  }
}

/// @nodoc

class _Listening implements DriverLocationState {
  const _Listening();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Listening);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DriverLocationState.listening()';
  }
}

/// @nodoc

class _Tracking implements DriverLocationState {
  const _Tracking(
      {required this.pickupLocation,
      required this.dropoffLocation,
      required this.driverLocation,
      required this.progress,
      required this.lastUpdate});

  final LatLng pickupLocation;
  final LatLng dropoffLocation;
  final LatLng driverLocation;
  final double progress;
  final DateTime lastUpdate;

  /// Create a copy of DriverLocationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TrackingCopyWith<_Tracking> get copyWith =>
      __$TrackingCopyWithImpl<_Tracking>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Tracking &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.dropoffLocation, dropoffLocation) ||
                other.dropoffLocation == dropoffLocation) &&
            (identical(other.driverLocation, driverLocation) ||
                other.driverLocation == driverLocation) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pickupLocation, dropoffLocation,
      driverLocation, progress, lastUpdate);

  @override
  String toString() {
    return 'DriverLocationState.tracking(pickupLocation: $pickupLocation, dropoffLocation: $dropoffLocation, driverLocation: $driverLocation, progress: $progress, lastUpdate: $lastUpdate)';
  }
}

/// @nodoc
abstract mixin class _$TrackingCopyWith<$Res>
    implements $DriverLocationStateCopyWith<$Res> {
  factory _$TrackingCopyWith(_Tracking value, $Res Function(_Tracking) _then) =
      __$TrackingCopyWithImpl;
  @useResult
  $Res call(
      {LatLng pickupLocation,
      LatLng dropoffLocation,
      LatLng driverLocation,
      double progress,
      DateTime lastUpdate});
}

/// @nodoc
class __$TrackingCopyWithImpl<$Res> implements _$TrackingCopyWith<$Res> {
  __$TrackingCopyWithImpl(this._self, this._then);

  final _Tracking _self;
  final $Res Function(_Tracking) _then;

  /// Create a copy of DriverLocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pickupLocation = null,
    Object? dropoffLocation = null,
    Object? driverLocation = null,
    Object? progress = null,
    Object? lastUpdate = null,
  }) {
    return _then(_Tracking(
      pickupLocation: null == pickupLocation
          ? _self.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      dropoffLocation: null == dropoffLocation
          ? _self.dropoffLocation
          : dropoffLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      driverLocation: null == driverLocation
          ? _self.driverLocation
          : driverLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      progress: null == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdate: null == lastUpdate
          ? _self.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _Error implements DriverLocationState {
  const _Error({required this.message});

  final String message;

  /// Create a copy of DriverLocationState
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
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DriverLocationState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $DriverLocationStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of DriverLocationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
