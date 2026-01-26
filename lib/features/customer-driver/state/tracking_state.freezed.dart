// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackingState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TrackingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrackingState()';
  }
}

/// @nodoc
class $TrackingStateCopyWith<$Res> {
  $TrackingStateCopyWith(TrackingState _, $Res Function(TrackingState) __);
}

/// Adds pattern-matching-related methods to [TrackingState].
extension TrackingStatePatterns on TrackingState {
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
    TResult Function(_Connecting value)? connecting,
    TResult Function(_Tracking value)? tracking,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Connecting() when connecting != null:
        return connecting(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Connecting value) connecting,
    required TResult Function(_Tracking value) tracking,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Connecting():
        return connecting(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Connecting value)? connecting,
    TResult? Function(_Tracking value)? tracking,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Connecting() when connecting != null:
        return connecting(_that);
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
    TResult Function()? initial,
    TResult Function(
            LatLng pickupLocation, LatLng dropoffLocation, Set<Marker> markers)?
        connecting,
    TResult Function(
            LatLng pickupLocation,
            LatLng dropoffLocation,
            LatLng driverLocation,
            double driverProgress,
            Set<Marker> markers,
            DateTime lastUpdate)?
        tracking,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Connecting() when connecting != null:
        return connecting(
            _that.pickupLocation, _that.dropoffLocation, _that.markers);
      case _Tracking() when tracking != null:
        return tracking(
            _that.pickupLocation,
            _that.dropoffLocation,
            _that.driverLocation,
            _that.driverProgress,
            _that.markers,
            _that.lastUpdate);
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
    required TResult Function() initial,
    required TResult Function(
            LatLng pickupLocation, LatLng dropoffLocation, Set<Marker> markers)
        connecting,
    required TResult Function(
            LatLng pickupLocation,
            LatLng dropoffLocation,
            LatLng driverLocation,
            double driverProgress,
            Set<Marker> markers,
            DateTime lastUpdate)
        tracking,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Connecting():
        return connecting(
            _that.pickupLocation, _that.dropoffLocation, _that.markers);
      case _Tracking():
        return tracking(
            _that.pickupLocation,
            _that.dropoffLocation,
            _that.driverLocation,
            _that.driverProgress,
            _that.markers,
            _that.lastUpdate);
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
    TResult? Function()? initial,
    TResult? Function(
            LatLng pickupLocation, LatLng dropoffLocation, Set<Marker> markers)?
        connecting,
    TResult? Function(
            LatLng pickupLocation,
            LatLng dropoffLocation,
            LatLng driverLocation,
            double driverProgress,
            Set<Marker> markers,
            DateTime lastUpdate)?
        tracking,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Connecting() when connecting != null:
        return connecting(
            _that.pickupLocation, _that.dropoffLocation, _that.markers);
      case _Tracking() when tracking != null:
        return tracking(
            _that.pickupLocation,
            _that.dropoffLocation,
            _that.driverLocation,
            _that.driverProgress,
            _that.markers,
            _that.lastUpdate);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements TrackingState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TrackingState.initial()';
  }
}

/// @nodoc

class _Connecting implements TrackingState {
  const _Connecting(
      {required this.pickupLocation,
      required this.dropoffLocation,
      required final Set<Marker> markers})
      : _markers = markers;

  final LatLng pickupLocation;
  final LatLng dropoffLocation;
  final Set<Marker> _markers;
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  /// Create a copy of TrackingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConnectingCopyWith<_Connecting> get copyWith =>
      __$ConnectingCopyWithImpl<_Connecting>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Connecting &&
            (identical(other.pickupLocation, pickupLocation) ||
                other.pickupLocation == pickupLocation) &&
            (identical(other.dropoffLocation, dropoffLocation) ||
                other.dropoffLocation == dropoffLocation) &&
            const DeepCollectionEquality().equals(other._markers, _markers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pickupLocation, dropoffLocation,
      const DeepCollectionEquality().hash(_markers));

  @override
  String toString() {
    return 'TrackingState.connecting(pickupLocation: $pickupLocation, dropoffLocation: $dropoffLocation, markers: $markers)';
  }
}

/// @nodoc
abstract mixin class _$ConnectingCopyWith<$Res>
    implements $TrackingStateCopyWith<$Res> {
  factory _$ConnectingCopyWith(
          _Connecting value, $Res Function(_Connecting) _then) =
      __$ConnectingCopyWithImpl;
  @useResult
  $Res call(
      {LatLng pickupLocation, LatLng dropoffLocation, Set<Marker> markers});
}

/// @nodoc
class __$ConnectingCopyWithImpl<$Res> implements _$ConnectingCopyWith<$Res> {
  __$ConnectingCopyWithImpl(this._self, this._then);

  final _Connecting _self;
  final $Res Function(_Connecting) _then;

  /// Create a copy of TrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pickupLocation = null,
    Object? dropoffLocation = null,
    Object? markers = null,
  }) {
    return _then(_Connecting(
      pickupLocation: null == pickupLocation
          ? _self.pickupLocation
          : pickupLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      dropoffLocation: null == dropoffLocation
          ? _self.dropoffLocation
          : dropoffLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      markers: null == markers
          ? _self._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
    ));
  }
}

/// @nodoc

class _Tracking implements TrackingState {
  const _Tracking(
      {required this.pickupLocation,
      required this.dropoffLocation,
      required this.driverLocation,
      required this.driverProgress,
      required final Set<Marker> markers,
      required this.lastUpdate})
      : _markers = markers;

  final LatLng pickupLocation;
  final LatLng dropoffLocation;
  final LatLng driverLocation;
  final double driverProgress;
  final Set<Marker> _markers;
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  final DateTime lastUpdate;

  /// Create a copy of TrackingState
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
            (identical(other.driverProgress, driverProgress) ||
                other.driverProgress == driverProgress) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pickupLocation,
      dropoffLocation,
      driverLocation,
      driverProgress,
      const DeepCollectionEquality().hash(_markers),
      lastUpdate);

  @override
  String toString() {
    return 'TrackingState.tracking(pickupLocation: $pickupLocation, dropoffLocation: $dropoffLocation, driverLocation: $driverLocation, driverProgress: $driverProgress, markers: $markers, lastUpdate: $lastUpdate)';
  }
}

/// @nodoc
abstract mixin class _$TrackingCopyWith<$Res>
    implements $TrackingStateCopyWith<$Res> {
  factory _$TrackingCopyWith(_Tracking value, $Res Function(_Tracking) _then) =
      __$TrackingCopyWithImpl;
  @useResult
  $Res call(
      {LatLng pickupLocation,
      LatLng dropoffLocation,
      LatLng driverLocation,
      double driverProgress,
      Set<Marker> markers,
      DateTime lastUpdate});
}

/// @nodoc
class __$TrackingCopyWithImpl<$Res> implements _$TrackingCopyWith<$Res> {
  __$TrackingCopyWithImpl(this._self, this._then);

  final _Tracking _self;
  final $Res Function(_Tracking) _then;

  /// Create a copy of TrackingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pickupLocation = null,
    Object? dropoffLocation = null,
    Object? driverLocation = null,
    Object? driverProgress = null,
    Object? markers = null,
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
      driverProgress: null == driverProgress
          ? _self.driverProgress
          : driverProgress // ignore: cast_nullable_to_non_nullable
              as double,
      markers: null == markers
          ? _self._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      lastUpdate: null == lastUpdate
          ? _self.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _Error implements TrackingState {
  const _Error({required this.message});

  final String message;

  /// Create a copy of TrackingState
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
    return 'TrackingState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $TrackingStateCopyWith<$Res> {
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

  /// Create a copy of TrackingState
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
