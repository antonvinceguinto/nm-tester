// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_permissions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPermissionsModel _$UserPermissionsModelFromJson(Map<String, dynamic> json) {
  return _UserPermissionsModel.fromJson(json);
}

/// @nodoc
mixin _$UserPermissionsModel {
  String? get username => throw _privateConstructorUsedError;
  int? get subscriber_id => throw _privateConstructorUsedError;
  String? get subscriber_name_display => throw _privateConstructorUsedError;
  String? get subscriber_type => throw _privateConstructorUsedError;
  bool? get subscriber_has_pin => throw _privateConstructorUsedError;
  List<Subscription>? get subscriptions => throw _privateConstructorUsedError;
  MergedPermissions? get mergedPermissions =>
      throw _privateConstructorUsedError;
  Map<String, bool>? get mainMenuVisibility =>
      throw _privateConstructorUsedError;
  bool? get has_expired_subscriptions => throw _privateConstructorUsedError;
  bool? get subscription_collect_wip_data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPermissionsModelCopyWith<UserPermissionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPermissionsModelCopyWith<$Res> {
  factory $UserPermissionsModelCopyWith(UserPermissionsModel value,
          $Res Function(UserPermissionsModel) then) =
      _$UserPermissionsModelCopyWithImpl<$Res, UserPermissionsModel>;
  @useResult
  $Res call(
      {String? username,
      int? subscriber_id,
      String? subscriber_name_display,
      String? subscriber_type,
      bool? subscriber_has_pin,
      List<Subscription>? subscriptions,
      MergedPermissions? mergedPermissions,
      Map<String, bool>? mainMenuVisibility,
      bool? has_expired_subscriptions,
      bool? subscription_collect_wip_data});

  $MergedPermissionsCopyWith<$Res>? get mergedPermissions;
}

/// @nodoc
class _$UserPermissionsModelCopyWithImpl<$Res,
        $Val extends UserPermissionsModel>
    implements $UserPermissionsModelCopyWith<$Res> {
  _$UserPermissionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? subscriber_id = freezed,
    Object? subscriber_name_display = freezed,
    Object? subscriber_type = freezed,
    Object? subscriber_has_pin = freezed,
    Object? subscriptions = freezed,
    Object? mergedPermissions = freezed,
    Object? mainMenuVisibility = freezed,
    Object? has_expired_subscriptions = freezed,
    Object? subscription_collect_wip_data = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriber_id: freezed == subscriber_id
          ? _value.subscriber_id
          : subscriber_id // ignore: cast_nullable_to_non_nullable
              as int?,
      subscriber_name_display: freezed == subscriber_name_display
          ? _value.subscriber_name_display
          : subscriber_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriber_type: freezed == subscriber_type
          ? _value.subscriber_type
          : subscriber_type // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriber_has_pin: freezed == subscriber_has_pin
          ? _value.subscriber_has_pin
          : subscriber_has_pin // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscriptions: freezed == subscriptions
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<Subscription>?,
      mergedPermissions: freezed == mergedPermissions
          ? _value.mergedPermissions
          : mergedPermissions // ignore: cast_nullable_to_non_nullable
              as MergedPermissions?,
      mainMenuVisibility: freezed == mainMenuVisibility
          ? _value.mainMenuVisibility
          : mainMenuVisibility // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      has_expired_subscriptions: freezed == has_expired_subscriptions
          ? _value.has_expired_subscriptions
          : has_expired_subscriptions // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_collect_wip_data: freezed == subscription_collect_wip_data
          ? _value.subscription_collect_wip_data
          : subscription_collect_wip_data // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MergedPermissionsCopyWith<$Res>? get mergedPermissions {
    if (_value.mergedPermissions == null) {
      return null;
    }

    return $MergedPermissionsCopyWith<$Res>(_value.mergedPermissions!, (value) {
      return _then(_value.copyWith(mergedPermissions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserPermissionsModelCopyWith<$Res>
    implements $UserPermissionsModelCopyWith<$Res> {
  factory _$$_UserPermissionsModelCopyWith(_$_UserPermissionsModel value,
          $Res Function(_$_UserPermissionsModel) then) =
      __$$_UserPermissionsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username,
      int? subscriber_id,
      String? subscriber_name_display,
      String? subscriber_type,
      bool? subscriber_has_pin,
      List<Subscription>? subscriptions,
      MergedPermissions? mergedPermissions,
      Map<String, bool>? mainMenuVisibility,
      bool? has_expired_subscriptions,
      bool? subscription_collect_wip_data});

  @override
  $MergedPermissionsCopyWith<$Res>? get mergedPermissions;
}

/// @nodoc
class __$$_UserPermissionsModelCopyWithImpl<$Res>
    extends _$UserPermissionsModelCopyWithImpl<$Res, _$_UserPermissionsModel>
    implements _$$_UserPermissionsModelCopyWith<$Res> {
  __$$_UserPermissionsModelCopyWithImpl(_$_UserPermissionsModel _value,
      $Res Function(_$_UserPermissionsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? subscriber_id = freezed,
    Object? subscriber_name_display = freezed,
    Object? subscriber_type = freezed,
    Object? subscriber_has_pin = freezed,
    Object? subscriptions = freezed,
    Object? mergedPermissions = freezed,
    Object? mainMenuVisibility = freezed,
    Object? has_expired_subscriptions = freezed,
    Object? subscription_collect_wip_data = freezed,
  }) {
    return _then(_$_UserPermissionsModel(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriber_id: freezed == subscriber_id
          ? _value.subscriber_id
          : subscriber_id // ignore: cast_nullable_to_non_nullable
              as int?,
      subscriber_name_display: freezed == subscriber_name_display
          ? _value.subscriber_name_display
          : subscriber_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriber_type: freezed == subscriber_type
          ? _value.subscriber_type
          : subscriber_type // ignore: cast_nullable_to_non_nullable
              as String?,
      subscriber_has_pin: freezed == subscriber_has_pin
          ? _value.subscriber_has_pin
          : subscriber_has_pin // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscriptions: freezed == subscriptions
          ? _value._subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<Subscription>?,
      mergedPermissions: freezed == mergedPermissions
          ? _value.mergedPermissions
          : mergedPermissions // ignore: cast_nullable_to_non_nullable
              as MergedPermissions?,
      mainMenuVisibility: freezed == mainMenuVisibility
          ? _value._mainMenuVisibility
          : mainMenuVisibility // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      has_expired_subscriptions: freezed == has_expired_subscriptions
          ? _value.has_expired_subscriptions
          : has_expired_subscriptions // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_collect_wip_data: freezed == subscription_collect_wip_data
          ? _value.subscription_collect_wip_data
          : subscription_collect_wip_data // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserPermissionsModel extends _UserPermissionsModel {
  const _$_UserPermissionsModel(
      {this.username,
      this.subscriber_id,
      this.subscriber_name_display,
      this.subscriber_type,
      this.subscriber_has_pin,
      final List<Subscription>? subscriptions,
      this.mergedPermissions,
      final Map<String, bool>? mainMenuVisibility,
      this.has_expired_subscriptions,
      this.subscription_collect_wip_data})
      : _subscriptions = subscriptions,
        _mainMenuVisibility = mainMenuVisibility,
        super._();

  factory _$_UserPermissionsModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserPermissionsModelFromJson(json);

  @override
  final String? username;
  @override
  final int? subscriber_id;
  @override
  final String? subscriber_name_display;
  @override
  final String? subscriber_type;
  @override
  final bool? subscriber_has_pin;
  final List<Subscription>? _subscriptions;
  @override
  List<Subscription>? get subscriptions {
    final value = _subscriptions;
    if (value == null) return null;
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final MergedPermissions? mergedPermissions;
  final Map<String, bool>? _mainMenuVisibility;
  @override
  Map<String, bool>? get mainMenuVisibility {
    final value = _mainMenuVisibility;
    if (value == null) return null;
    if (_mainMenuVisibility is EqualUnmodifiableMapView)
      return _mainMenuVisibility;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final bool? has_expired_subscriptions;
  @override
  final bool? subscription_collect_wip_data;

  @override
  String toString() {
    return 'UserPermissionsModel(username: $username, subscriber_id: $subscriber_id, subscriber_name_display: $subscriber_name_display, subscriber_type: $subscriber_type, subscriber_has_pin: $subscriber_has_pin, subscriptions: $subscriptions, mergedPermissions: $mergedPermissions, mainMenuVisibility: $mainMenuVisibility, has_expired_subscriptions: $has_expired_subscriptions, subscription_collect_wip_data: $subscription_collect_wip_data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPermissionsModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.subscriber_id, subscriber_id) ||
                other.subscriber_id == subscriber_id) &&
            (identical(
                    other.subscriber_name_display, subscriber_name_display) ||
                other.subscriber_name_display == subscriber_name_display) &&
            (identical(other.subscriber_type, subscriber_type) ||
                other.subscriber_type == subscriber_type) &&
            (identical(other.subscriber_has_pin, subscriber_has_pin) ||
                other.subscriber_has_pin == subscriber_has_pin) &&
            const DeepCollectionEquality()
                .equals(other._subscriptions, _subscriptions) &&
            (identical(other.mergedPermissions, mergedPermissions) ||
                other.mergedPermissions == mergedPermissions) &&
            const DeepCollectionEquality()
                .equals(other._mainMenuVisibility, _mainMenuVisibility) &&
            (identical(other.has_expired_subscriptions,
                    has_expired_subscriptions) ||
                other.has_expired_subscriptions == has_expired_subscriptions) &&
            (identical(other.subscription_collect_wip_data,
                    subscription_collect_wip_data) ||
                other.subscription_collect_wip_data ==
                    subscription_collect_wip_data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      username,
      subscriber_id,
      subscriber_name_display,
      subscriber_type,
      subscriber_has_pin,
      const DeepCollectionEquality().hash(_subscriptions),
      mergedPermissions,
      const DeepCollectionEquality().hash(_mainMenuVisibility),
      has_expired_subscriptions,
      subscription_collect_wip_data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPermissionsModelCopyWith<_$_UserPermissionsModel> get copyWith =>
      __$$_UserPermissionsModelCopyWithImpl<_$_UserPermissionsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPermissionsModelToJson(
      this,
    );
  }
}

abstract class _UserPermissionsModel extends UserPermissionsModel {
  const factory _UserPermissionsModel(
      {final String? username,
      final int? subscriber_id,
      final String? subscriber_name_display,
      final String? subscriber_type,
      final bool? subscriber_has_pin,
      final List<Subscription>? subscriptions,
      final MergedPermissions? mergedPermissions,
      final Map<String, bool>? mainMenuVisibility,
      final bool? has_expired_subscriptions,
      final bool? subscription_collect_wip_data}) = _$_UserPermissionsModel;
  const _UserPermissionsModel._() : super._();

  factory _UserPermissionsModel.fromJson(Map<String, dynamic> json) =
      _$_UserPermissionsModel.fromJson;

  @override
  String? get username;
  @override
  int? get subscriber_id;
  @override
  String? get subscriber_name_display;
  @override
  String? get subscriber_type;
  @override
  bool? get subscriber_has_pin;
  @override
  List<Subscription>? get subscriptions;
  @override
  MergedPermissions? get mergedPermissions;
  @override
  Map<String, bool>? get mainMenuVisibility;
  @override
  bool? get has_expired_subscriptions;
  @override
  bool? get subscription_collect_wip_data;
  @override
  @JsonKey(ignore: true)
  _$$_UserPermissionsModelCopyWith<_$_UserPermissionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

MergedPermissions _$MergedPermissionsFromJson(Map<String, dynamic> json) {
  return _MergedPermissions.fromJson(json);
}

/// @nodoc
mixin _$MergedPermissions {
  bool? get BookingAccessEnabled => throw _privateConstructorUsedError;
  bool? get BookingEditAddEnabled => throw _privateConstructorUsedError;
  bool? get JobAccessEnabled => throw _privateConstructorUsedError;
  bool? get JobEditAddEnabled => throw _privateConstructorUsedError;
  bool? get ContactAccessEnabled => throw _privateConstructorUsedError;
  bool? get UserAccessEnabled => throw _privateConstructorUsedError;
  bool? get ContactEditAddEnabled => throw _privateConstructorUsedError;
  bool? get ChargeAccessEnabled => throw _privateConstructorUsedError;
  bool? get ChargeEditAddEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MergedPermissionsCopyWith<MergedPermissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MergedPermissionsCopyWith<$Res> {
  factory $MergedPermissionsCopyWith(
          MergedPermissions value, $Res Function(MergedPermissions) then) =
      _$MergedPermissionsCopyWithImpl<$Res, MergedPermissions>;
  @useResult
  $Res call(
      {bool? BookingAccessEnabled,
      bool? BookingEditAddEnabled,
      bool? JobAccessEnabled,
      bool? JobEditAddEnabled,
      bool? ContactAccessEnabled,
      bool? UserAccessEnabled,
      bool? ContactEditAddEnabled,
      bool? ChargeAccessEnabled,
      bool? ChargeEditAddEnabled});
}

/// @nodoc
class _$MergedPermissionsCopyWithImpl<$Res, $Val extends MergedPermissions>
    implements $MergedPermissionsCopyWith<$Res> {
  _$MergedPermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? BookingAccessEnabled = freezed,
    Object? BookingEditAddEnabled = freezed,
    Object? JobAccessEnabled = freezed,
    Object? JobEditAddEnabled = freezed,
    Object? ContactAccessEnabled = freezed,
    Object? UserAccessEnabled = freezed,
    Object? ContactEditAddEnabled = freezed,
    Object? ChargeAccessEnabled = freezed,
    Object? ChargeEditAddEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      BookingAccessEnabled: freezed == BookingAccessEnabled
          ? _value.BookingAccessEnabled
          : BookingAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingEditAddEnabled: freezed == BookingEditAddEnabled
          ? _value.BookingEditAddEnabled
          : BookingEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobAccessEnabled: freezed == JobAccessEnabled
          ? _value.JobAccessEnabled
          : JobAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobEditAddEnabled: freezed == JobEditAddEnabled
          ? _value.JobEditAddEnabled
          : JobEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactAccessEnabled: freezed == ContactAccessEnabled
          ? _value.ContactAccessEnabled
          : ContactAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      UserAccessEnabled: freezed == UserAccessEnabled
          ? _value.UserAccessEnabled
          : UserAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactEditAddEnabled: freezed == ContactEditAddEnabled
          ? _value.ContactEditAddEnabled
          : ContactEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeAccessEnabled: freezed == ChargeAccessEnabled
          ? _value.ChargeAccessEnabled
          : ChargeAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeEditAddEnabled: freezed == ChargeEditAddEnabled
          ? _value.ChargeEditAddEnabled
          : ChargeEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MergedPermissionsCopyWith<$Res>
    implements $MergedPermissionsCopyWith<$Res> {
  factory _$$_MergedPermissionsCopyWith(_$_MergedPermissions value,
          $Res Function(_$_MergedPermissions) then) =
      __$$_MergedPermissionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? BookingAccessEnabled,
      bool? BookingEditAddEnabled,
      bool? JobAccessEnabled,
      bool? JobEditAddEnabled,
      bool? ContactAccessEnabled,
      bool? UserAccessEnabled,
      bool? ContactEditAddEnabled,
      bool? ChargeAccessEnabled,
      bool? ChargeEditAddEnabled});
}

/// @nodoc
class __$$_MergedPermissionsCopyWithImpl<$Res>
    extends _$MergedPermissionsCopyWithImpl<$Res, _$_MergedPermissions>
    implements _$$_MergedPermissionsCopyWith<$Res> {
  __$$_MergedPermissionsCopyWithImpl(
      _$_MergedPermissions _value, $Res Function(_$_MergedPermissions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? BookingAccessEnabled = freezed,
    Object? BookingEditAddEnabled = freezed,
    Object? JobAccessEnabled = freezed,
    Object? JobEditAddEnabled = freezed,
    Object? ContactAccessEnabled = freezed,
    Object? UserAccessEnabled = freezed,
    Object? ContactEditAddEnabled = freezed,
    Object? ChargeAccessEnabled = freezed,
    Object? ChargeEditAddEnabled = freezed,
  }) {
    return _then(_$_MergedPermissions(
      BookingAccessEnabled: freezed == BookingAccessEnabled
          ? _value.BookingAccessEnabled
          : BookingAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingEditAddEnabled: freezed == BookingEditAddEnabled
          ? _value.BookingEditAddEnabled
          : BookingEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobAccessEnabled: freezed == JobAccessEnabled
          ? _value.JobAccessEnabled
          : JobAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobEditAddEnabled: freezed == JobEditAddEnabled
          ? _value.JobEditAddEnabled
          : JobEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactAccessEnabled: freezed == ContactAccessEnabled
          ? _value.ContactAccessEnabled
          : ContactAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      UserAccessEnabled: freezed == UserAccessEnabled
          ? _value.UserAccessEnabled
          : UserAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactEditAddEnabled: freezed == ContactEditAddEnabled
          ? _value.ContactEditAddEnabled
          : ContactEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeAccessEnabled: freezed == ChargeAccessEnabled
          ? _value.ChargeAccessEnabled
          : ChargeAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeEditAddEnabled: freezed == ChargeEditAddEnabled
          ? _value.ChargeEditAddEnabled
          : ChargeEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MergedPermissions implements _MergedPermissions {
  const _$_MergedPermissions(
      {this.BookingAccessEnabled,
      this.BookingEditAddEnabled,
      this.JobAccessEnabled,
      this.JobEditAddEnabled,
      this.ContactAccessEnabled,
      this.UserAccessEnabled,
      this.ContactEditAddEnabled,
      this.ChargeAccessEnabled,
      this.ChargeEditAddEnabled});

  factory _$_MergedPermissions.fromJson(Map<String, dynamic> json) =>
      _$$_MergedPermissionsFromJson(json);

  @override
  final bool? BookingAccessEnabled;
  @override
  final bool? BookingEditAddEnabled;
  @override
  final bool? JobAccessEnabled;
  @override
  final bool? JobEditAddEnabled;
  @override
  final bool? ContactAccessEnabled;
  @override
  final bool? UserAccessEnabled;
  @override
  final bool? ContactEditAddEnabled;
  @override
  final bool? ChargeAccessEnabled;
  @override
  final bool? ChargeEditAddEnabled;

  @override
  String toString() {
    return 'MergedPermissions(BookingAccessEnabled: $BookingAccessEnabled, BookingEditAddEnabled: $BookingEditAddEnabled, JobAccessEnabled: $JobAccessEnabled, JobEditAddEnabled: $JobEditAddEnabled, ContactAccessEnabled: $ContactAccessEnabled, UserAccessEnabled: $UserAccessEnabled, ContactEditAddEnabled: $ContactEditAddEnabled, ChargeAccessEnabled: $ChargeAccessEnabled, ChargeEditAddEnabled: $ChargeEditAddEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MergedPermissions &&
            (identical(other.BookingAccessEnabled, BookingAccessEnabled) ||
                other.BookingAccessEnabled == BookingAccessEnabled) &&
            (identical(other.BookingEditAddEnabled, BookingEditAddEnabled) ||
                other.BookingEditAddEnabled == BookingEditAddEnabled) &&
            (identical(other.JobAccessEnabled, JobAccessEnabled) ||
                other.JobAccessEnabled == JobAccessEnabled) &&
            (identical(other.JobEditAddEnabled, JobEditAddEnabled) ||
                other.JobEditAddEnabled == JobEditAddEnabled) &&
            (identical(other.ContactAccessEnabled, ContactAccessEnabled) ||
                other.ContactAccessEnabled == ContactAccessEnabled) &&
            (identical(other.UserAccessEnabled, UserAccessEnabled) ||
                other.UserAccessEnabled == UserAccessEnabled) &&
            (identical(other.ContactEditAddEnabled, ContactEditAddEnabled) ||
                other.ContactEditAddEnabled == ContactEditAddEnabled) &&
            (identical(other.ChargeAccessEnabled, ChargeAccessEnabled) ||
                other.ChargeAccessEnabled == ChargeAccessEnabled) &&
            (identical(other.ChargeEditAddEnabled, ChargeEditAddEnabled) ||
                other.ChargeEditAddEnabled == ChargeEditAddEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      BookingAccessEnabled,
      BookingEditAddEnabled,
      JobAccessEnabled,
      JobEditAddEnabled,
      ContactAccessEnabled,
      UserAccessEnabled,
      ContactEditAddEnabled,
      ChargeAccessEnabled,
      ChargeEditAddEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MergedPermissionsCopyWith<_$_MergedPermissions> get copyWith =>
      __$$_MergedPermissionsCopyWithImpl<_$_MergedPermissions>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MergedPermissionsToJson(
      this,
    );
  }
}

abstract class _MergedPermissions implements MergedPermissions {
  const factory _MergedPermissions(
      {final bool? BookingAccessEnabled,
      final bool? BookingEditAddEnabled,
      final bool? JobAccessEnabled,
      final bool? JobEditAddEnabled,
      final bool? ContactAccessEnabled,
      final bool? UserAccessEnabled,
      final bool? ContactEditAddEnabled,
      final bool? ChargeAccessEnabled,
      final bool? ChargeEditAddEnabled}) = _$_MergedPermissions;

  factory _MergedPermissions.fromJson(Map<String, dynamic> json) =
      _$_MergedPermissions.fromJson;

  @override
  bool? get BookingAccessEnabled;
  @override
  bool? get BookingEditAddEnabled;
  @override
  bool? get JobAccessEnabled;
  @override
  bool? get JobEditAddEnabled;
  @override
  bool? get ContactAccessEnabled;
  @override
  bool? get UserAccessEnabled;
  @override
  bool? get ContactEditAddEnabled;
  @override
  bool? get ChargeAccessEnabled;
  @override
  bool? get ChargeEditAddEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_MergedPermissionsCopyWith<_$_MergedPermissions> get copyWith =>
      throw _privateConstructorUsedError;
}

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return _Subscription.fromJson(json);
}

/// @nodoc
mixin _$Subscription {
  int? get subscription_id => throw _privateConstructorUsedError;
  String? get subscription_public_name => throw _privateConstructorUsedError;
  int? get subscription_plan => throw _privateConstructorUsedError;
  int? get subscription_plan_minor => throw _privateConstructorUsedError;
  String? get subscription_plan_name => throw _privateConstructorUsedError;
  int? get contact_id => throw _privateConstructorUsedError;
  dynamic get subrole_id => throw _privateConstructorUsedError;
  dynamic get subrole_name => throw _privateConstructorUsedError;
  bool? get is_admin => throw _privateConstructorUsedError;
  Permissions? get permissions => throw _privateConstructorUsedError;
  bool? get subscription_is_setup_complete =>
      throw _privateConstructorUsedError;
  bool? get subscription_is_trial => throw _privateConstructorUsedError;
  bool? get subscription_is_paying => throw _privateConstructorUsedError;
  dynamic get subscription_accounting_provider =>
      throw _privateConstructorUsedError;
  bool? get subscription_is_messaging_enabled =>
      throw _privateConstructorUsedError;
  bool? get subscription_is_sms_enabled => throw _privateConstructorUsedError;
  bool? get subscription_is_email_enabled => throw _privateConstructorUsedError;
  bool? get subscription_order_is_single_supplier =>
      throw _privateConstructorUsedError;
  bool? get subscription_is_job_and_booking_site =>
      throw _privateConstructorUsedError;
  Contact? get contact => throw _privateConstructorUsedError;
  AccountingSetup? get accounting_setup => throw _privateConstructorUsedError;
  bool? get subscription_is_buy_now_button_visible =>
      throw _privateConstructorUsedError;
  dynamic get subscription_chargify_subscription_id =>
      throw _privateConstructorUsedError;
  dynamic get subscription_chargify_customer_reference =>
      throw _privateConstructorUsedError;
  bool? get subscription_is_new_baas_subscription =>
      throw _privateConstructorUsedError;
  String? get subscription_buy_now_button_text =>
      throw _privateConstructorUsedError;
  String? get subscription_buy_now_button_text2 =>
      throw _privateConstructorUsedError;
  bool? get subscription_is_purchasable => throw _privateConstructorUsedError;
  bool? get subscription_is_limited => throw _privateConstructorUsedError;
  bool? get is_basic_setup_complete => throw _privateConstructorUsedError;
  bool? get subscription_job_is_user_defined_number =>
      throw _privateConstructorUsedError;
  bool? get subscription_exclude_manual_timesheet_entries =>
      throw _privateConstructorUsedError;
  int? get subscription_job_planning_job_color_source =>
      throw _privateConstructorUsedError;
  int? get subscription_job_planning_task_color_source =>
      throw _privateConstructorUsedError;
  int? get subscription_job_planning_duration_units =>
      throw _privateConstructorUsedError;
  bool? get subscription_job_planning_display_hover_text =>
      throw _privateConstructorUsedError;
  int? get subscription_job_planning_working_days =>
      throw _privateConstructorUsedError;
  int? get subscription_job_planning_work_start_time =>
      throw _privateConstructorUsedError;
  int? get subscription_job_planning_work_end_time =>
      throw _privateConstructorUsedError;
  int? get subscription_max_attachment_size =>
      throw _privateConstructorUsedError;
  bool? get subscription_collect_wip_data => throw _privateConstructorUsedError;
  bool? get subscription_is_detailed_back_costing_enabled =>
      throw _privateConstructorUsedError;
  bool? get subscription_is_beta_tester => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionCopyWith<Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCopyWith<$Res> {
  factory $SubscriptionCopyWith(
          Subscription value, $Res Function(Subscription) then) =
      _$SubscriptionCopyWithImpl<$Res, Subscription>;
  @useResult
  $Res call(
      {int? subscription_id,
      String? subscription_public_name,
      int? subscription_plan,
      int? subscription_plan_minor,
      String? subscription_plan_name,
      int? contact_id,
      dynamic subrole_id,
      dynamic subrole_name,
      bool? is_admin,
      Permissions? permissions,
      bool? subscription_is_setup_complete,
      bool? subscription_is_trial,
      bool? subscription_is_paying,
      dynamic subscription_accounting_provider,
      bool? subscription_is_messaging_enabled,
      bool? subscription_is_sms_enabled,
      bool? subscription_is_email_enabled,
      bool? subscription_order_is_single_supplier,
      bool? subscription_is_job_and_booking_site,
      Contact? contact,
      AccountingSetup? accounting_setup,
      bool? subscription_is_buy_now_button_visible,
      dynamic subscription_chargify_subscription_id,
      dynamic subscription_chargify_customer_reference,
      bool? subscription_is_new_baas_subscription,
      String? subscription_buy_now_button_text,
      String? subscription_buy_now_button_text2,
      bool? subscription_is_purchasable,
      bool? subscription_is_limited,
      bool? is_basic_setup_complete,
      bool? subscription_job_is_user_defined_number,
      bool? subscription_exclude_manual_timesheet_entries,
      int? subscription_job_planning_job_color_source,
      int? subscription_job_planning_task_color_source,
      int? subscription_job_planning_duration_units,
      bool? subscription_job_planning_display_hover_text,
      int? subscription_job_planning_working_days,
      int? subscription_job_planning_work_start_time,
      int? subscription_job_planning_work_end_time,
      int? subscription_max_attachment_size,
      bool? subscription_collect_wip_data,
      bool? subscription_is_detailed_back_costing_enabled,
      bool? subscription_is_beta_tester});

  $PermissionsCopyWith<$Res>? get permissions;
  $ContactCopyWith<$Res>? get contact;
  $AccountingSetupCopyWith<$Res>? get accounting_setup;
}

/// @nodoc
class _$SubscriptionCopyWithImpl<$Res, $Val extends Subscription>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription_id = freezed,
    Object? subscription_public_name = freezed,
    Object? subscription_plan = freezed,
    Object? subscription_plan_minor = freezed,
    Object? subscription_plan_name = freezed,
    Object? contact_id = freezed,
    Object? subrole_id = freezed,
    Object? subrole_name = freezed,
    Object? is_admin = freezed,
    Object? permissions = freezed,
    Object? subscription_is_setup_complete = freezed,
    Object? subscription_is_trial = freezed,
    Object? subscription_is_paying = freezed,
    Object? subscription_accounting_provider = freezed,
    Object? subscription_is_messaging_enabled = freezed,
    Object? subscription_is_sms_enabled = freezed,
    Object? subscription_is_email_enabled = freezed,
    Object? subscription_order_is_single_supplier = freezed,
    Object? subscription_is_job_and_booking_site = freezed,
    Object? contact = freezed,
    Object? accounting_setup = freezed,
    Object? subscription_is_buy_now_button_visible = freezed,
    Object? subscription_chargify_subscription_id = freezed,
    Object? subscription_chargify_customer_reference = freezed,
    Object? subscription_is_new_baas_subscription = freezed,
    Object? subscription_buy_now_button_text = freezed,
    Object? subscription_buy_now_button_text2 = freezed,
    Object? subscription_is_purchasable = freezed,
    Object? subscription_is_limited = freezed,
    Object? is_basic_setup_complete = freezed,
    Object? subscription_job_is_user_defined_number = freezed,
    Object? subscription_exclude_manual_timesheet_entries = freezed,
    Object? subscription_job_planning_job_color_source = freezed,
    Object? subscription_job_planning_task_color_source = freezed,
    Object? subscription_job_planning_duration_units = freezed,
    Object? subscription_job_planning_display_hover_text = freezed,
    Object? subscription_job_planning_working_days = freezed,
    Object? subscription_job_planning_work_start_time = freezed,
    Object? subscription_job_planning_work_end_time = freezed,
    Object? subscription_max_attachment_size = freezed,
    Object? subscription_collect_wip_data = freezed,
    Object? subscription_is_detailed_back_costing_enabled = freezed,
    Object? subscription_is_beta_tester = freezed,
  }) {
    return _then(_value.copyWith(
      subscription_id: freezed == subscription_id
          ? _value.subscription_id
          : subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_public_name: freezed == subscription_public_name
          ? _value.subscription_public_name
          : subscription_public_name // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_plan: freezed == subscription_plan
          ? _value.subscription_plan
          : subscription_plan // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_plan_minor: freezed == subscription_plan_minor
          ? _value.subscription_plan_minor
          : subscription_plan_minor // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_plan_name: freezed == subscription_plan_name
          ? _value.subscription_plan_name
          : subscription_plan_name // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_id: freezed == contact_id
          ? _value.contact_id
          : contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      subrole_id: freezed == subrole_id
          ? _value.subrole_id
          : subrole_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subrole_name: freezed == subrole_name
          ? _value.subrole_name
          : subrole_name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      is_admin: freezed == is_admin
          ? _value.is_admin
          : is_admin // ignore: cast_nullable_to_non_nullable
              as bool?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Permissions?,
      subscription_is_setup_complete: freezed == subscription_is_setup_complete
          ? _value.subscription_is_setup_complete
          : subscription_is_setup_complete // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_trial: freezed == subscription_is_trial
          ? _value.subscription_is_trial
          : subscription_is_trial // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_paying: freezed == subscription_is_paying
          ? _value.subscription_is_paying
          : subscription_is_paying // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_accounting_provider: freezed ==
              subscription_accounting_provider
          ? _value.subscription_accounting_provider
          : subscription_accounting_provider // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscription_is_messaging_enabled: freezed ==
              subscription_is_messaging_enabled
          ? _value.subscription_is_messaging_enabled
          : subscription_is_messaging_enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_sms_enabled: freezed == subscription_is_sms_enabled
          ? _value.subscription_is_sms_enabled
          : subscription_is_sms_enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_email_enabled: freezed == subscription_is_email_enabled
          ? _value.subscription_is_email_enabled
          : subscription_is_email_enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_order_is_single_supplier: freezed ==
              subscription_order_is_single_supplier
          ? _value.subscription_order_is_single_supplier
          : subscription_order_is_single_supplier // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_job_and_booking_site: freezed ==
              subscription_is_job_and_booking_site
          ? _value.subscription_is_job_and_booking_site
          : subscription_is_job_and_booking_site // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      accounting_setup: freezed == accounting_setup
          ? _value.accounting_setup
          : accounting_setup // ignore: cast_nullable_to_non_nullable
              as AccountingSetup?,
      subscription_is_buy_now_button_visible: freezed ==
              subscription_is_buy_now_button_visible
          ? _value.subscription_is_buy_now_button_visible
          : subscription_is_buy_now_button_visible // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_chargify_subscription_id: freezed ==
              subscription_chargify_subscription_id
          ? _value.subscription_chargify_subscription_id
          : subscription_chargify_subscription_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscription_chargify_customer_reference: freezed ==
              subscription_chargify_customer_reference
          ? _value.subscription_chargify_customer_reference
          : subscription_chargify_customer_reference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscription_is_new_baas_subscription: freezed ==
              subscription_is_new_baas_subscription
          ? _value.subscription_is_new_baas_subscription
          : subscription_is_new_baas_subscription // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_buy_now_button_text: freezed ==
              subscription_buy_now_button_text
          ? _value.subscription_buy_now_button_text
          : subscription_buy_now_button_text // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_buy_now_button_text2: freezed ==
              subscription_buy_now_button_text2
          ? _value.subscription_buy_now_button_text2
          : subscription_buy_now_button_text2 // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_is_purchasable: freezed == subscription_is_purchasable
          ? _value.subscription_is_purchasable
          : subscription_is_purchasable // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_limited: freezed == subscription_is_limited
          ? _value.subscription_is_limited
          : subscription_is_limited // ignore: cast_nullable_to_non_nullable
              as bool?,
      is_basic_setup_complete: freezed == is_basic_setup_complete
          ? _value.is_basic_setup_complete
          : is_basic_setup_complete // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_job_is_user_defined_number: freezed ==
              subscription_job_is_user_defined_number
          ? _value.subscription_job_is_user_defined_number
          : subscription_job_is_user_defined_number // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_exclude_manual_timesheet_entries: freezed ==
              subscription_exclude_manual_timesheet_entries
          ? _value.subscription_exclude_manual_timesheet_entries
          : subscription_exclude_manual_timesheet_entries // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_job_planning_job_color_source: freezed ==
              subscription_job_planning_job_color_source
          ? _value.subscription_job_planning_job_color_source
          : subscription_job_planning_job_color_source // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_job_planning_task_color_source: freezed ==
              subscription_job_planning_task_color_source
          ? _value.subscription_job_planning_task_color_source
          : subscription_job_planning_task_color_source // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_job_planning_duration_units: freezed ==
              subscription_job_planning_duration_units
          ? _value.subscription_job_planning_duration_units
          : subscription_job_planning_duration_units // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_job_planning_display_hover_text: freezed ==
              subscription_job_planning_display_hover_text
          ? _value.subscription_job_planning_display_hover_text
          : subscription_job_planning_display_hover_text // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_job_planning_working_days: freezed ==
              subscription_job_planning_working_days
          ? _value.subscription_job_planning_working_days
          : subscription_job_planning_working_days // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_job_planning_work_start_time: freezed ==
              subscription_job_planning_work_start_time
          ? _value.subscription_job_planning_work_start_time
          : subscription_job_planning_work_start_time // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_job_planning_work_end_time: freezed ==
              subscription_job_planning_work_end_time
          ? _value.subscription_job_planning_work_end_time
          : subscription_job_planning_work_end_time // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_max_attachment_size: freezed ==
              subscription_max_attachment_size
          ? _value.subscription_max_attachment_size
          : subscription_max_attachment_size // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_collect_wip_data: freezed == subscription_collect_wip_data
          ? _value.subscription_collect_wip_data
          : subscription_collect_wip_data // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_detailed_back_costing_enabled: freezed ==
              subscription_is_detailed_back_costing_enabled
          ? _value.subscription_is_detailed_back_costing_enabled
          : subscription_is_detailed_back_costing_enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_beta_tester: freezed == subscription_is_beta_tester
          ? _value.subscription_is_beta_tester
          : subscription_is_beta_tester // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PermissionsCopyWith<$Res>? get permissions {
    if (_value.permissions == null) {
      return null;
    }

    return $PermissionsCopyWith<$Res>(_value.permissions!, (value) {
      return _then(_value.copyWith(permissions: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get contact {
    if (_value.contact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.contact!, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountingSetupCopyWith<$Res>? get accounting_setup {
    if (_value.accounting_setup == null) {
      return null;
    }

    return $AccountingSetupCopyWith<$Res>(_value.accounting_setup!, (value) {
      return _then(_value.copyWith(accounting_setup: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SubscriptionCopyWith<$Res>
    implements $SubscriptionCopyWith<$Res> {
  factory _$$_SubscriptionCopyWith(
          _$_Subscription value, $Res Function(_$_Subscription) then) =
      __$$_SubscriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? subscription_id,
      String? subscription_public_name,
      int? subscription_plan,
      int? subscription_plan_minor,
      String? subscription_plan_name,
      int? contact_id,
      dynamic subrole_id,
      dynamic subrole_name,
      bool? is_admin,
      Permissions? permissions,
      bool? subscription_is_setup_complete,
      bool? subscription_is_trial,
      bool? subscription_is_paying,
      dynamic subscription_accounting_provider,
      bool? subscription_is_messaging_enabled,
      bool? subscription_is_sms_enabled,
      bool? subscription_is_email_enabled,
      bool? subscription_order_is_single_supplier,
      bool? subscription_is_job_and_booking_site,
      Contact? contact,
      AccountingSetup? accounting_setup,
      bool? subscription_is_buy_now_button_visible,
      dynamic subscription_chargify_subscription_id,
      dynamic subscription_chargify_customer_reference,
      bool? subscription_is_new_baas_subscription,
      String? subscription_buy_now_button_text,
      String? subscription_buy_now_button_text2,
      bool? subscription_is_purchasable,
      bool? subscription_is_limited,
      bool? is_basic_setup_complete,
      bool? subscription_job_is_user_defined_number,
      bool? subscription_exclude_manual_timesheet_entries,
      int? subscription_job_planning_job_color_source,
      int? subscription_job_planning_task_color_source,
      int? subscription_job_planning_duration_units,
      bool? subscription_job_planning_display_hover_text,
      int? subscription_job_planning_working_days,
      int? subscription_job_planning_work_start_time,
      int? subscription_job_planning_work_end_time,
      int? subscription_max_attachment_size,
      bool? subscription_collect_wip_data,
      bool? subscription_is_detailed_back_costing_enabled,
      bool? subscription_is_beta_tester});

  @override
  $PermissionsCopyWith<$Res>? get permissions;
  @override
  $ContactCopyWith<$Res>? get contact;
  @override
  $AccountingSetupCopyWith<$Res>? get accounting_setup;
}

/// @nodoc
class __$$_SubscriptionCopyWithImpl<$Res>
    extends _$SubscriptionCopyWithImpl<$Res, _$_Subscription>
    implements _$$_SubscriptionCopyWith<$Res> {
  __$$_SubscriptionCopyWithImpl(
      _$_Subscription _value, $Res Function(_$_Subscription) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription_id = freezed,
    Object? subscription_public_name = freezed,
    Object? subscription_plan = freezed,
    Object? subscription_plan_minor = freezed,
    Object? subscription_plan_name = freezed,
    Object? contact_id = freezed,
    Object? subrole_id = freezed,
    Object? subrole_name = freezed,
    Object? is_admin = freezed,
    Object? permissions = freezed,
    Object? subscription_is_setup_complete = freezed,
    Object? subscription_is_trial = freezed,
    Object? subscription_is_paying = freezed,
    Object? subscription_accounting_provider = freezed,
    Object? subscription_is_messaging_enabled = freezed,
    Object? subscription_is_sms_enabled = freezed,
    Object? subscription_is_email_enabled = freezed,
    Object? subscription_order_is_single_supplier = freezed,
    Object? subscription_is_job_and_booking_site = freezed,
    Object? contact = freezed,
    Object? accounting_setup = freezed,
    Object? subscription_is_buy_now_button_visible = freezed,
    Object? subscription_chargify_subscription_id = freezed,
    Object? subscription_chargify_customer_reference = freezed,
    Object? subscription_is_new_baas_subscription = freezed,
    Object? subscription_buy_now_button_text = freezed,
    Object? subscription_buy_now_button_text2 = freezed,
    Object? subscription_is_purchasable = freezed,
    Object? subscription_is_limited = freezed,
    Object? is_basic_setup_complete = freezed,
    Object? subscription_job_is_user_defined_number = freezed,
    Object? subscription_exclude_manual_timesheet_entries = freezed,
    Object? subscription_job_planning_job_color_source = freezed,
    Object? subscription_job_planning_task_color_source = freezed,
    Object? subscription_job_planning_duration_units = freezed,
    Object? subscription_job_planning_display_hover_text = freezed,
    Object? subscription_job_planning_working_days = freezed,
    Object? subscription_job_planning_work_start_time = freezed,
    Object? subscription_job_planning_work_end_time = freezed,
    Object? subscription_max_attachment_size = freezed,
    Object? subscription_collect_wip_data = freezed,
    Object? subscription_is_detailed_back_costing_enabled = freezed,
    Object? subscription_is_beta_tester = freezed,
  }) {
    return _then(_$_Subscription(
      subscription_id: freezed == subscription_id
          ? _value.subscription_id
          : subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_public_name: freezed == subscription_public_name
          ? _value.subscription_public_name
          : subscription_public_name // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_plan: freezed == subscription_plan
          ? _value.subscription_plan
          : subscription_plan // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_plan_minor: freezed == subscription_plan_minor
          ? _value.subscription_plan_minor
          : subscription_plan_minor // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_plan_name: freezed == subscription_plan_name
          ? _value.subscription_plan_name
          : subscription_plan_name // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_id: freezed == contact_id
          ? _value.contact_id
          : contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      subrole_id: freezed == subrole_id
          ? _value.subrole_id
          : subrole_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subrole_name: freezed == subrole_name
          ? _value.subrole_name
          : subrole_name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      is_admin: freezed == is_admin
          ? _value.is_admin
          : is_admin // ignore: cast_nullable_to_non_nullable
              as bool?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Permissions?,
      subscription_is_setup_complete: freezed == subscription_is_setup_complete
          ? _value.subscription_is_setup_complete
          : subscription_is_setup_complete // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_trial: freezed == subscription_is_trial
          ? _value.subscription_is_trial
          : subscription_is_trial // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_paying: freezed == subscription_is_paying
          ? _value.subscription_is_paying
          : subscription_is_paying // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_accounting_provider: freezed ==
              subscription_accounting_provider
          ? _value.subscription_accounting_provider
          : subscription_accounting_provider // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscription_is_messaging_enabled: freezed ==
              subscription_is_messaging_enabled
          ? _value.subscription_is_messaging_enabled
          : subscription_is_messaging_enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_sms_enabled: freezed == subscription_is_sms_enabled
          ? _value.subscription_is_sms_enabled
          : subscription_is_sms_enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_email_enabled: freezed == subscription_is_email_enabled
          ? _value.subscription_is_email_enabled
          : subscription_is_email_enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_order_is_single_supplier: freezed ==
              subscription_order_is_single_supplier
          ? _value.subscription_order_is_single_supplier
          : subscription_order_is_single_supplier // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_job_and_booking_site: freezed ==
              subscription_is_job_and_booking_site
          ? _value.subscription_is_job_and_booking_site
          : subscription_is_job_and_booking_site // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      accounting_setup: freezed == accounting_setup
          ? _value.accounting_setup
          : accounting_setup // ignore: cast_nullable_to_non_nullable
              as AccountingSetup?,
      subscription_is_buy_now_button_visible: freezed ==
              subscription_is_buy_now_button_visible
          ? _value.subscription_is_buy_now_button_visible
          : subscription_is_buy_now_button_visible // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_chargify_subscription_id: freezed ==
              subscription_chargify_subscription_id
          ? _value.subscription_chargify_subscription_id
          : subscription_chargify_subscription_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscription_chargify_customer_reference: freezed ==
              subscription_chargify_customer_reference
          ? _value.subscription_chargify_customer_reference
          : subscription_chargify_customer_reference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscription_is_new_baas_subscription: freezed ==
              subscription_is_new_baas_subscription
          ? _value.subscription_is_new_baas_subscription
          : subscription_is_new_baas_subscription // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_buy_now_button_text: freezed ==
              subscription_buy_now_button_text
          ? _value.subscription_buy_now_button_text
          : subscription_buy_now_button_text // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_buy_now_button_text2: freezed ==
              subscription_buy_now_button_text2
          ? _value.subscription_buy_now_button_text2
          : subscription_buy_now_button_text2 // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_is_purchasable: freezed == subscription_is_purchasable
          ? _value.subscription_is_purchasable
          : subscription_is_purchasable // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_limited: freezed == subscription_is_limited
          ? _value.subscription_is_limited
          : subscription_is_limited // ignore: cast_nullable_to_non_nullable
              as bool?,
      is_basic_setup_complete: freezed == is_basic_setup_complete
          ? _value.is_basic_setup_complete
          : is_basic_setup_complete // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_job_is_user_defined_number: freezed ==
              subscription_job_is_user_defined_number
          ? _value.subscription_job_is_user_defined_number
          : subscription_job_is_user_defined_number // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_exclude_manual_timesheet_entries: freezed ==
              subscription_exclude_manual_timesheet_entries
          ? _value.subscription_exclude_manual_timesheet_entries
          : subscription_exclude_manual_timesheet_entries // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_job_planning_job_color_source: freezed ==
              subscription_job_planning_job_color_source
          ? _value.subscription_job_planning_job_color_source
          : subscription_job_planning_job_color_source // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_job_planning_task_color_source: freezed ==
              subscription_job_planning_task_color_source
          ? _value.subscription_job_planning_task_color_source
          : subscription_job_planning_task_color_source // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_job_planning_duration_units: freezed ==
              subscription_job_planning_duration_units
          ? _value.subscription_job_planning_duration_units
          : subscription_job_planning_duration_units // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_job_planning_display_hover_text: freezed ==
              subscription_job_planning_display_hover_text
          ? _value.subscription_job_planning_display_hover_text
          : subscription_job_planning_display_hover_text // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_job_planning_working_days: freezed ==
              subscription_job_planning_working_days
          ? _value.subscription_job_planning_working_days
          : subscription_job_planning_working_days // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_job_planning_work_start_time: freezed ==
              subscription_job_planning_work_start_time
          ? _value.subscription_job_planning_work_start_time
          : subscription_job_planning_work_start_time // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_job_planning_work_end_time: freezed ==
              subscription_job_planning_work_end_time
          ? _value.subscription_job_planning_work_end_time
          : subscription_job_planning_work_end_time // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_max_attachment_size: freezed ==
              subscription_max_attachment_size
          ? _value.subscription_max_attachment_size
          : subscription_max_attachment_size // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_collect_wip_data: freezed == subscription_collect_wip_data
          ? _value.subscription_collect_wip_data
          : subscription_collect_wip_data // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_detailed_back_costing_enabled: freezed ==
              subscription_is_detailed_back_costing_enabled
          ? _value.subscription_is_detailed_back_costing_enabled
          : subscription_is_detailed_back_costing_enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_beta_tester: freezed == subscription_is_beta_tester
          ? _value.subscription_is_beta_tester
          : subscription_is_beta_tester // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Subscription implements _Subscription {
  const _$_Subscription(
      {this.subscription_id,
      this.subscription_public_name,
      this.subscription_plan,
      this.subscription_plan_minor,
      this.subscription_plan_name,
      this.contact_id,
      this.subrole_id,
      this.subrole_name,
      this.is_admin,
      this.permissions,
      this.subscription_is_setup_complete,
      this.subscription_is_trial,
      this.subscription_is_paying,
      this.subscription_accounting_provider,
      this.subscription_is_messaging_enabled,
      this.subscription_is_sms_enabled,
      this.subscription_is_email_enabled,
      this.subscription_order_is_single_supplier,
      this.subscription_is_job_and_booking_site,
      this.contact,
      this.accounting_setup,
      this.subscription_is_buy_now_button_visible,
      this.subscription_chargify_subscription_id,
      this.subscription_chargify_customer_reference,
      this.subscription_is_new_baas_subscription,
      this.subscription_buy_now_button_text,
      this.subscription_buy_now_button_text2,
      this.subscription_is_purchasable,
      this.subscription_is_limited,
      this.is_basic_setup_complete,
      this.subscription_job_is_user_defined_number,
      this.subscription_exclude_manual_timesheet_entries,
      this.subscription_job_planning_job_color_source,
      this.subscription_job_planning_task_color_source,
      this.subscription_job_planning_duration_units,
      this.subscription_job_planning_display_hover_text,
      this.subscription_job_planning_working_days,
      this.subscription_job_planning_work_start_time,
      this.subscription_job_planning_work_end_time,
      this.subscription_max_attachment_size,
      this.subscription_collect_wip_data,
      this.subscription_is_detailed_back_costing_enabled,
      this.subscription_is_beta_tester});

  factory _$_Subscription.fromJson(Map<String, dynamic> json) =>
      _$$_SubscriptionFromJson(json);

  @override
  final int? subscription_id;
  @override
  final String? subscription_public_name;
  @override
  final int? subscription_plan;
  @override
  final int? subscription_plan_minor;
  @override
  final String? subscription_plan_name;
  @override
  final int? contact_id;
  @override
  final dynamic subrole_id;
  @override
  final dynamic subrole_name;
  @override
  final bool? is_admin;
  @override
  final Permissions? permissions;
  @override
  final bool? subscription_is_setup_complete;
  @override
  final bool? subscription_is_trial;
  @override
  final bool? subscription_is_paying;
  @override
  final dynamic subscription_accounting_provider;
  @override
  final bool? subscription_is_messaging_enabled;
  @override
  final bool? subscription_is_sms_enabled;
  @override
  final bool? subscription_is_email_enabled;
  @override
  final bool? subscription_order_is_single_supplier;
  @override
  final bool? subscription_is_job_and_booking_site;
  @override
  final Contact? contact;
  @override
  final AccountingSetup? accounting_setup;
  @override
  final bool? subscription_is_buy_now_button_visible;
  @override
  final dynamic subscription_chargify_subscription_id;
  @override
  final dynamic subscription_chargify_customer_reference;
  @override
  final bool? subscription_is_new_baas_subscription;
  @override
  final String? subscription_buy_now_button_text;
  @override
  final String? subscription_buy_now_button_text2;
  @override
  final bool? subscription_is_purchasable;
  @override
  final bool? subscription_is_limited;
  @override
  final bool? is_basic_setup_complete;
  @override
  final bool? subscription_job_is_user_defined_number;
  @override
  final bool? subscription_exclude_manual_timesheet_entries;
  @override
  final int? subscription_job_planning_job_color_source;
  @override
  final int? subscription_job_planning_task_color_source;
  @override
  final int? subscription_job_planning_duration_units;
  @override
  final bool? subscription_job_planning_display_hover_text;
  @override
  final int? subscription_job_planning_working_days;
  @override
  final int? subscription_job_planning_work_start_time;
  @override
  final int? subscription_job_planning_work_end_time;
  @override
  final int? subscription_max_attachment_size;
  @override
  final bool? subscription_collect_wip_data;
  @override
  final bool? subscription_is_detailed_back_costing_enabled;
  @override
  final bool? subscription_is_beta_tester;

  @override
  String toString() {
    return 'Subscription(subscription_id: $subscription_id, subscription_public_name: $subscription_public_name, subscription_plan: $subscription_plan, subscription_plan_minor: $subscription_plan_minor, subscription_plan_name: $subscription_plan_name, contact_id: $contact_id, subrole_id: $subrole_id, subrole_name: $subrole_name, is_admin: $is_admin, permissions: $permissions, subscription_is_setup_complete: $subscription_is_setup_complete, subscription_is_trial: $subscription_is_trial, subscription_is_paying: $subscription_is_paying, subscription_accounting_provider: $subscription_accounting_provider, subscription_is_messaging_enabled: $subscription_is_messaging_enabled, subscription_is_sms_enabled: $subscription_is_sms_enabled, subscription_is_email_enabled: $subscription_is_email_enabled, subscription_order_is_single_supplier: $subscription_order_is_single_supplier, subscription_is_job_and_booking_site: $subscription_is_job_and_booking_site, contact: $contact, accounting_setup: $accounting_setup, subscription_is_buy_now_button_visible: $subscription_is_buy_now_button_visible, subscription_chargify_subscription_id: $subscription_chargify_subscription_id, subscription_chargify_customer_reference: $subscription_chargify_customer_reference, subscription_is_new_baas_subscription: $subscription_is_new_baas_subscription, subscription_buy_now_button_text: $subscription_buy_now_button_text, subscription_buy_now_button_text2: $subscription_buy_now_button_text2, subscription_is_purchasable: $subscription_is_purchasable, subscription_is_limited: $subscription_is_limited, is_basic_setup_complete: $is_basic_setup_complete, subscription_job_is_user_defined_number: $subscription_job_is_user_defined_number, subscription_exclude_manual_timesheet_entries: $subscription_exclude_manual_timesheet_entries, subscription_job_planning_job_color_source: $subscription_job_planning_job_color_source, subscription_job_planning_task_color_source: $subscription_job_planning_task_color_source, subscription_job_planning_duration_units: $subscription_job_planning_duration_units, subscription_job_planning_display_hover_text: $subscription_job_planning_display_hover_text, subscription_job_planning_working_days: $subscription_job_planning_working_days, subscription_job_planning_work_start_time: $subscription_job_planning_work_start_time, subscription_job_planning_work_end_time: $subscription_job_planning_work_end_time, subscription_max_attachment_size: $subscription_max_attachment_size, subscription_collect_wip_data: $subscription_collect_wip_data, subscription_is_detailed_back_costing_enabled: $subscription_is_detailed_back_costing_enabled, subscription_is_beta_tester: $subscription_is_beta_tester)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subscription &&
            (identical(other.subscription_id, subscription_id) ||
                other.subscription_id == subscription_id) &&
            (identical(other.subscription_public_name, subscription_public_name) ||
                other.subscription_public_name == subscription_public_name) &&
            (identical(other.subscription_plan, subscription_plan) ||
                other.subscription_plan == subscription_plan) &&
            (identical(other.subscription_plan_minor, subscription_plan_minor) ||
                other.subscription_plan_minor == subscription_plan_minor) &&
            (identical(other.subscription_plan_name, subscription_plan_name) ||
                other.subscription_plan_name == subscription_plan_name) &&
            (identical(other.contact_id, contact_id) ||
                other.contact_id == contact_id) &&
            const DeepCollectionEquality()
                .equals(other.subrole_id, subrole_id) &&
            const DeepCollectionEquality()
                .equals(other.subrole_name, subrole_name) &&
            (identical(other.is_admin, is_admin) ||
                other.is_admin == is_admin) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions) &&
            (identical(other.subscription_is_setup_complete, subscription_is_setup_complete) ||
                other.subscription_is_setup_complete ==
                    subscription_is_setup_complete) &&
            (identical(other.subscription_is_trial, subscription_is_trial) ||
                other.subscription_is_trial == subscription_is_trial) &&
            (identical(other.subscription_is_paying, subscription_is_paying) ||
                other.subscription_is_paying == subscription_is_paying) &&
            const DeepCollectionEquality().equals(
                other.subscription_accounting_provider,
                subscription_accounting_provider) &&
            (identical(other.subscription_is_messaging_enabled, subscription_is_messaging_enabled) ||
                other.subscription_is_messaging_enabled ==
                    subscription_is_messaging_enabled) &&
            (identical(other.subscription_is_sms_enabled, subscription_is_sms_enabled) ||
                other.subscription_is_sms_enabled ==
                    subscription_is_sms_enabled) &&
            (identical(other.subscription_is_email_enabled, subscription_is_email_enabled) ||
                other.subscription_is_email_enabled ==
                    subscription_is_email_enabled) &&
            (identical(other.subscription_order_is_single_supplier, subscription_order_is_single_supplier) ||
                other.subscription_order_is_single_supplier ==
                    subscription_order_is_single_supplier) &&
            (identical(other.subscription_is_job_and_booking_site, subscription_is_job_and_booking_site) || other.subscription_is_job_and_booking_site == subscription_is_job_and_booking_site) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.accounting_setup, accounting_setup) || other.accounting_setup == accounting_setup) &&
            (identical(other.subscription_is_buy_now_button_visible, subscription_is_buy_now_button_visible) || other.subscription_is_buy_now_button_visible == subscription_is_buy_now_button_visible) &&
            const DeepCollectionEquality().equals(other.subscription_chargify_subscription_id, subscription_chargify_subscription_id) &&
            const DeepCollectionEquality().equals(other.subscription_chargify_customer_reference, subscription_chargify_customer_reference) &&
            (identical(other.subscription_is_new_baas_subscription, subscription_is_new_baas_subscription) || other.subscription_is_new_baas_subscription == subscription_is_new_baas_subscription) &&
            (identical(other.subscription_buy_now_button_text, subscription_buy_now_button_text) || other.subscription_buy_now_button_text == subscription_buy_now_button_text) &&
            (identical(other.subscription_buy_now_button_text2, subscription_buy_now_button_text2) || other.subscription_buy_now_button_text2 == subscription_buy_now_button_text2) &&
            (identical(other.subscription_is_purchasable, subscription_is_purchasable) || other.subscription_is_purchasable == subscription_is_purchasable) &&
            (identical(other.subscription_is_limited, subscription_is_limited) || other.subscription_is_limited == subscription_is_limited) &&
            (identical(other.is_basic_setup_complete, is_basic_setup_complete) || other.is_basic_setup_complete == is_basic_setup_complete) &&
            (identical(other.subscription_job_is_user_defined_number, subscription_job_is_user_defined_number) || other.subscription_job_is_user_defined_number == subscription_job_is_user_defined_number) &&
            (identical(other.subscription_exclude_manual_timesheet_entries, subscription_exclude_manual_timesheet_entries) || other.subscription_exclude_manual_timesheet_entries == subscription_exclude_manual_timesheet_entries) &&
            (identical(other.subscription_job_planning_job_color_source, subscription_job_planning_job_color_source) || other.subscription_job_planning_job_color_source == subscription_job_planning_job_color_source) &&
            (identical(other.subscription_job_planning_task_color_source, subscription_job_planning_task_color_source) || other.subscription_job_planning_task_color_source == subscription_job_planning_task_color_source) &&
            (identical(other.subscription_job_planning_duration_units, subscription_job_planning_duration_units) || other.subscription_job_planning_duration_units == subscription_job_planning_duration_units) &&
            (identical(other.subscription_job_planning_display_hover_text, subscription_job_planning_display_hover_text) || other.subscription_job_planning_display_hover_text == subscription_job_planning_display_hover_text) &&
            (identical(other.subscription_job_planning_working_days, subscription_job_planning_working_days) || other.subscription_job_planning_working_days == subscription_job_planning_working_days) &&
            (identical(other.subscription_job_planning_work_start_time, subscription_job_planning_work_start_time) || other.subscription_job_planning_work_start_time == subscription_job_planning_work_start_time) &&
            (identical(other.subscription_job_planning_work_end_time, subscription_job_planning_work_end_time) || other.subscription_job_planning_work_end_time == subscription_job_planning_work_end_time) &&
            (identical(other.subscription_max_attachment_size, subscription_max_attachment_size) || other.subscription_max_attachment_size == subscription_max_attachment_size) &&
            (identical(other.subscription_collect_wip_data, subscription_collect_wip_data) || other.subscription_collect_wip_data == subscription_collect_wip_data) &&
            (identical(other.subscription_is_detailed_back_costing_enabled, subscription_is_detailed_back_costing_enabled) || other.subscription_is_detailed_back_costing_enabled == subscription_is_detailed_back_costing_enabled) &&
            (identical(other.subscription_is_beta_tester, subscription_is_beta_tester) || other.subscription_is_beta_tester == subscription_is_beta_tester));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        subscription_id,
        subscription_public_name,
        subscription_plan,
        subscription_plan_minor,
        subscription_plan_name,
        contact_id,
        const DeepCollectionEquality().hash(subrole_id),
        const DeepCollectionEquality().hash(subrole_name),
        is_admin,
        permissions,
        subscription_is_setup_complete,
        subscription_is_trial,
        subscription_is_paying,
        const DeepCollectionEquality().hash(subscription_accounting_provider),
        subscription_is_messaging_enabled,
        subscription_is_sms_enabled,
        subscription_is_email_enabled,
        subscription_order_is_single_supplier,
        subscription_is_job_and_booking_site,
        contact,
        accounting_setup,
        subscription_is_buy_now_button_visible,
        const DeepCollectionEquality()
            .hash(subscription_chargify_subscription_id),
        const DeepCollectionEquality()
            .hash(subscription_chargify_customer_reference),
        subscription_is_new_baas_subscription,
        subscription_buy_now_button_text,
        subscription_buy_now_button_text2,
        subscription_is_purchasable,
        subscription_is_limited,
        is_basic_setup_complete,
        subscription_job_is_user_defined_number,
        subscription_exclude_manual_timesheet_entries,
        subscription_job_planning_job_color_source,
        subscription_job_planning_task_color_source,
        subscription_job_planning_duration_units,
        subscription_job_planning_display_hover_text,
        subscription_job_planning_working_days,
        subscription_job_planning_work_start_time,
        subscription_job_planning_work_end_time,
        subscription_max_attachment_size,
        subscription_collect_wip_data,
        subscription_is_detailed_back_costing_enabled,
        subscription_is_beta_tester
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubscriptionCopyWith<_$_Subscription> get copyWith =>
      __$$_SubscriptionCopyWithImpl<_$_Subscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubscriptionToJson(
      this,
    );
  }
}

abstract class _Subscription implements Subscription {
  const factory _Subscription(
      {final int? subscription_id,
      final String? subscription_public_name,
      final int? subscription_plan,
      final int? subscription_plan_minor,
      final String? subscription_plan_name,
      final int? contact_id,
      final dynamic subrole_id,
      final dynamic subrole_name,
      final bool? is_admin,
      final Permissions? permissions,
      final bool? subscription_is_setup_complete,
      final bool? subscription_is_trial,
      final bool? subscription_is_paying,
      final dynamic subscription_accounting_provider,
      final bool? subscription_is_messaging_enabled,
      final bool? subscription_is_sms_enabled,
      final bool? subscription_is_email_enabled,
      final bool? subscription_order_is_single_supplier,
      final bool? subscription_is_job_and_booking_site,
      final Contact? contact,
      final AccountingSetup? accounting_setup,
      final bool? subscription_is_buy_now_button_visible,
      final dynamic subscription_chargify_subscription_id,
      final dynamic subscription_chargify_customer_reference,
      final bool? subscription_is_new_baas_subscription,
      final String? subscription_buy_now_button_text,
      final String? subscription_buy_now_button_text2,
      final bool? subscription_is_purchasable,
      final bool? subscription_is_limited,
      final bool? is_basic_setup_complete,
      final bool? subscription_job_is_user_defined_number,
      final bool? subscription_exclude_manual_timesheet_entries,
      final int? subscription_job_planning_job_color_source,
      final int? subscription_job_planning_task_color_source,
      final int? subscription_job_planning_duration_units,
      final bool? subscription_job_planning_display_hover_text,
      final int? subscription_job_planning_working_days,
      final int? subscription_job_planning_work_start_time,
      final int? subscription_job_planning_work_end_time,
      final int? subscription_max_attachment_size,
      final bool? subscription_collect_wip_data,
      final bool? subscription_is_detailed_back_costing_enabled,
      final bool? subscription_is_beta_tester}) = _$_Subscription;

  factory _Subscription.fromJson(Map<String, dynamic> json) =
      _$_Subscription.fromJson;

  @override
  int? get subscription_id;
  @override
  String? get subscription_public_name;
  @override
  int? get subscription_plan;
  @override
  int? get subscription_plan_minor;
  @override
  String? get subscription_plan_name;
  @override
  int? get contact_id;
  @override
  dynamic get subrole_id;
  @override
  dynamic get subrole_name;
  @override
  bool? get is_admin;
  @override
  Permissions? get permissions;
  @override
  bool? get subscription_is_setup_complete;
  @override
  bool? get subscription_is_trial;
  @override
  bool? get subscription_is_paying;
  @override
  dynamic get subscription_accounting_provider;
  @override
  bool? get subscription_is_messaging_enabled;
  @override
  bool? get subscription_is_sms_enabled;
  @override
  bool? get subscription_is_email_enabled;
  @override
  bool? get subscription_order_is_single_supplier;
  @override
  bool? get subscription_is_job_and_booking_site;
  @override
  Contact? get contact;
  @override
  AccountingSetup? get accounting_setup;
  @override
  bool? get subscription_is_buy_now_button_visible;
  @override
  dynamic get subscription_chargify_subscription_id;
  @override
  dynamic get subscription_chargify_customer_reference;
  @override
  bool? get subscription_is_new_baas_subscription;
  @override
  String? get subscription_buy_now_button_text;
  @override
  String? get subscription_buy_now_button_text2;
  @override
  bool? get subscription_is_purchasable;
  @override
  bool? get subscription_is_limited;
  @override
  bool? get is_basic_setup_complete;
  @override
  bool? get subscription_job_is_user_defined_number;
  @override
  bool? get subscription_exclude_manual_timesheet_entries;
  @override
  int? get subscription_job_planning_job_color_source;
  @override
  int? get subscription_job_planning_task_color_source;
  @override
  int? get subscription_job_planning_duration_units;
  @override
  bool? get subscription_job_planning_display_hover_text;
  @override
  int? get subscription_job_planning_working_days;
  @override
  int? get subscription_job_planning_work_start_time;
  @override
  int? get subscription_job_planning_work_end_time;
  @override
  int? get subscription_max_attachment_size;
  @override
  bool? get subscription_collect_wip_data;
  @override
  bool? get subscription_is_detailed_back_costing_enabled;
  @override
  bool? get subscription_is_beta_tester;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriptionCopyWith<_$_Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountingSetup _$AccountingSetupFromJson(Map<String, dynamic> json) {
  return _AccountingSetup.fromJson(json);
}

/// @nodoc
mixin _$AccountingSetup {
  int? get subscription_id => throw _privateConstructorUsedError;
  String? get subscription_currency => throw _privateConstructorUsedError;
  dynamic get subscription_accounting_provider =>
      throw _privateConstructorUsedError;
  bool? get subscription_is_payroll_enabled =>
      throw _privateConstructorUsedError;
  bool? get subscription_is_using_accounting_provider_payroll =>
      throw _privateConstructorUsedError;
  bool? get subscription_is_taxrates_setup_valid =>
      throw _privateConstructorUsedError;
  DefaultTaxrateFor? get default_taxrate_for_sales =>
      throw _privateConstructorUsedError;
  DefaultTaxrateFor? get default_taxrate_for_purchases =>
      throw _privateConstructorUsedError;
  dynamic get subscription_accounting_provider_info =>
      throw _privateConstructorUsedError;
  Map<String, bool>? get subscription_quote_settings =>
      throw _privateConstructorUsedError;
  Map<String, bool>? get subscription_order_settings =>
      throw _privateConstructorUsedError;
  Map<String, bool>? get subscription_invoice_settings =>
      throw _privateConstructorUsedError;
  Map<String, bool>? get subscription_supplier_invoice_settings =>
      throw _privateConstructorUsedError;
  Map<String, bool>? get subscription_template_settings =>
      throw _privateConstructorUsedError;
  Map<String, bool>? get subscription_actuals_settings =>
      throw _privateConstructorUsedError;
  String? get subscription_country_code => throw _privateConstructorUsedError;
  SubscriptionGpsTrackingPreferences?
      get subscription_gps_tracking_preferences =>
          throw _privateConstructorUsedError;
  String? get subscription_invoice_default_title =>
      throw _privateConstructorUsedError;
  String? get subscription_quote_default_title =>
      throw _privateConstructorUsedError;
  String? get subscription_order_default_title =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountingSetupCopyWith<AccountingSetup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountingSetupCopyWith<$Res> {
  factory $AccountingSetupCopyWith(
          AccountingSetup value, $Res Function(AccountingSetup) then) =
      _$AccountingSetupCopyWithImpl<$Res, AccountingSetup>;
  @useResult
  $Res call(
      {int? subscription_id,
      String? subscription_currency,
      dynamic subscription_accounting_provider,
      bool? subscription_is_payroll_enabled,
      bool? subscription_is_using_accounting_provider_payroll,
      bool? subscription_is_taxrates_setup_valid,
      DefaultTaxrateFor? default_taxrate_for_sales,
      DefaultTaxrateFor? default_taxrate_for_purchases,
      dynamic subscription_accounting_provider_info,
      Map<String, bool>? subscription_quote_settings,
      Map<String, bool>? subscription_order_settings,
      Map<String, bool>? subscription_invoice_settings,
      Map<String, bool>? subscription_supplier_invoice_settings,
      Map<String, bool>? subscription_template_settings,
      Map<String, bool>? subscription_actuals_settings,
      String? subscription_country_code,
      SubscriptionGpsTrackingPreferences? subscription_gps_tracking_preferences,
      String? subscription_invoice_default_title,
      String? subscription_quote_default_title,
      String? subscription_order_default_title});

  $DefaultTaxrateForCopyWith<$Res>? get default_taxrate_for_sales;
  $DefaultTaxrateForCopyWith<$Res>? get default_taxrate_for_purchases;
  $SubscriptionGpsTrackingPreferencesCopyWith<$Res>?
      get subscription_gps_tracking_preferences;
}

/// @nodoc
class _$AccountingSetupCopyWithImpl<$Res, $Val extends AccountingSetup>
    implements $AccountingSetupCopyWith<$Res> {
  _$AccountingSetupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription_id = freezed,
    Object? subscription_currency = freezed,
    Object? subscription_accounting_provider = freezed,
    Object? subscription_is_payroll_enabled = freezed,
    Object? subscription_is_using_accounting_provider_payroll = freezed,
    Object? subscription_is_taxrates_setup_valid = freezed,
    Object? default_taxrate_for_sales = freezed,
    Object? default_taxrate_for_purchases = freezed,
    Object? subscription_accounting_provider_info = freezed,
    Object? subscription_quote_settings = freezed,
    Object? subscription_order_settings = freezed,
    Object? subscription_invoice_settings = freezed,
    Object? subscription_supplier_invoice_settings = freezed,
    Object? subscription_template_settings = freezed,
    Object? subscription_actuals_settings = freezed,
    Object? subscription_country_code = freezed,
    Object? subscription_gps_tracking_preferences = freezed,
    Object? subscription_invoice_default_title = freezed,
    Object? subscription_quote_default_title = freezed,
    Object? subscription_order_default_title = freezed,
  }) {
    return _then(_value.copyWith(
      subscription_id: freezed == subscription_id
          ? _value.subscription_id
          : subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_currency: freezed == subscription_currency
          ? _value.subscription_currency
          : subscription_currency // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_accounting_provider: freezed ==
              subscription_accounting_provider
          ? _value.subscription_accounting_provider
          : subscription_accounting_provider // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscription_is_payroll_enabled: freezed ==
              subscription_is_payroll_enabled
          ? _value.subscription_is_payroll_enabled
          : subscription_is_payroll_enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_using_accounting_provider_payroll: freezed ==
              subscription_is_using_accounting_provider_payroll
          ? _value.subscription_is_using_accounting_provider_payroll
          : subscription_is_using_accounting_provider_payroll // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_taxrates_setup_valid: freezed ==
              subscription_is_taxrates_setup_valid
          ? _value.subscription_is_taxrates_setup_valid
          : subscription_is_taxrates_setup_valid // ignore: cast_nullable_to_non_nullable
              as bool?,
      default_taxrate_for_sales: freezed == default_taxrate_for_sales
          ? _value.default_taxrate_for_sales
          : default_taxrate_for_sales // ignore: cast_nullable_to_non_nullable
              as DefaultTaxrateFor?,
      default_taxrate_for_purchases: freezed == default_taxrate_for_purchases
          ? _value.default_taxrate_for_purchases
          : default_taxrate_for_purchases // ignore: cast_nullable_to_non_nullable
              as DefaultTaxrateFor?,
      subscription_accounting_provider_info: freezed ==
              subscription_accounting_provider_info
          ? _value.subscription_accounting_provider_info
          : subscription_accounting_provider_info // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscription_quote_settings: freezed == subscription_quote_settings
          ? _value.subscription_quote_settings
          : subscription_quote_settings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      subscription_order_settings: freezed == subscription_order_settings
          ? _value.subscription_order_settings
          : subscription_order_settings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      subscription_invoice_settings: freezed == subscription_invoice_settings
          ? _value.subscription_invoice_settings
          : subscription_invoice_settings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      subscription_supplier_invoice_settings: freezed ==
              subscription_supplier_invoice_settings
          ? _value.subscription_supplier_invoice_settings
          : subscription_supplier_invoice_settings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      subscription_template_settings: freezed == subscription_template_settings
          ? _value.subscription_template_settings
          : subscription_template_settings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      subscription_actuals_settings: freezed == subscription_actuals_settings
          ? _value.subscription_actuals_settings
          : subscription_actuals_settings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      subscription_country_code: freezed == subscription_country_code
          ? _value.subscription_country_code
          : subscription_country_code // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_gps_tracking_preferences: freezed ==
              subscription_gps_tracking_preferences
          ? _value.subscription_gps_tracking_preferences
          : subscription_gps_tracking_preferences // ignore: cast_nullable_to_non_nullable
              as SubscriptionGpsTrackingPreferences?,
      subscription_invoice_default_title: freezed ==
              subscription_invoice_default_title
          ? _value.subscription_invoice_default_title
          : subscription_invoice_default_title // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_quote_default_title: freezed ==
              subscription_quote_default_title
          ? _value.subscription_quote_default_title
          : subscription_quote_default_title // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_order_default_title: freezed ==
              subscription_order_default_title
          ? _value.subscription_order_default_title
          : subscription_order_default_title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DefaultTaxrateForCopyWith<$Res>? get default_taxrate_for_sales {
    if (_value.default_taxrate_for_sales == null) {
      return null;
    }

    return $DefaultTaxrateForCopyWith<$Res>(_value.default_taxrate_for_sales!,
        (value) {
      return _then(_value.copyWith(default_taxrate_for_sales: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DefaultTaxrateForCopyWith<$Res>? get default_taxrate_for_purchases {
    if (_value.default_taxrate_for_purchases == null) {
      return null;
    }

    return $DefaultTaxrateForCopyWith<$Res>(
        _value.default_taxrate_for_purchases!, (value) {
      return _then(
          _value.copyWith(default_taxrate_for_purchases: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SubscriptionGpsTrackingPreferencesCopyWith<$Res>?
      get subscription_gps_tracking_preferences {
    if (_value.subscription_gps_tracking_preferences == null) {
      return null;
    }

    return $SubscriptionGpsTrackingPreferencesCopyWith<$Res>(
        _value.subscription_gps_tracking_preferences!, (value) {
      return _then(_value.copyWith(subscription_gps_tracking_preferences: value)
          as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AccountingSetupCopyWith<$Res>
    implements $AccountingSetupCopyWith<$Res> {
  factory _$$_AccountingSetupCopyWith(
          _$_AccountingSetup value, $Res Function(_$_AccountingSetup) then) =
      __$$_AccountingSetupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? subscription_id,
      String? subscription_currency,
      dynamic subscription_accounting_provider,
      bool? subscription_is_payroll_enabled,
      bool? subscription_is_using_accounting_provider_payroll,
      bool? subscription_is_taxrates_setup_valid,
      DefaultTaxrateFor? default_taxrate_for_sales,
      DefaultTaxrateFor? default_taxrate_for_purchases,
      dynamic subscription_accounting_provider_info,
      Map<String, bool>? subscription_quote_settings,
      Map<String, bool>? subscription_order_settings,
      Map<String, bool>? subscription_invoice_settings,
      Map<String, bool>? subscription_supplier_invoice_settings,
      Map<String, bool>? subscription_template_settings,
      Map<String, bool>? subscription_actuals_settings,
      String? subscription_country_code,
      SubscriptionGpsTrackingPreferences? subscription_gps_tracking_preferences,
      String? subscription_invoice_default_title,
      String? subscription_quote_default_title,
      String? subscription_order_default_title});

  @override
  $DefaultTaxrateForCopyWith<$Res>? get default_taxrate_for_sales;
  @override
  $DefaultTaxrateForCopyWith<$Res>? get default_taxrate_for_purchases;
  @override
  $SubscriptionGpsTrackingPreferencesCopyWith<$Res>?
      get subscription_gps_tracking_preferences;
}

/// @nodoc
class __$$_AccountingSetupCopyWithImpl<$Res>
    extends _$AccountingSetupCopyWithImpl<$Res, _$_AccountingSetup>
    implements _$$_AccountingSetupCopyWith<$Res> {
  __$$_AccountingSetupCopyWithImpl(
      _$_AccountingSetup _value, $Res Function(_$_AccountingSetup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription_id = freezed,
    Object? subscription_currency = freezed,
    Object? subscription_accounting_provider = freezed,
    Object? subscription_is_payroll_enabled = freezed,
    Object? subscription_is_using_accounting_provider_payroll = freezed,
    Object? subscription_is_taxrates_setup_valid = freezed,
    Object? default_taxrate_for_sales = freezed,
    Object? default_taxrate_for_purchases = freezed,
    Object? subscription_accounting_provider_info = freezed,
    Object? subscription_quote_settings = freezed,
    Object? subscription_order_settings = freezed,
    Object? subscription_invoice_settings = freezed,
    Object? subscription_supplier_invoice_settings = freezed,
    Object? subscription_template_settings = freezed,
    Object? subscription_actuals_settings = freezed,
    Object? subscription_country_code = freezed,
    Object? subscription_gps_tracking_preferences = freezed,
    Object? subscription_invoice_default_title = freezed,
    Object? subscription_quote_default_title = freezed,
    Object? subscription_order_default_title = freezed,
  }) {
    return _then(_$_AccountingSetup(
      subscription_id: freezed == subscription_id
          ? _value.subscription_id
          : subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_currency: freezed == subscription_currency
          ? _value.subscription_currency
          : subscription_currency // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_accounting_provider: freezed ==
              subscription_accounting_provider
          ? _value.subscription_accounting_provider
          : subscription_accounting_provider // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscription_is_payroll_enabled: freezed ==
              subscription_is_payroll_enabled
          ? _value.subscription_is_payroll_enabled
          : subscription_is_payroll_enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_using_accounting_provider_payroll: freezed ==
              subscription_is_using_accounting_provider_payroll
          ? _value.subscription_is_using_accounting_provider_payroll
          : subscription_is_using_accounting_provider_payroll // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_taxrates_setup_valid: freezed ==
              subscription_is_taxrates_setup_valid
          ? _value.subscription_is_taxrates_setup_valid
          : subscription_is_taxrates_setup_valid // ignore: cast_nullable_to_non_nullable
              as bool?,
      default_taxrate_for_sales: freezed == default_taxrate_for_sales
          ? _value.default_taxrate_for_sales
          : default_taxrate_for_sales // ignore: cast_nullable_to_non_nullable
              as DefaultTaxrateFor?,
      default_taxrate_for_purchases: freezed == default_taxrate_for_purchases
          ? _value.default_taxrate_for_purchases
          : default_taxrate_for_purchases // ignore: cast_nullable_to_non_nullable
              as DefaultTaxrateFor?,
      subscription_accounting_provider_info: freezed ==
              subscription_accounting_provider_info
          ? _value.subscription_accounting_provider_info
          : subscription_accounting_provider_info // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscription_quote_settings: freezed == subscription_quote_settings
          ? _value._subscription_quote_settings
          : subscription_quote_settings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      subscription_order_settings: freezed == subscription_order_settings
          ? _value._subscription_order_settings
          : subscription_order_settings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      subscription_invoice_settings: freezed == subscription_invoice_settings
          ? _value._subscription_invoice_settings
          : subscription_invoice_settings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      subscription_supplier_invoice_settings: freezed ==
              subscription_supplier_invoice_settings
          ? _value._subscription_supplier_invoice_settings
          : subscription_supplier_invoice_settings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      subscription_template_settings: freezed == subscription_template_settings
          ? _value._subscription_template_settings
          : subscription_template_settings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      subscription_actuals_settings: freezed == subscription_actuals_settings
          ? _value._subscription_actuals_settings
          : subscription_actuals_settings // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      subscription_country_code: freezed == subscription_country_code
          ? _value.subscription_country_code
          : subscription_country_code // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_gps_tracking_preferences: freezed ==
              subscription_gps_tracking_preferences
          ? _value.subscription_gps_tracking_preferences
          : subscription_gps_tracking_preferences // ignore: cast_nullable_to_non_nullable
              as SubscriptionGpsTrackingPreferences?,
      subscription_invoice_default_title: freezed ==
              subscription_invoice_default_title
          ? _value.subscription_invoice_default_title
          : subscription_invoice_default_title // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_quote_default_title: freezed ==
              subscription_quote_default_title
          ? _value.subscription_quote_default_title
          : subscription_quote_default_title // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_order_default_title: freezed ==
              subscription_order_default_title
          ? _value.subscription_order_default_title
          : subscription_order_default_title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountingSetup implements _AccountingSetup {
  const _$_AccountingSetup(
      {this.subscription_id,
      this.subscription_currency,
      this.subscription_accounting_provider,
      this.subscription_is_payroll_enabled,
      this.subscription_is_using_accounting_provider_payroll,
      this.subscription_is_taxrates_setup_valid,
      this.default_taxrate_for_sales,
      this.default_taxrate_for_purchases,
      this.subscription_accounting_provider_info,
      final Map<String, bool>? subscription_quote_settings,
      final Map<String, bool>? subscription_order_settings,
      final Map<String, bool>? subscription_invoice_settings,
      final Map<String, bool>? subscription_supplier_invoice_settings,
      final Map<String, bool>? subscription_template_settings,
      final Map<String, bool>? subscription_actuals_settings,
      this.subscription_country_code,
      this.subscription_gps_tracking_preferences,
      this.subscription_invoice_default_title,
      this.subscription_quote_default_title,
      this.subscription_order_default_title})
      : _subscription_quote_settings = subscription_quote_settings,
        _subscription_order_settings = subscription_order_settings,
        _subscription_invoice_settings = subscription_invoice_settings,
        _subscription_supplier_invoice_settings =
            subscription_supplier_invoice_settings,
        _subscription_template_settings = subscription_template_settings,
        _subscription_actuals_settings = subscription_actuals_settings;

  factory _$_AccountingSetup.fromJson(Map<String, dynamic> json) =>
      _$$_AccountingSetupFromJson(json);

  @override
  final int? subscription_id;
  @override
  final String? subscription_currency;
  @override
  final dynamic subscription_accounting_provider;
  @override
  final bool? subscription_is_payroll_enabled;
  @override
  final bool? subscription_is_using_accounting_provider_payroll;
  @override
  final bool? subscription_is_taxrates_setup_valid;
  @override
  final DefaultTaxrateFor? default_taxrate_for_sales;
  @override
  final DefaultTaxrateFor? default_taxrate_for_purchases;
  @override
  final dynamic subscription_accounting_provider_info;
  final Map<String, bool>? _subscription_quote_settings;
  @override
  Map<String, bool>? get subscription_quote_settings {
    final value = _subscription_quote_settings;
    if (value == null) return null;
    if (_subscription_quote_settings is EqualUnmodifiableMapView)
      return _subscription_quote_settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, bool>? _subscription_order_settings;
  @override
  Map<String, bool>? get subscription_order_settings {
    final value = _subscription_order_settings;
    if (value == null) return null;
    if (_subscription_order_settings is EqualUnmodifiableMapView)
      return _subscription_order_settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, bool>? _subscription_invoice_settings;
  @override
  Map<String, bool>? get subscription_invoice_settings {
    final value = _subscription_invoice_settings;
    if (value == null) return null;
    if (_subscription_invoice_settings is EqualUnmodifiableMapView)
      return _subscription_invoice_settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, bool>? _subscription_supplier_invoice_settings;
  @override
  Map<String, bool>? get subscription_supplier_invoice_settings {
    final value = _subscription_supplier_invoice_settings;
    if (value == null) return null;
    if (_subscription_supplier_invoice_settings is EqualUnmodifiableMapView)
      return _subscription_supplier_invoice_settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, bool>? _subscription_template_settings;
  @override
  Map<String, bool>? get subscription_template_settings {
    final value = _subscription_template_settings;
    if (value == null) return null;
    if (_subscription_template_settings is EqualUnmodifiableMapView)
      return _subscription_template_settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, bool>? _subscription_actuals_settings;
  @override
  Map<String, bool>? get subscription_actuals_settings {
    final value = _subscription_actuals_settings;
    if (value == null) return null;
    if (_subscription_actuals_settings is EqualUnmodifiableMapView)
      return _subscription_actuals_settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? subscription_country_code;
  @override
  final SubscriptionGpsTrackingPreferences?
      subscription_gps_tracking_preferences;
  @override
  final String? subscription_invoice_default_title;
  @override
  final String? subscription_quote_default_title;
  @override
  final String? subscription_order_default_title;

  @override
  String toString() {
    return 'AccountingSetup(subscription_id: $subscription_id, subscription_currency: $subscription_currency, subscription_accounting_provider: $subscription_accounting_provider, subscription_is_payroll_enabled: $subscription_is_payroll_enabled, subscription_is_using_accounting_provider_payroll: $subscription_is_using_accounting_provider_payroll, subscription_is_taxrates_setup_valid: $subscription_is_taxrates_setup_valid, default_taxrate_for_sales: $default_taxrate_for_sales, default_taxrate_for_purchases: $default_taxrate_for_purchases, subscription_accounting_provider_info: $subscription_accounting_provider_info, subscription_quote_settings: $subscription_quote_settings, subscription_order_settings: $subscription_order_settings, subscription_invoice_settings: $subscription_invoice_settings, subscription_supplier_invoice_settings: $subscription_supplier_invoice_settings, subscription_template_settings: $subscription_template_settings, subscription_actuals_settings: $subscription_actuals_settings, subscription_country_code: $subscription_country_code, subscription_gps_tracking_preferences: $subscription_gps_tracking_preferences, subscription_invoice_default_title: $subscription_invoice_default_title, subscription_quote_default_title: $subscription_quote_default_title, subscription_order_default_title: $subscription_order_default_title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountingSetup &&
            (identical(other.subscription_id, subscription_id) ||
                other.subscription_id == subscription_id) &&
            (identical(other.subscription_currency, subscription_currency) ||
                other.subscription_currency == subscription_currency) &&
            const DeepCollectionEquality().equals(
                other.subscription_accounting_provider,
                subscription_accounting_provider) &&
            (identical(other.subscription_is_payroll_enabled, subscription_is_payroll_enabled) ||
                other.subscription_is_payroll_enabled ==
                    subscription_is_payroll_enabled) &&
            (identical(other.subscription_is_using_accounting_provider_payroll,
                    subscription_is_using_accounting_provider_payroll) ||
                other.subscription_is_using_accounting_provider_payroll ==
                    subscription_is_using_accounting_provider_payroll) &&
            (identical(other.subscription_is_taxrates_setup_valid, subscription_is_taxrates_setup_valid) ||
                other.subscription_is_taxrates_setup_valid ==
                    subscription_is_taxrates_setup_valid) &&
            (identical(other.default_taxrate_for_sales, default_taxrate_for_sales) ||
                other.default_taxrate_for_sales == default_taxrate_for_sales) &&
            (identical(other.default_taxrate_for_purchases, default_taxrate_for_purchases) ||
                other.default_taxrate_for_purchases ==
                    default_taxrate_for_purchases) &&
            const DeepCollectionEquality().equals(
                other.subscription_accounting_provider_info,
                subscription_accounting_provider_info) &&
            const DeepCollectionEquality().equals(
                other._subscription_quote_settings,
                _subscription_quote_settings) &&
            const DeepCollectionEquality().equals(
                other._subscription_order_settings,
                _subscription_order_settings) &&
            const DeepCollectionEquality().equals(
                other._subscription_invoice_settings, _subscription_invoice_settings) &&
            const DeepCollectionEquality().equals(other._subscription_supplier_invoice_settings, _subscription_supplier_invoice_settings) &&
            const DeepCollectionEquality().equals(other._subscription_template_settings, _subscription_template_settings) &&
            const DeepCollectionEquality().equals(other._subscription_actuals_settings, _subscription_actuals_settings) &&
            (identical(other.subscription_country_code, subscription_country_code) || other.subscription_country_code == subscription_country_code) &&
            (identical(other.subscription_gps_tracking_preferences, subscription_gps_tracking_preferences) || other.subscription_gps_tracking_preferences == subscription_gps_tracking_preferences) &&
            (identical(other.subscription_invoice_default_title, subscription_invoice_default_title) || other.subscription_invoice_default_title == subscription_invoice_default_title) &&
            (identical(other.subscription_quote_default_title, subscription_quote_default_title) || other.subscription_quote_default_title == subscription_quote_default_title) &&
            (identical(other.subscription_order_default_title, subscription_order_default_title) || other.subscription_order_default_title == subscription_order_default_title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        subscription_id,
        subscription_currency,
        const DeepCollectionEquality().hash(subscription_accounting_provider),
        subscription_is_payroll_enabled,
        subscription_is_using_accounting_provider_payroll,
        subscription_is_taxrates_setup_valid,
        default_taxrate_for_sales,
        default_taxrate_for_purchases,
        const DeepCollectionEquality()
            .hash(subscription_accounting_provider_info),
        const DeepCollectionEquality().hash(_subscription_quote_settings),
        const DeepCollectionEquality().hash(_subscription_order_settings),
        const DeepCollectionEquality().hash(_subscription_invoice_settings),
        const DeepCollectionEquality()
            .hash(_subscription_supplier_invoice_settings),
        const DeepCollectionEquality().hash(_subscription_template_settings),
        const DeepCollectionEquality().hash(_subscription_actuals_settings),
        subscription_country_code,
        subscription_gps_tracking_preferences,
        subscription_invoice_default_title,
        subscription_quote_default_title,
        subscription_order_default_title
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountingSetupCopyWith<_$_AccountingSetup> get copyWith =>
      __$$_AccountingSetupCopyWithImpl<_$_AccountingSetup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountingSetupToJson(
      this,
    );
  }
}

abstract class _AccountingSetup implements AccountingSetup {
  const factory _AccountingSetup(
      {final int? subscription_id,
      final String? subscription_currency,
      final dynamic subscription_accounting_provider,
      final bool? subscription_is_payroll_enabled,
      final bool? subscription_is_using_accounting_provider_payroll,
      final bool? subscription_is_taxrates_setup_valid,
      final DefaultTaxrateFor? default_taxrate_for_sales,
      final DefaultTaxrateFor? default_taxrate_for_purchases,
      final dynamic subscription_accounting_provider_info,
      final Map<String, bool>? subscription_quote_settings,
      final Map<String, bool>? subscription_order_settings,
      final Map<String, bool>? subscription_invoice_settings,
      final Map<String, bool>? subscription_supplier_invoice_settings,
      final Map<String, bool>? subscription_template_settings,
      final Map<String, bool>? subscription_actuals_settings,
      final String? subscription_country_code,
      final SubscriptionGpsTrackingPreferences?
          subscription_gps_tracking_preferences,
      final String? subscription_invoice_default_title,
      final String? subscription_quote_default_title,
      final String? subscription_order_default_title}) = _$_AccountingSetup;

  factory _AccountingSetup.fromJson(Map<String, dynamic> json) =
      _$_AccountingSetup.fromJson;

  @override
  int? get subscription_id;
  @override
  String? get subscription_currency;
  @override
  dynamic get subscription_accounting_provider;
  @override
  bool? get subscription_is_payroll_enabled;
  @override
  bool? get subscription_is_using_accounting_provider_payroll;
  @override
  bool? get subscription_is_taxrates_setup_valid;
  @override
  DefaultTaxrateFor? get default_taxrate_for_sales;
  @override
  DefaultTaxrateFor? get default_taxrate_for_purchases;
  @override
  dynamic get subscription_accounting_provider_info;
  @override
  Map<String, bool>? get subscription_quote_settings;
  @override
  Map<String, bool>? get subscription_order_settings;
  @override
  Map<String, bool>? get subscription_invoice_settings;
  @override
  Map<String, bool>? get subscription_supplier_invoice_settings;
  @override
  Map<String, bool>? get subscription_template_settings;
  @override
  Map<String, bool>? get subscription_actuals_settings;
  @override
  String? get subscription_country_code;
  @override
  SubscriptionGpsTrackingPreferences? get subscription_gps_tracking_preferences;
  @override
  String? get subscription_invoice_default_title;
  @override
  String? get subscription_quote_default_title;
  @override
  String? get subscription_order_default_title;
  @override
  @JsonKey(ignore: true)
  _$$_AccountingSetupCopyWith<_$_AccountingSetup> get copyWith =>
      throw _privateConstructorUsedError;
}

DefaultTaxrateFor _$DefaultTaxrateForFromJson(Map<String, dynamic> json) {
  return _DefaultTaxrateFor.fromJson(json);
}

/// @nodoc
mixin _$DefaultTaxrateFor {
  int? get taxrate_id => throw _privateConstructorUsedError;
  double? get taxrate_rate => throw _privateConstructorUsedError;
  String? get taxrate_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultTaxrateForCopyWith<DefaultTaxrateFor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultTaxrateForCopyWith<$Res> {
  factory $DefaultTaxrateForCopyWith(
          DefaultTaxrateFor value, $Res Function(DefaultTaxrateFor) then) =
      _$DefaultTaxrateForCopyWithImpl<$Res, DefaultTaxrateFor>;
  @useResult
  $Res call({int? taxrate_id, double? taxrate_rate, String? taxrate_name});
}

/// @nodoc
class _$DefaultTaxrateForCopyWithImpl<$Res, $Val extends DefaultTaxrateFor>
    implements $DefaultTaxrateForCopyWith<$Res> {
  _$DefaultTaxrateForCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxrate_id = freezed,
    Object? taxrate_rate = freezed,
    Object? taxrate_name = freezed,
  }) {
    return _then(_value.copyWith(
      taxrate_id: freezed == taxrate_id
          ? _value.taxrate_id
          : taxrate_id // ignore: cast_nullable_to_non_nullable
              as int?,
      taxrate_rate: freezed == taxrate_rate
          ? _value.taxrate_rate
          : taxrate_rate // ignore: cast_nullable_to_non_nullable
              as double?,
      taxrate_name: freezed == taxrate_name
          ? _value.taxrate_name
          : taxrate_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DefaultTaxrateForCopyWith<$Res>
    implements $DefaultTaxrateForCopyWith<$Res> {
  factory _$$_DefaultTaxrateForCopyWith(_$_DefaultTaxrateFor value,
          $Res Function(_$_DefaultTaxrateFor) then) =
      __$$_DefaultTaxrateForCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? taxrate_id, double? taxrate_rate, String? taxrate_name});
}

/// @nodoc
class __$$_DefaultTaxrateForCopyWithImpl<$Res>
    extends _$DefaultTaxrateForCopyWithImpl<$Res, _$_DefaultTaxrateFor>
    implements _$$_DefaultTaxrateForCopyWith<$Res> {
  __$$_DefaultTaxrateForCopyWithImpl(
      _$_DefaultTaxrateFor _value, $Res Function(_$_DefaultTaxrateFor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxrate_id = freezed,
    Object? taxrate_rate = freezed,
    Object? taxrate_name = freezed,
  }) {
    return _then(_$_DefaultTaxrateFor(
      taxrate_id: freezed == taxrate_id
          ? _value.taxrate_id
          : taxrate_id // ignore: cast_nullable_to_non_nullable
              as int?,
      taxrate_rate: freezed == taxrate_rate
          ? _value.taxrate_rate
          : taxrate_rate // ignore: cast_nullable_to_non_nullable
              as double?,
      taxrate_name: freezed == taxrate_name
          ? _value.taxrate_name
          : taxrate_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DefaultTaxrateFor implements _DefaultTaxrateFor {
  const _$_DefaultTaxrateFor(
      {this.taxrate_id, this.taxrate_rate, this.taxrate_name});

  factory _$_DefaultTaxrateFor.fromJson(Map<String, dynamic> json) =>
      _$$_DefaultTaxrateForFromJson(json);

  @override
  final int? taxrate_id;
  @override
  final double? taxrate_rate;
  @override
  final String? taxrate_name;

  @override
  String toString() {
    return 'DefaultTaxrateFor(taxrate_id: $taxrate_id, taxrate_rate: $taxrate_rate, taxrate_name: $taxrate_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DefaultTaxrateFor &&
            (identical(other.taxrate_id, taxrate_id) ||
                other.taxrate_id == taxrate_id) &&
            (identical(other.taxrate_rate, taxrate_rate) ||
                other.taxrate_rate == taxrate_rate) &&
            (identical(other.taxrate_name, taxrate_name) ||
                other.taxrate_name == taxrate_name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, taxrate_id, taxrate_rate, taxrate_name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DefaultTaxrateForCopyWith<_$_DefaultTaxrateFor> get copyWith =>
      __$$_DefaultTaxrateForCopyWithImpl<_$_DefaultTaxrateFor>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DefaultTaxrateForToJson(
      this,
    );
  }
}

abstract class _DefaultTaxrateFor implements DefaultTaxrateFor {
  const factory _DefaultTaxrateFor(
      {final int? taxrate_id,
      final double? taxrate_rate,
      final String? taxrate_name}) = _$_DefaultTaxrateFor;

  factory _DefaultTaxrateFor.fromJson(Map<String, dynamic> json) =
      _$_DefaultTaxrateFor.fromJson;

  @override
  int? get taxrate_id;
  @override
  double? get taxrate_rate;
  @override
  String? get taxrate_name;
  @override
  @JsonKey(ignore: true)
  _$$_DefaultTaxrateForCopyWith<_$_DefaultTaxrateFor> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscriptionGpsTrackingPreferences _$SubscriptionGpsTrackingPreferencesFromJson(
    Map<String, dynamic> json) {
  return _SubscriptionGpsTrackingPreferences.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionGpsTrackingPreferences {
  bool? get subscription_timesheet_entries_gps_tracking =>
      throw _privateConstructorUsedError;
  bool? get subscription_job_and_booking_status_gps_tracking =>
      throw _privateConstructorUsedError;
  bool? get subscription_job_and_booking_onsite_gps_tracking =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionGpsTrackingPreferencesCopyWith<
          SubscriptionGpsTrackingPreferences>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionGpsTrackingPreferencesCopyWith<$Res> {
  factory $SubscriptionGpsTrackingPreferencesCopyWith(
          SubscriptionGpsTrackingPreferences value,
          $Res Function(SubscriptionGpsTrackingPreferences) then) =
      _$SubscriptionGpsTrackingPreferencesCopyWithImpl<$Res,
          SubscriptionGpsTrackingPreferences>;
  @useResult
  $Res call(
      {bool? subscription_timesheet_entries_gps_tracking,
      bool? subscription_job_and_booking_status_gps_tracking,
      bool? subscription_job_and_booking_onsite_gps_tracking});
}

/// @nodoc
class _$SubscriptionGpsTrackingPreferencesCopyWithImpl<$Res,
        $Val extends SubscriptionGpsTrackingPreferences>
    implements $SubscriptionGpsTrackingPreferencesCopyWith<$Res> {
  _$SubscriptionGpsTrackingPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription_timesheet_entries_gps_tracking = freezed,
    Object? subscription_job_and_booking_status_gps_tracking = freezed,
    Object? subscription_job_and_booking_onsite_gps_tracking = freezed,
  }) {
    return _then(_value.copyWith(
      subscription_timesheet_entries_gps_tracking: freezed ==
              subscription_timesheet_entries_gps_tracking
          ? _value.subscription_timesheet_entries_gps_tracking
          : subscription_timesheet_entries_gps_tracking // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_job_and_booking_status_gps_tracking: freezed ==
              subscription_job_and_booking_status_gps_tracking
          ? _value.subscription_job_and_booking_status_gps_tracking
          : subscription_job_and_booking_status_gps_tracking // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_job_and_booking_onsite_gps_tracking: freezed ==
              subscription_job_and_booking_onsite_gps_tracking
          ? _value.subscription_job_and_booking_onsite_gps_tracking
          : subscription_job_and_booking_onsite_gps_tracking // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubscriptionGpsTrackingPreferencesCopyWith<$Res>
    implements $SubscriptionGpsTrackingPreferencesCopyWith<$Res> {
  factory _$$_SubscriptionGpsTrackingPreferencesCopyWith(
          _$_SubscriptionGpsTrackingPreferences value,
          $Res Function(_$_SubscriptionGpsTrackingPreferences) then) =
      __$$_SubscriptionGpsTrackingPreferencesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? subscription_timesheet_entries_gps_tracking,
      bool? subscription_job_and_booking_status_gps_tracking,
      bool? subscription_job_and_booking_onsite_gps_tracking});
}

/// @nodoc
class __$$_SubscriptionGpsTrackingPreferencesCopyWithImpl<$Res>
    extends _$SubscriptionGpsTrackingPreferencesCopyWithImpl<$Res,
        _$_SubscriptionGpsTrackingPreferences>
    implements _$$_SubscriptionGpsTrackingPreferencesCopyWith<$Res> {
  __$$_SubscriptionGpsTrackingPreferencesCopyWithImpl(
      _$_SubscriptionGpsTrackingPreferences _value,
      $Res Function(_$_SubscriptionGpsTrackingPreferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription_timesheet_entries_gps_tracking = freezed,
    Object? subscription_job_and_booking_status_gps_tracking = freezed,
    Object? subscription_job_and_booking_onsite_gps_tracking = freezed,
  }) {
    return _then(_$_SubscriptionGpsTrackingPreferences(
      subscription_timesheet_entries_gps_tracking: freezed ==
              subscription_timesheet_entries_gps_tracking
          ? _value.subscription_timesheet_entries_gps_tracking
          : subscription_timesheet_entries_gps_tracking // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_job_and_booking_status_gps_tracking: freezed ==
              subscription_job_and_booking_status_gps_tracking
          ? _value.subscription_job_and_booking_status_gps_tracking
          : subscription_job_and_booking_status_gps_tracking // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_job_and_booking_onsite_gps_tracking: freezed ==
              subscription_job_and_booking_onsite_gps_tracking
          ? _value.subscription_job_and_booking_onsite_gps_tracking
          : subscription_job_and_booking_onsite_gps_tracking // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubscriptionGpsTrackingPreferences
    implements _SubscriptionGpsTrackingPreferences {
  const _$_SubscriptionGpsTrackingPreferences(
      {this.subscription_timesheet_entries_gps_tracking,
      this.subscription_job_and_booking_status_gps_tracking,
      this.subscription_job_and_booking_onsite_gps_tracking});

  factory _$_SubscriptionGpsTrackingPreferences.fromJson(
          Map<String, dynamic> json) =>
      _$$_SubscriptionGpsTrackingPreferencesFromJson(json);

  @override
  final bool? subscription_timesheet_entries_gps_tracking;
  @override
  final bool? subscription_job_and_booking_status_gps_tracking;
  @override
  final bool? subscription_job_and_booking_onsite_gps_tracking;

  @override
  String toString() {
    return 'SubscriptionGpsTrackingPreferences(subscription_timesheet_entries_gps_tracking: $subscription_timesheet_entries_gps_tracking, subscription_job_and_booking_status_gps_tracking: $subscription_job_and_booking_status_gps_tracking, subscription_job_and_booking_onsite_gps_tracking: $subscription_job_and_booking_onsite_gps_tracking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubscriptionGpsTrackingPreferences &&
            (identical(other.subscription_timesheet_entries_gps_tracking,
                    subscription_timesheet_entries_gps_tracking) ||
                other.subscription_timesheet_entries_gps_tracking ==
                    subscription_timesheet_entries_gps_tracking) &&
            (identical(other.subscription_job_and_booking_status_gps_tracking,
                    subscription_job_and_booking_status_gps_tracking) ||
                other.subscription_job_and_booking_status_gps_tracking ==
                    subscription_job_and_booking_status_gps_tracking) &&
            (identical(other.subscription_job_and_booking_onsite_gps_tracking,
                    subscription_job_and_booking_onsite_gps_tracking) ||
                other.subscription_job_and_booking_onsite_gps_tracking ==
                    subscription_job_and_booking_onsite_gps_tracking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      subscription_timesheet_entries_gps_tracking,
      subscription_job_and_booking_status_gps_tracking,
      subscription_job_and_booking_onsite_gps_tracking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubscriptionGpsTrackingPreferencesCopyWith<
          _$_SubscriptionGpsTrackingPreferences>
      get copyWith => __$$_SubscriptionGpsTrackingPreferencesCopyWithImpl<
          _$_SubscriptionGpsTrackingPreferences>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubscriptionGpsTrackingPreferencesToJson(
      this,
    );
  }
}

abstract class _SubscriptionGpsTrackingPreferences
    implements SubscriptionGpsTrackingPreferences {
  const factory _SubscriptionGpsTrackingPreferences(
          {final bool? subscription_timesheet_entries_gps_tracking,
          final bool? subscription_job_and_booking_status_gps_tracking,
          final bool? subscription_job_and_booking_onsite_gps_tracking}) =
      _$_SubscriptionGpsTrackingPreferences;

  factory _SubscriptionGpsTrackingPreferences.fromJson(
          Map<String, dynamic> json) =
      _$_SubscriptionGpsTrackingPreferences.fromJson;

  @override
  bool? get subscription_timesheet_entries_gps_tracking;
  @override
  bool? get subscription_job_and_booking_status_gps_tracking;
  @override
  bool? get subscription_job_and_booking_onsite_gps_tracking;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriptionGpsTrackingPreferencesCopyWith<
          _$_SubscriptionGpsTrackingPreferences>
      get copyWith => throw _privateConstructorUsedError;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  int? get contact_id => throw _privateConstructorUsedError;
  String? get contact_email => throw _privateConstructorUsedError;
  String? get contact_name_display => throw _privateConstructorUsedError;
  bool? get contact_is_user => throw _privateConstructorUsedError;
  dynamic get contact_phone_mobile => throw _privateConstructorUsedError;
  String? get contact_brush_colour_argb => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call(
      {int? contact_id,
      String? contact_email,
      String? contact_name_display,
      bool? contact_is_user,
      dynamic contact_phone_mobile,
      String? contact_brush_colour_argb});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact_id = freezed,
    Object? contact_email = freezed,
    Object? contact_name_display = freezed,
    Object? contact_is_user = freezed,
    Object? contact_phone_mobile = freezed,
    Object? contact_brush_colour_argb = freezed,
  }) {
    return _then(_value.copyWith(
      contact_id: freezed == contact_id
          ? _value.contact_id
          : contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contact_email: freezed == contact_email
          ? _value.contact_email
          : contact_email // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_name_display: freezed == contact_name_display
          ? _value.contact_name_display
          : contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_is_user: freezed == contact_is_user
          ? _value.contact_is_user
          : contact_is_user // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_phone_mobile: freezed == contact_phone_mobile
          ? _value.contact_phone_mobile
          : contact_phone_mobile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contact_brush_colour_argb: freezed == contact_brush_colour_argb
          ? _value.contact_brush_colour_argb
          : contact_brush_colour_argb // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$_ContactCopyWith(
          _$_Contact value, $Res Function(_$_Contact) then) =
      __$$_ContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? contact_id,
      String? contact_email,
      String? contact_name_display,
      bool? contact_is_user,
      dynamic contact_phone_mobile,
      String? contact_brush_colour_argb});
}

/// @nodoc
class __$$_ContactCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$_Contact>
    implements _$$_ContactCopyWith<$Res> {
  __$$_ContactCopyWithImpl(_$_Contact _value, $Res Function(_$_Contact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact_id = freezed,
    Object? contact_email = freezed,
    Object? contact_name_display = freezed,
    Object? contact_is_user = freezed,
    Object? contact_phone_mobile = freezed,
    Object? contact_brush_colour_argb = freezed,
  }) {
    return _then(_$_Contact(
      contact_id: freezed == contact_id
          ? _value.contact_id
          : contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contact_email: freezed == contact_email
          ? _value.contact_email
          : contact_email // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_name_display: freezed == contact_name_display
          ? _value.contact_name_display
          : contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_is_user: freezed == contact_is_user
          ? _value.contact_is_user
          : contact_is_user // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_phone_mobile: freezed == contact_phone_mobile
          ? _value.contact_phone_mobile
          : contact_phone_mobile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contact_brush_colour_argb: freezed == contact_brush_colour_argb
          ? _value.contact_brush_colour_argb
          : contact_brush_colour_argb // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Contact implements _Contact {
  const _$_Contact(
      {this.contact_id,
      this.contact_email,
      this.contact_name_display,
      this.contact_is_user,
      this.contact_phone_mobile,
      this.contact_brush_colour_argb});

  factory _$_Contact.fromJson(Map<String, dynamic> json) =>
      _$$_ContactFromJson(json);

  @override
  final int? contact_id;
  @override
  final String? contact_email;
  @override
  final String? contact_name_display;
  @override
  final bool? contact_is_user;
  @override
  final dynamic contact_phone_mobile;
  @override
  final String? contact_brush_colour_argb;

  @override
  String toString() {
    return 'Contact(contact_id: $contact_id, contact_email: $contact_email, contact_name_display: $contact_name_display, contact_is_user: $contact_is_user, contact_phone_mobile: $contact_phone_mobile, contact_brush_colour_argb: $contact_brush_colour_argb)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Contact &&
            (identical(other.contact_id, contact_id) ||
                other.contact_id == contact_id) &&
            (identical(other.contact_email, contact_email) ||
                other.contact_email == contact_email) &&
            (identical(other.contact_name_display, contact_name_display) ||
                other.contact_name_display == contact_name_display) &&
            (identical(other.contact_is_user, contact_is_user) ||
                other.contact_is_user == contact_is_user) &&
            const DeepCollectionEquality()
                .equals(other.contact_phone_mobile, contact_phone_mobile) &&
            (identical(other.contact_brush_colour_argb,
                    contact_brush_colour_argb) ||
                other.contact_brush_colour_argb == contact_brush_colour_argb));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      contact_id,
      contact_email,
      contact_name_display,
      contact_is_user,
      const DeepCollectionEquality().hash(contact_phone_mobile),
      contact_brush_colour_argb);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContactCopyWith<_$_Contact> get copyWith =>
      __$$_ContactCopyWithImpl<_$_Contact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactToJson(
      this,
    );
  }
}

abstract class _Contact implements Contact {
  const factory _Contact(
      {final int? contact_id,
      final String? contact_email,
      final String? contact_name_display,
      final bool? contact_is_user,
      final dynamic contact_phone_mobile,
      final String? contact_brush_colour_argb}) = _$_Contact;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$_Contact.fromJson;

  @override
  int? get contact_id;
  @override
  String? get contact_email;
  @override
  String? get contact_name_display;
  @override
  bool? get contact_is_user;
  @override
  dynamic get contact_phone_mobile;
  @override
  String? get contact_brush_colour_argb;
  @override
  @JsonKey(ignore: true)
  _$$_ContactCopyWith<_$_Contact> get copyWith =>
      throw _privateConstructorUsedError;
}

Permissions _$PermissionsFromJson(Map<String, dynamic> json) {
  return _Permissions.fromJson(json);
}

/// @nodoc
mixin _$Permissions {
  bool? get DashboardAccessEnabled => throw _privateConstructorUsedError;
  bool? get TimesheetsAccessEnabled => throw _privateConstructorUsedError;
  bool? get TimesheetsCanChangeBillableStatus =>
      throw _privateConstructorUsedError;
  bool? get TimesheetsCanAccessOtherUsers => throw _privateConstructorUsedError;
  bool? get TimesheetsCanReadOnlyAccessOtherUsers =>
      throw _privateConstructorUsedError;
  bool? get TimesheetsDurationEntryTypeEnabled =>
      throw _privateConstructorUsedError;
  bool? get TimesheetsHideViewJobButtonEnabled =>
      throw _privateConstructorUsedError;
  bool? get TimesheetsHideViewTaskButtonEnabled =>
      throw _privateConstructorUsedError;
  bool? get TimesheetsDescriptionMandatoryEnabled =>
      throw _privateConstructorUsedError;
  bool? get JobAddTimesheetEntryEnabled => throw _privateConstructorUsedError;
  bool? get BookingAddTimesheetEntryEnabled =>
      throw _privateConstructorUsedError;
  bool? get CalendarAccessEnabled => throw _privateConstructorUsedError;
  bool? get ActivityLogAccessEnabled => throw _privateConstructorUsedError;
  bool? get TemplateAccessEnabled => throw _privateConstructorUsedError;
  bool? get TemplatesEditable => throw _privateConstructorUsedError;
  bool? get QuoteAccessEnabled => throw _privateConstructorUsedError;
  bool? get QuotesEditable => throw _privateConstructorUsedError;
  bool? get QuotesSendable => throw _privateConstructorUsedError;
  bool? get QuotesAcceptable => throw _privateConstructorUsedError;
  bool? get OrderAccessEnabled => throw _privateConstructorUsedError;
  bool? get OrdersEditable => throw _privateConstructorUsedError;
  bool? get OrdersSendable => throw _privateConstructorUsedError;
  bool? get InvoiceAccessEnabled => throw _privateConstructorUsedError;
  bool? get InvoicesEditable => throw _privateConstructorUsedError;
  bool? get InvoicesSendable => throw _privateConstructorUsedError;
  bool? get InvoicesSyncable => throw _privateConstructorUsedError;
  bool? get PaymentsAndCreditNotesEnabled => throw _privateConstructorUsedError;
  bool? get SiPaymentsAndCreditNotesEnabled =>
      throw _privateConstructorUsedError;
  bool? get SupplierInvoiceAccessEnabled => throw _privateConstructorUsedError;
  bool? get SupplierInvoicesEditable => throw _privateConstructorUsedError;
  bool? get SupplierInvoicesSendable => throw _privateConstructorUsedError;
  bool? get SupplierInvoicesSyncable => throw _privateConstructorUsedError;
  bool? get JobAccessEnabled => throw _privateConstructorUsedError;
  bool? get JobEditAddEnabled => throw _privateConstructorUsedError;
  bool? get JobStatusEditable => throw _privateConstructorUsedError;
  bool? get JobCanComplete => throw _privateConstructorUsedError;
  String? get JobDataVisibility => throw _privateConstructorUsedError;
  bool? get JobCanAcceptReject => throw _privateConstructorUsedError;
  bool? get JobPhotosEnabled => throw _privateConstructorUsedError;
  bool? get JobPhotosEditable => throw _privateConstructorUsedError;
  bool? get JobNotesEnabled => throw _privateConstructorUsedError;
  bool? get JobNotesEditable => throw _privateConstructorUsedError;
  bool? get JobScribblesEnabled => throw _privateConstructorUsedError;
  bool? get JobScribblesEditable => throw _privateConstructorUsedError;
  bool? get JobFilesEnabled => throw _privateConstructorUsedError;
  bool? get JobFilesEditable => throw _privateConstructorUsedError;
  bool? get JobChargesEnabled => throw _privateConstructorUsedError;
  bool? get JobChargesEditable => throw _privateConstructorUsedError;
  bool? get JobChargesAllVisible => throw _privateConstructorUsedError;
  bool? get JobSheetsEnabled => throw _privateConstructorUsedError;
  bool? get JobTemplatesEnabled => throw _privateConstructorUsedError;
  bool? get BookingAccessEnabled => throw _privateConstructorUsedError;
  bool? get BookingEditAddEnabled => throw _privateConstructorUsedError;
  bool? get BookingStatusEditable => throw _privateConstructorUsedError;
  bool? get BookingCanComplete => throw _privateConstructorUsedError;
  bool? get BookingCanAcceptReject => throw _privateConstructorUsedError;
  String? get BookingDataVisibility => throw _privateConstructorUsedError;
  bool? get BookingPhotosEnabled => throw _privateConstructorUsedError;
  bool? get BookingPhotosEditable => throw _privateConstructorUsedError;
  bool? get BookingNotesEnabled => throw _privateConstructorUsedError;
  bool? get BookingNotesEditable => throw _privateConstructorUsedError;
  bool? get BookingScribblesEnabled => throw _privateConstructorUsedError;
  bool? get BookingScribblesEditable => throw _privateConstructorUsedError;
  bool? get BookingFilesEnabled => throw _privateConstructorUsedError;
  bool? get BookingFilesEditable => throw _privateConstructorUsedError;
  bool? get BookingChargesEnabled => throw _privateConstructorUsedError;
  bool? get BookingChargesEditable => throw _privateConstructorUsedError;
  bool? get BookingChargesAllVisible => throw _privateConstructorUsedError;
  bool? get ContactAccessEnabled => throw _privateConstructorUsedError;
  bool? get ContactEditAddEnabled => throw _privateConstructorUsedError;
  bool? get ContactViewContactDetailsWithin =>
      throw _privateConstructorUsedError;
  bool? get ContactNotesEnabled => throw _privateConstructorUsedError;
  bool? get ContactNotesEditable => throw _privateConstructorUsedError;
  bool? get ContactFilesEnabled => throw _privateConstructorUsedError;
  bool? get ContactFilesEditable => throw _privateConstructorUsedError;
  bool? get UserOnlyAccessEnabled => throw _privateConstructorUsedError;
  bool? get LivePriceBookAccessEnabled => throw _privateConstructorUsedError;
  bool? get ChargeAccessEnabled => throw _privateConstructorUsedError;
  bool? get ChargeEditAddEnabled => throw _privateConstructorUsedError;
  bool? get ChargePricingDetailsVisible => throw _privateConstructorUsedError;
  bool? get ChargeBuyPricesVisible => throw _privateConstructorUsedError;
  bool? get ChargeBuyPricesEditable => throw _privateConstructorUsedError;
  bool? get ChargeSellPricesVisible => throw _privateConstructorUsedError;
  bool? get ChargeSellPricesEditable => throw _privateConstructorUsedError;
  bool? get UnbilledChargeTotalsVisible => throw _privateConstructorUsedError;
  bool? get JobFinancialTotalsVisible => throw _privateConstructorUsedError;
  bool? get SectionCostRevenueVisible => throw _privateConstructorUsedError;
  bool? get JobAndBookingCostSummaryVisible =>
      throw _privateConstructorUsedError;
  bool? get CalendarDefaultNavigation => throw _privateConstructorUsedError;
  bool? get TimesheetsDefaultNavigation => throw _privateConstructorUsedError;
  bool? get JobsDefaultNavigation => throw _privateConstructorUsedError;
  bool? get BookingsDefaultNavigation => throw _privateConstructorUsedError;
  bool? get QuotesDefaultNavigation => throw _privateConstructorUsedError;
  bool? get OrdersDefaultNavigation => throw _privateConstructorUsedError;
  bool? get InvoicesDefaultNavigation => throw _privateConstructorUsedError;
  bool? get SupplierInvoicesDefaultNavigation =>
      throw _privateConstructorUsedError;
  bool? get ContactsDefaultNavigation => throw _privateConstructorUsedError;
  bool? get ChargesDefaultNavigation => throw _privateConstructorUsedError;
  bool? get JobPlanningDefaultNavigation => throw _privateConstructorUsedError;
  bool? get JobsNavigationEnabled => throw _privateConstructorUsedError;
  bool? get BookingsNavigationEnabled => throw _privateConstructorUsedError;
  bool? get ChargesNavigationEnabled => throw _privateConstructorUsedError;
  bool? get JobPlanningEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionsCopyWith<Permissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionsCopyWith<$Res> {
  factory $PermissionsCopyWith(
          Permissions value, $Res Function(Permissions) then) =
      _$PermissionsCopyWithImpl<$Res, Permissions>;
  @useResult
  $Res call(
      {bool? DashboardAccessEnabled,
      bool? TimesheetsAccessEnabled,
      bool? TimesheetsCanChangeBillableStatus,
      bool? TimesheetsCanAccessOtherUsers,
      bool? TimesheetsCanReadOnlyAccessOtherUsers,
      bool? TimesheetsDurationEntryTypeEnabled,
      bool? TimesheetsHideViewJobButtonEnabled,
      bool? TimesheetsHideViewTaskButtonEnabled,
      bool? TimesheetsDescriptionMandatoryEnabled,
      bool? JobAddTimesheetEntryEnabled,
      bool? BookingAddTimesheetEntryEnabled,
      bool? CalendarAccessEnabled,
      bool? ActivityLogAccessEnabled,
      bool? TemplateAccessEnabled,
      bool? TemplatesEditable,
      bool? QuoteAccessEnabled,
      bool? QuotesEditable,
      bool? QuotesSendable,
      bool? QuotesAcceptable,
      bool? OrderAccessEnabled,
      bool? OrdersEditable,
      bool? OrdersSendable,
      bool? InvoiceAccessEnabled,
      bool? InvoicesEditable,
      bool? InvoicesSendable,
      bool? InvoicesSyncable,
      bool? PaymentsAndCreditNotesEnabled,
      bool? SiPaymentsAndCreditNotesEnabled,
      bool? SupplierInvoiceAccessEnabled,
      bool? SupplierInvoicesEditable,
      bool? SupplierInvoicesSendable,
      bool? SupplierInvoicesSyncable,
      bool? JobAccessEnabled,
      bool? JobEditAddEnabled,
      bool? JobStatusEditable,
      bool? JobCanComplete,
      String? JobDataVisibility,
      bool? JobCanAcceptReject,
      bool? JobPhotosEnabled,
      bool? JobPhotosEditable,
      bool? JobNotesEnabled,
      bool? JobNotesEditable,
      bool? JobScribblesEnabled,
      bool? JobScribblesEditable,
      bool? JobFilesEnabled,
      bool? JobFilesEditable,
      bool? JobChargesEnabled,
      bool? JobChargesEditable,
      bool? JobChargesAllVisible,
      bool? JobSheetsEnabled,
      bool? JobTemplatesEnabled,
      bool? BookingAccessEnabled,
      bool? BookingEditAddEnabled,
      bool? BookingStatusEditable,
      bool? BookingCanComplete,
      bool? BookingCanAcceptReject,
      String? BookingDataVisibility,
      bool? BookingPhotosEnabled,
      bool? BookingPhotosEditable,
      bool? BookingNotesEnabled,
      bool? BookingNotesEditable,
      bool? BookingScribblesEnabled,
      bool? BookingScribblesEditable,
      bool? BookingFilesEnabled,
      bool? BookingFilesEditable,
      bool? BookingChargesEnabled,
      bool? BookingChargesEditable,
      bool? BookingChargesAllVisible,
      bool? ContactAccessEnabled,
      bool? ContactEditAddEnabled,
      bool? ContactViewContactDetailsWithin,
      bool? ContactNotesEnabled,
      bool? ContactNotesEditable,
      bool? ContactFilesEnabled,
      bool? ContactFilesEditable,
      bool? UserOnlyAccessEnabled,
      bool? LivePriceBookAccessEnabled,
      bool? ChargeAccessEnabled,
      bool? ChargeEditAddEnabled,
      bool? ChargePricingDetailsVisible,
      bool? ChargeBuyPricesVisible,
      bool? ChargeBuyPricesEditable,
      bool? ChargeSellPricesVisible,
      bool? ChargeSellPricesEditable,
      bool? UnbilledChargeTotalsVisible,
      bool? JobFinancialTotalsVisible,
      bool? SectionCostRevenueVisible,
      bool? JobAndBookingCostSummaryVisible,
      bool? CalendarDefaultNavigation,
      bool? TimesheetsDefaultNavigation,
      bool? JobsDefaultNavigation,
      bool? BookingsDefaultNavigation,
      bool? QuotesDefaultNavigation,
      bool? OrdersDefaultNavigation,
      bool? InvoicesDefaultNavigation,
      bool? SupplierInvoicesDefaultNavigation,
      bool? ContactsDefaultNavigation,
      bool? ChargesDefaultNavigation,
      bool? JobPlanningDefaultNavigation,
      bool? JobsNavigationEnabled,
      bool? BookingsNavigationEnabled,
      bool? ChargesNavigationEnabled,
      bool? JobPlanningEnabled});
}

/// @nodoc
class _$PermissionsCopyWithImpl<$Res, $Val extends Permissions>
    implements $PermissionsCopyWith<$Res> {
  _$PermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? DashboardAccessEnabled = freezed,
    Object? TimesheetsAccessEnabled = freezed,
    Object? TimesheetsCanChangeBillableStatus = freezed,
    Object? TimesheetsCanAccessOtherUsers = freezed,
    Object? TimesheetsCanReadOnlyAccessOtherUsers = freezed,
    Object? TimesheetsDurationEntryTypeEnabled = freezed,
    Object? TimesheetsHideViewJobButtonEnabled = freezed,
    Object? TimesheetsHideViewTaskButtonEnabled = freezed,
    Object? TimesheetsDescriptionMandatoryEnabled = freezed,
    Object? JobAddTimesheetEntryEnabled = freezed,
    Object? BookingAddTimesheetEntryEnabled = freezed,
    Object? CalendarAccessEnabled = freezed,
    Object? ActivityLogAccessEnabled = freezed,
    Object? TemplateAccessEnabled = freezed,
    Object? TemplatesEditable = freezed,
    Object? QuoteAccessEnabled = freezed,
    Object? QuotesEditable = freezed,
    Object? QuotesSendable = freezed,
    Object? QuotesAcceptable = freezed,
    Object? OrderAccessEnabled = freezed,
    Object? OrdersEditable = freezed,
    Object? OrdersSendable = freezed,
    Object? InvoiceAccessEnabled = freezed,
    Object? InvoicesEditable = freezed,
    Object? InvoicesSendable = freezed,
    Object? InvoicesSyncable = freezed,
    Object? PaymentsAndCreditNotesEnabled = freezed,
    Object? SiPaymentsAndCreditNotesEnabled = freezed,
    Object? SupplierInvoiceAccessEnabled = freezed,
    Object? SupplierInvoicesEditable = freezed,
    Object? SupplierInvoicesSendable = freezed,
    Object? SupplierInvoicesSyncable = freezed,
    Object? JobAccessEnabled = freezed,
    Object? JobEditAddEnabled = freezed,
    Object? JobStatusEditable = freezed,
    Object? JobCanComplete = freezed,
    Object? JobDataVisibility = freezed,
    Object? JobCanAcceptReject = freezed,
    Object? JobPhotosEnabled = freezed,
    Object? JobPhotosEditable = freezed,
    Object? JobNotesEnabled = freezed,
    Object? JobNotesEditable = freezed,
    Object? JobScribblesEnabled = freezed,
    Object? JobScribblesEditable = freezed,
    Object? JobFilesEnabled = freezed,
    Object? JobFilesEditable = freezed,
    Object? JobChargesEnabled = freezed,
    Object? JobChargesEditable = freezed,
    Object? JobChargesAllVisible = freezed,
    Object? JobSheetsEnabled = freezed,
    Object? JobTemplatesEnabled = freezed,
    Object? BookingAccessEnabled = freezed,
    Object? BookingEditAddEnabled = freezed,
    Object? BookingStatusEditable = freezed,
    Object? BookingCanComplete = freezed,
    Object? BookingCanAcceptReject = freezed,
    Object? BookingDataVisibility = freezed,
    Object? BookingPhotosEnabled = freezed,
    Object? BookingPhotosEditable = freezed,
    Object? BookingNotesEnabled = freezed,
    Object? BookingNotesEditable = freezed,
    Object? BookingScribblesEnabled = freezed,
    Object? BookingScribblesEditable = freezed,
    Object? BookingFilesEnabled = freezed,
    Object? BookingFilesEditable = freezed,
    Object? BookingChargesEnabled = freezed,
    Object? BookingChargesEditable = freezed,
    Object? BookingChargesAllVisible = freezed,
    Object? ContactAccessEnabled = freezed,
    Object? ContactEditAddEnabled = freezed,
    Object? ContactViewContactDetailsWithin = freezed,
    Object? ContactNotesEnabled = freezed,
    Object? ContactNotesEditable = freezed,
    Object? ContactFilesEnabled = freezed,
    Object? ContactFilesEditable = freezed,
    Object? UserOnlyAccessEnabled = freezed,
    Object? LivePriceBookAccessEnabled = freezed,
    Object? ChargeAccessEnabled = freezed,
    Object? ChargeEditAddEnabled = freezed,
    Object? ChargePricingDetailsVisible = freezed,
    Object? ChargeBuyPricesVisible = freezed,
    Object? ChargeBuyPricesEditable = freezed,
    Object? ChargeSellPricesVisible = freezed,
    Object? ChargeSellPricesEditable = freezed,
    Object? UnbilledChargeTotalsVisible = freezed,
    Object? JobFinancialTotalsVisible = freezed,
    Object? SectionCostRevenueVisible = freezed,
    Object? JobAndBookingCostSummaryVisible = freezed,
    Object? CalendarDefaultNavigation = freezed,
    Object? TimesheetsDefaultNavigation = freezed,
    Object? JobsDefaultNavigation = freezed,
    Object? BookingsDefaultNavigation = freezed,
    Object? QuotesDefaultNavigation = freezed,
    Object? OrdersDefaultNavigation = freezed,
    Object? InvoicesDefaultNavigation = freezed,
    Object? SupplierInvoicesDefaultNavigation = freezed,
    Object? ContactsDefaultNavigation = freezed,
    Object? ChargesDefaultNavigation = freezed,
    Object? JobPlanningDefaultNavigation = freezed,
    Object? JobsNavigationEnabled = freezed,
    Object? BookingsNavigationEnabled = freezed,
    Object? ChargesNavigationEnabled = freezed,
    Object? JobPlanningEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      DashboardAccessEnabled: freezed == DashboardAccessEnabled
          ? _value.DashboardAccessEnabled
          : DashboardAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsAccessEnabled: freezed == TimesheetsAccessEnabled
          ? _value.TimesheetsAccessEnabled
          : TimesheetsAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsCanChangeBillableStatus: freezed ==
              TimesheetsCanChangeBillableStatus
          ? _value.TimesheetsCanChangeBillableStatus
          : TimesheetsCanChangeBillableStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsCanAccessOtherUsers: freezed == TimesheetsCanAccessOtherUsers
          ? _value.TimesheetsCanAccessOtherUsers
          : TimesheetsCanAccessOtherUsers // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsCanReadOnlyAccessOtherUsers: freezed ==
              TimesheetsCanReadOnlyAccessOtherUsers
          ? _value.TimesheetsCanReadOnlyAccessOtherUsers
          : TimesheetsCanReadOnlyAccessOtherUsers // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsDurationEntryTypeEnabled: freezed ==
              TimesheetsDurationEntryTypeEnabled
          ? _value.TimesheetsDurationEntryTypeEnabled
          : TimesheetsDurationEntryTypeEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsHideViewJobButtonEnabled: freezed ==
              TimesheetsHideViewJobButtonEnabled
          ? _value.TimesheetsHideViewJobButtonEnabled
          : TimesheetsHideViewJobButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsHideViewTaskButtonEnabled: freezed ==
              TimesheetsHideViewTaskButtonEnabled
          ? _value.TimesheetsHideViewTaskButtonEnabled
          : TimesheetsHideViewTaskButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsDescriptionMandatoryEnabled: freezed ==
              TimesheetsDescriptionMandatoryEnabled
          ? _value.TimesheetsDescriptionMandatoryEnabled
          : TimesheetsDescriptionMandatoryEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobAddTimesheetEntryEnabled: freezed == JobAddTimesheetEntryEnabled
          ? _value.JobAddTimesheetEntryEnabled
          : JobAddTimesheetEntryEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingAddTimesheetEntryEnabled: freezed ==
              BookingAddTimesheetEntryEnabled
          ? _value.BookingAddTimesheetEntryEnabled
          : BookingAddTimesheetEntryEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      CalendarAccessEnabled: freezed == CalendarAccessEnabled
          ? _value.CalendarAccessEnabled
          : CalendarAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ActivityLogAccessEnabled: freezed == ActivityLogAccessEnabled
          ? _value.ActivityLogAccessEnabled
          : ActivityLogAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TemplateAccessEnabled: freezed == TemplateAccessEnabled
          ? _value.TemplateAccessEnabled
          : TemplateAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TemplatesEditable: freezed == TemplatesEditable
          ? _value.TemplatesEditable
          : TemplatesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      QuoteAccessEnabled: freezed == QuoteAccessEnabled
          ? _value.QuoteAccessEnabled
          : QuoteAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      QuotesEditable: freezed == QuotesEditable
          ? _value.QuotesEditable
          : QuotesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      QuotesSendable: freezed == QuotesSendable
          ? _value.QuotesSendable
          : QuotesSendable // ignore: cast_nullable_to_non_nullable
              as bool?,
      QuotesAcceptable: freezed == QuotesAcceptable
          ? _value.QuotesAcceptable
          : QuotesAcceptable // ignore: cast_nullable_to_non_nullable
              as bool?,
      OrderAccessEnabled: freezed == OrderAccessEnabled
          ? _value.OrderAccessEnabled
          : OrderAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      OrdersEditable: freezed == OrdersEditable
          ? _value.OrdersEditable
          : OrdersEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      OrdersSendable: freezed == OrdersSendable
          ? _value.OrdersSendable
          : OrdersSendable // ignore: cast_nullable_to_non_nullable
              as bool?,
      InvoiceAccessEnabled: freezed == InvoiceAccessEnabled
          ? _value.InvoiceAccessEnabled
          : InvoiceAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      InvoicesEditable: freezed == InvoicesEditable
          ? _value.InvoicesEditable
          : InvoicesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      InvoicesSendable: freezed == InvoicesSendable
          ? _value.InvoicesSendable
          : InvoicesSendable // ignore: cast_nullable_to_non_nullable
              as bool?,
      InvoicesSyncable: freezed == InvoicesSyncable
          ? _value.InvoicesSyncable
          : InvoicesSyncable // ignore: cast_nullable_to_non_nullable
              as bool?,
      PaymentsAndCreditNotesEnabled: freezed == PaymentsAndCreditNotesEnabled
          ? _value.PaymentsAndCreditNotesEnabled
          : PaymentsAndCreditNotesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      SiPaymentsAndCreditNotesEnabled: freezed ==
              SiPaymentsAndCreditNotesEnabled
          ? _value.SiPaymentsAndCreditNotesEnabled
          : SiPaymentsAndCreditNotesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      SupplierInvoiceAccessEnabled: freezed == SupplierInvoiceAccessEnabled
          ? _value.SupplierInvoiceAccessEnabled
          : SupplierInvoiceAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      SupplierInvoicesEditable: freezed == SupplierInvoicesEditable
          ? _value.SupplierInvoicesEditable
          : SupplierInvoicesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      SupplierInvoicesSendable: freezed == SupplierInvoicesSendable
          ? _value.SupplierInvoicesSendable
          : SupplierInvoicesSendable // ignore: cast_nullable_to_non_nullable
              as bool?,
      SupplierInvoicesSyncable: freezed == SupplierInvoicesSyncable
          ? _value.SupplierInvoicesSyncable
          : SupplierInvoicesSyncable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobAccessEnabled: freezed == JobAccessEnabled
          ? _value.JobAccessEnabled
          : JobAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobEditAddEnabled: freezed == JobEditAddEnabled
          ? _value.JobEditAddEnabled
          : JobEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobStatusEditable: freezed == JobStatusEditable
          ? _value.JobStatusEditable
          : JobStatusEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobCanComplete: freezed == JobCanComplete
          ? _value.JobCanComplete
          : JobCanComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobDataVisibility: freezed == JobDataVisibility
          ? _value.JobDataVisibility
          : JobDataVisibility // ignore: cast_nullable_to_non_nullable
              as String?,
      JobCanAcceptReject: freezed == JobCanAcceptReject
          ? _value.JobCanAcceptReject
          : JobCanAcceptReject // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobPhotosEnabled: freezed == JobPhotosEnabled
          ? _value.JobPhotosEnabled
          : JobPhotosEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobPhotosEditable: freezed == JobPhotosEditable
          ? _value.JobPhotosEditable
          : JobPhotosEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobNotesEnabled: freezed == JobNotesEnabled
          ? _value.JobNotesEnabled
          : JobNotesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobNotesEditable: freezed == JobNotesEditable
          ? _value.JobNotesEditable
          : JobNotesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobScribblesEnabled: freezed == JobScribblesEnabled
          ? _value.JobScribblesEnabled
          : JobScribblesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobScribblesEditable: freezed == JobScribblesEditable
          ? _value.JobScribblesEditable
          : JobScribblesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobFilesEnabled: freezed == JobFilesEnabled
          ? _value.JobFilesEnabled
          : JobFilesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobFilesEditable: freezed == JobFilesEditable
          ? _value.JobFilesEditable
          : JobFilesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobChargesEnabled: freezed == JobChargesEnabled
          ? _value.JobChargesEnabled
          : JobChargesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobChargesEditable: freezed == JobChargesEditable
          ? _value.JobChargesEditable
          : JobChargesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobChargesAllVisible: freezed == JobChargesAllVisible
          ? _value.JobChargesAllVisible
          : JobChargesAllVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobSheetsEnabled: freezed == JobSheetsEnabled
          ? _value.JobSheetsEnabled
          : JobSheetsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobTemplatesEnabled: freezed == JobTemplatesEnabled
          ? _value.JobTemplatesEnabled
          : JobTemplatesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingAccessEnabled: freezed == BookingAccessEnabled
          ? _value.BookingAccessEnabled
          : BookingAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingEditAddEnabled: freezed == BookingEditAddEnabled
          ? _value.BookingEditAddEnabled
          : BookingEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingStatusEditable: freezed == BookingStatusEditable
          ? _value.BookingStatusEditable
          : BookingStatusEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingCanComplete: freezed == BookingCanComplete
          ? _value.BookingCanComplete
          : BookingCanComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingCanAcceptReject: freezed == BookingCanAcceptReject
          ? _value.BookingCanAcceptReject
          : BookingCanAcceptReject // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingDataVisibility: freezed == BookingDataVisibility
          ? _value.BookingDataVisibility
          : BookingDataVisibility // ignore: cast_nullable_to_non_nullable
              as String?,
      BookingPhotosEnabled: freezed == BookingPhotosEnabled
          ? _value.BookingPhotosEnabled
          : BookingPhotosEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingPhotosEditable: freezed == BookingPhotosEditable
          ? _value.BookingPhotosEditable
          : BookingPhotosEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingNotesEnabled: freezed == BookingNotesEnabled
          ? _value.BookingNotesEnabled
          : BookingNotesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingNotesEditable: freezed == BookingNotesEditable
          ? _value.BookingNotesEditable
          : BookingNotesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingScribblesEnabled: freezed == BookingScribblesEnabled
          ? _value.BookingScribblesEnabled
          : BookingScribblesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingScribblesEditable: freezed == BookingScribblesEditable
          ? _value.BookingScribblesEditable
          : BookingScribblesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingFilesEnabled: freezed == BookingFilesEnabled
          ? _value.BookingFilesEnabled
          : BookingFilesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingFilesEditable: freezed == BookingFilesEditable
          ? _value.BookingFilesEditable
          : BookingFilesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingChargesEnabled: freezed == BookingChargesEnabled
          ? _value.BookingChargesEnabled
          : BookingChargesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingChargesEditable: freezed == BookingChargesEditable
          ? _value.BookingChargesEditable
          : BookingChargesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingChargesAllVisible: freezed == BookingChargesAllVisible
          ? _value.BookingChargesAllVisible
          : BookingChargesAllVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactAccessEnabled: freezed == ContactAccessEnabled
          ? _value.ContactAccessEnabled
          : ContactAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactEditAddEnabled: freezed == ContactEditAddEnabled
          ? _value.ContactEditAddEnabled
          : ContactEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactViewContactDetailsWithin: freezed ==
              ContactViewContactDetailsWithin
          ? _value.ContactViewContactDetailsWithin
          : ContactViewContactDetailsWithin // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactNotesEnabled: freezed == ContactNotesEnabled
          ? _value.ContactNotesEnabled
          : ContactNotesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactNotesEditable: freezed == ContactNotesEditable
          ? _value.ContactNotesEditable
          : ContactNotesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactFilesEnabled: freezed == ContactFilesEnabled
          ? _value.ContactFilesEnabled
          : ContactFilesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactFilesEditable: freezed == ContactFilesEditable
          ? _value.ContactFilesEditable
          : ContactFilesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      UserOnlyAccessEnabled: freezed == UserOnlyAccessEnabled
          ? _value.UserOnlyAccessEnabled
          : UserOnlyAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      LivePriceBookAccessEnabled: freezed == LivePriceBookAccessEnabled
          ? _value.LivePriceBookAccessEnabled
          : LivePriceBookAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeAccessEnabled: freezed == ChargeAccessEnabled
          ? _value.ChargeAccessEnabled
          : ChargeAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeEditAddEnabled: freezed == ChargeEditAddEnabled
          ? _value.ChargeEditAddEnabled
          : ChargeEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargePricingDetailsVisible: freezed == ChargePricingDetailsVisible
          ? _value.ChargePricingDetailsVisible
          : ChargePricingDetailsVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeBuyPricesVisible: freezed == ChargeBuyPricesVisible
          ? _value.ChargeBuyPricesVisible
          : ChargeBuyPricesVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeBuyPricesEditable: freezed == ChargeBuyPricesEditable
          ? _value.ChargeBuyPricesEditable
          : ChargeBuyPricesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeSellPricesVisible: freezed == ChargeSellPricesVisible
          ? _value.ChargeSellPricesVisible
          : ChargeSellPricesVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeSellPricesEditable: freezed == ChargeSellPricesEditable
          ? _value.ChargeSellPricesEditable
          : ChargeSellPricesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      UnbilledChargeTotalsVisible: freezed == UnbilledChargeTotalsVisible
          ? _value.UnbilledChargeTotalsVisible
          : UnbilledChargeTotalsVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobFinancialTotalsVisible: freezed == JobFinancialTotalsVisible
          ? _value.JobFinancialTotalsVisible
          : JobFinancialTotalsVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      SectionCostRevenueVisible: freezed == SectionCostRevenueVisible
          ? _value.SectionCostRevenueVisible
          : SectionCostRevenueVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobAndBookingCostSummaryVisible: freezed ==
              JobAndBookingCostSummaryVisible
          ? _value.JobAndBookingCostSummaryVisible
          : JobAndBookingCostSummaryVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      CalendarDefaultNavigation: freezed == CalendarDefaultNavigation
          ? _value.CalendarDefaultNavigation
          : CalendarDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsDefaultNavigation: freezed == TimesheetsDefaultNavigation
          ? _value.TimesheetsDefaultNavigation
          : TimesheetsDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobsDefaultNavigation: freezed == JobsDefaultNavigation
          ? _value.JobsDefaultNavigation
          : JobsDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingsDefaultNavigation: freezed == BookingsDefaultNavigation
          ? _value.BookingsDefaultNavigation
          : BookingsDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      QuotesDefaultNavigation: freezed == QuotesDefaultNavigation
          ? _value.QuotesDefaultNavigation
          : QuotesDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      OrdersDefaultNavigation: freezed == OrdersDefaultNavigation
          ? _value.OrdersDefaultNavigation
          : OrdersDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      InvoicesDefaultNavigation: freezed == InvoicesDefaultNavigation
          ? _value.InvoicesDefaultNavigation
          : InvoicesDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      SupplierInvoicesDefaultNavigation: freezed ==
              SupplierInvoicesDefaultNavigation
          ? _value.SupplierInvoicesDefaultNavigation
          : SupplierInvoicesDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactsDefaultNavigation: freezed == ContactsDefaultNavigation
          ? _value.ContactsDefaultNavigation
          : ContactsDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargesDefaultNavigation: freezed == ChargesDefaultNavigation
          ? _value.ChargesDefaultNavigation
          : ChargesDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobPlanningDefaultNavigation: freezed == JobPlanningDefaultNavigation
          ? _value.JobPlanningDefaultNavigation
          : JobPlanningDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobsNavigationEnabled: freezed == JobsNavigationEnabled
          ? _value.JobsNavigationEnabled
          : JobsNavigationEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingsNavigationEnabled: freezed == BookingsNavigationEnabled
          ? _value.BookingsNavigationEnabled
          : BookingsNavigationEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargesNavigationEnabled: freezed == ChargesNavigationEnabled
          ? _value.ChargesNavigationEnabled
          : ChargesNavigationEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobPlanningEnabled: freezed == JobPlanningEnabled
          ? _value.JobPlanningEnabled
          : JobPlanningEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PermissionsCopyWith<$Res>
    implements $PermissionsCopyWith<$Res> {
  factory _$$_PermissionsCopyWith(
          _$_Permissions value, $Res Function(_$_Permissions) then) =
      __$$_PermissionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? DashboardAccessEnabled,
      bool? TimesheetsAccessEnabled,
      bool? TimesheetsCanChangeBillableStatus,
      bool? TimesheetsCanAccessOtherUsers,
      bool? TimesheetsCanReadOnlyAccessOtherUsers,
      bool? TimesheetsDurationEntryTypeEnabled,
      bool? TimesheetsHideViewJobButtonEnabled,
      bool? TimesheetsHideViewTaskButtonEnabled,
      bool? TimesheetsDescriptionMandatoryEnabled,
      bool? JobAddTimesheetEntryEnabled,
      bool? BookingAddTimesheetEntryEnabled,
      bool? CalendarAccessEnabled,
      bool? ActivityLogAccessEnabled,
      bool? TemplateAccessEnabled,
      bool? TemplatesEditable,
      bool? QuoteAccessEnabled,
      bool? QuotesEditable,
      bool? QuotesSendable,
      bool? QuotesAcceptable,
      bool? OrderAccessEnabled,
      bool? OrdersEditable,
      bool? OrdersSendable,
      bool? InvoiceAccessEnabled,
      bool? InvoicesEditable,
      bool? InvoicesSendable,
      bool? InvoicesSyncable,
      bool? PaymentsAndCreditNotesEnabled,
      bool? SiPaymentsAndCreditNotesEnabled,
      bool? SupplierInvoiceAccessEnabled,
      bool? SupplierInvoicesEditable,
      bool? SupplierInvoicesSendable,
      bool? SupplierInvoicesSyncable,
      bool? JobAccessEnabled,
      bool? JobEditAddEnabled,
      bool? JobStatusEditable,
      bool? JobCanComplete,
      String? JobDataVisibility,
      bool? JobCanAcceptReject,
      bool? JobPhotosEnabled,
      bool? JobPhotosEditable,
      bool? JobNotesEnabled,
      bool? JobNotesEditable,
      bool? JobScribblesEnabled,
      bool? JobScribblesEditable,
      bool? JobFilesEnabled,
      bool? JobFilesEditable,
      bool? JobChargesEnabled,
      bool? JobChargesEditable,
      bool? JobChargesAllVisible,
      bool? JobSheetsEnabled,
      bool? JobTemplatesEnabled,
      bool? BookingAccessEnabled,
      bool? BookingEditAddEnabled,
      bool? BookingStatusEditable,
      bool? BookingCanComplete,
      bool? BookingCanAcceptReject,
      String? BookingDataVisibility,
      bool? BookingPhotosEnabled,
      bool? BookingPhotosEditable,
      bool? BookingNotesEnabled,
      bool? BookingNotesEditable,
      bool? BookingScribblesEnabled,
      bool? BookingScribblesEditable,
      bool? BookingFilesEnabled,
      bool? BookingFilesEditable,
      bool? BookingChargesEnabled,
      bool? BookingChargesEditable,
      bool? BookingChargesAllVisible,
      bool? ContactAccessEnabled,
      bool? ContactEditAddEnabled,
      bool? ContactViewContactDetailsWithin,
      bool? ContactNotesEnabled,
      bool? ContactNotesEditable,
      bool? ContactFilesEnabled,
      bool? ContactFilesEditable,
      bool? UserOnlyAccessEnabled,
      bool? LivePriceBookAccessEnabled,
      bool? ChargeAccessEnabled,
      bool? ChargeEditAddEnabled,
      bool? ChargePricingDetailsVisible,
      bool? ChargeBuyPricesVisible,
      bool? ChargeBuyPricesEditable,
      bool? ChargeSellPricesVisible,
      bool? ChargeSellPricesEditable,
      bool? UnbilledChargeTotalsVisible,
      bool? JobFinancialTotalsVisible,
      bool? SectionCostRevenueVisible,
      bool? JobAndBookingCostSummaryVisible,
      bool? CalendarDefaultNavigation,
      bool? TimesheetsDefaultNavigation,
      bool? JobsDefaultNavigation,
      bool? BookingsDefaultNavigation,
      bool? QuotesDefaultNavigation,
      bool? OrdersDefaultNavigation,
      bool? InvoicesDefaultNavigation,
      bool? SupplierInvoicesDefaultNavigation,
      bool? ContactsDefaultNavigation,
      bool? ChargesDefaultNavigation,
      bool? JobPlanningDefaultNavigation,
      bool? JobsNavigationEnabled,
      bool? BookingsNavigationEnabled,
      bool? ChargesNavigationEnabled,
      bool? JobPlanningEnabled});
}

/// @nodoc
class __$$_PermissionsCopyWithImpl<$Res>
    extends _$PermissionsCopyWithImpl<$Res, _$_Permissions>
    implements _$$_PermissionsCopyWith<$Res> {
  __$$_PermissionsCopyWithImpl(
      _$_Permissions _value, $Res Function(_$_Permissions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? DashboardAccessEnabled = freezed,
    Object? TimesheetsAccessEnabled = freezed,
    Object? TimesheetsCanChangeBillableStatus = freezed,
    Object? TimesheetsCanAccessOtherUsers = freezed,
    Object? TimesheetsCanReadOnlyAccessOtherUsers = freezed,
    Object? TimesheetsDurationEntryTypeEnabled = freezed,
    Object? TimesheetsHideViewJobButtonEnabled = freezed,
    Object? TimesheetsHideViewTaskButtonEnabled = freezed,
    Object? TimesheetsDescriptionMandatoryEnabled = freezed,
    Object? JobAddTimesheetEntryEnabled = freezed,
    Object? BookingAddTimesheetEntryEnabled = freezed,
    Object? CalendarAccessEnabled = freezed,
    Object? ActivityLogAccessEnabled = freezed,
    Object? TemplateAccessEnabled = freezed,
    Object? TemplatesEditable = freezed,
    Object? QuoteAccessEnabled = freezed,
    Object? QuotesEditable = freezed,
    Object? QuotesSendable = freezed,
    Object? QuotesAcceptable = freezed,
    Object? OrderAccessEnabled = freezed,
    Object? OrdersEditable = freezed,
    Object? OrdersSendable = freezed,
    Object? InvoiceAccessEnabled = freezed,
    Object? InvoicesEditable = freezed,
    Object? InvoicesSendable = freezed,
    Object? InvoicesSyncable = freezed,
    Object? PaymentsAndCreditNotesEnabled = freezed,
    Object? SiPaymentsAndCreditNotesEnabled = freezed,
    Object? SupplierInvoiceAccessEnabled = freezed,
    Object? SupplierInvoicesEditable = freezed,
    Object? SupplierInvoicesSendable = freezed,
    Object? SupplierInvoicesSyncable = freezed,
    Object? JobAccessEnabled = freezed,
    Object? JobEditAddEnabled = freezed,
    Object? JobStatusEditable = freezed,
    Object? JobCanComplete = freezed,
    Object? JobDataVisibility = freezed,
    Object? JobCanAcceptReject = freezed,
    Object? JobPhotosEnabled = freezed,
    Object? JobPhotosEditable = freezed,
    Object? JobNotesEnabled = freezed,
    Object? JobNotesEditable = freezed,
    Object? JobScribblesEnabled = freezed,
    Object? JobScribblesEditable = freezed,
    Object? JobFilesEnabled = freezed,
    Object? JobFilesEditable = freezed,
    Object? JobChargesEnabled = freezed,
    Object? JobChargesEditable = freezed,
    Object? JobChargesAllVisible = freezed,
    Object? JobSheetsEnabled = freezed,
    Object? JobTemplatesEnabled = freezed,
    Object? BookingAccessEnabled = freezed,
    Object? BookingEditAddEnabled = freezed,
    Object? BookingStatusEditable = freezed,
    Object? BookingCanComplete = freezed,
    Object? BookingCanAcceptReject = freezed,
    Object? BookingDataVisibility = freezed,
    Object? BookingPhotosEnabled = freezed,
    Object? BookingPhotosEditable = freezed,
    Object? BookingNotesEnabled = freezed,
    Object? BookingNotesEditable = freezed,
    Object? BookingScribblesEnabled = freezed,
    Object? BookingScribblesEditable = freezed,
    Object? BookingFilesEnabled = freezed,
    Object? BookingFilesEditable = freezed,
    Object? BookingChargesEnabled = freezed,
    Object? BookingChargesEditable = freezed,
    Object? BookingChargesAllVisible = freezed,
    Object? ContactAccessEnabled = freezed,
    Object? ContactEditAddEnabled = freezed,
    Object? ContactViewContactDetailsWithin = freezed,
    Object? ContactNotesEnabled = freezed,
    Object? ContactNotesEditable = freezed,
    Object? ContactFilesEnabled = freezed,
    Object? ContactFilesEditable = freezed,
    Object? UserOnlyAccessEnabled = freezed,
    Object? LivePriceBookAccessEnabled = freezed,
    Object? ChargeAccessEnabled = freezed,
    Object? ChargeEditAddEnabled = freezed,
    Object? ChargePricingDetailsVisible = freezed,
    Object? ChargeBuyPricesVisible = freezed,
    Object? ChargeBuyPricesEditable = freezed,
    Object? ChargeSellPricesVisible = freezed,
    Object? ChargeSellPricesEditable = freezed,
    Object? UnbilledChargeTotalsVisible = freezed,
    Object? JobFinancialTotalsVisible = freezed,
    Object? SectionCostRevenueVisible = freezed,
    Object? JobAndBookingCostSummaryVisible = freezed,
    Object? CalendarDefaultNavigation = freezed,
    Object? TimesheetsDefaultNavigation = freezed,
    Object? JobsDefaultNavigation = freezed,
    Object? BookingsDefaultNavigation = freezed,
    Object? QuotesDefaultNavigation = freezed,
    Object? OrdersDefaultNavigation = freezed,
    Object? InvoicesDefaultNavigation = freezed,
    Object? SupplierInvoicesDefaultNavigation = freezed,
    Object? ContactsDefaultNavigation = freezed,
    Object? ChargesDefaultNavigation = freezed,
    Object? JobPlanningDefaultNavigation = freezed,
    Object? JobsNavigationEnabled = freezed,
    Object? BookingsNavigationEnabled = freezed,
    Object? ChargesNavigationEnabled = freezed,
    Object? JobPlanningEnabled = freezed,
  }) {
    return _then(_$_Permissions(
      DashboardAccessEnabled: freezed == DashboardAccessEnabled
          ? _value.DashboardAccessEnabled
          : DashboardAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsAccessEnabled: freezed == TimesheetsAccessEnabled
          ? _value.TimesheetsAccessEnabled
          : TimesheetsAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsCanChangeBillableStatus: freezed ==
              TimesheetsCanChangeBillableStatus
          ? _value.TimesheetsCanChangeBillableStatus
          : TimesheetsCanChangeBillableStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsCanAccessOtherUsers: freezed == TimesheetsCanAccessOtherUsers
          ? _value.TimesheetsCanAccessOtherUsers
          : TimesheetsCanAccessOtherUsers // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsCanReadOnlyAccessOtherUsers: freezed ==
              TimesheetsCanReadOnlyAccessOtherUsers
          ? _value.TimesheetsCanReadOnlyAccessOtherUsers
          : TimesheetsCanReadOnlyAccessOtherUsers // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsDurationEntryTypeEnabled: freezed ==
              TimesheetsDurationEntryTypeEnabled
          ? _value.TimesheetsDurationEntryTypeEnabled
          : TimesheetsDurationEntryTypeEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsHideViewJobButtonEnabled: freezed ==
              TimesheetsHideViewJobButtonEnabled
          ? _value.TimesheetsHideViewJobButtonEnabled
          : TimesheetsHideViewJobButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsHideViewTaskButtonEnabled: freezed ==
              TimesheetsHideViewTaskButtonEnabled
          ? _value.TimesheetsHideViewTaskButtonEnabled
          : TimesheetsHideViewTaskButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsDescriptionMandatoryEnabled: freezed ==
              TimesheetsDescriptionMandatoryEnabled
          ? _value.TimesheetsDescriptionMandatoryEnabled
          : TimesheetsDescriptionMandatoryEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobAddTimesheetEntryEnabled: freezed == JobAddTimesheetEntryEnabled
          ? _value.JobAddTimesheetEntryEnabled
          : JobAddTimesheetEntryEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingAddTimesheetEntryEnabled: freezed ==
              BookingAddTimesheetEntryEnabled
          ? _value.BookingAddTimesheetEntryEnabled
          : BookingAddTimesheetEntryEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      CalendarAccessEnabled: freezed == CalendarAccessEnabled
          ? _value.CalendarAccessEnabled
          : CalendarAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ActivityLogAccessEnabled: freezed == ActivityLogAccessEnabled
          ? _value.ActivityLogAccessEnabled
          : ActivityLogAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TemplateAccessEnabled: freezed == TemplateAccessEnabled
          ? _value.TemplateAccessEnabled
          : TemplateAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      TemplatesEditable: freezed == TemplatesEditable
          ? _value.TemplatesEditable
          : TemplatesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      QuoteAccessEnabled: freezed == QuoteAccessEnabled
          ? _value.QuoteAccessEnabled
          : QuoteAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      QuotesEditable: freezed == QuotesEditable
          ? _value.QuotesEditable
          : QuotesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      QuotesSendable: freezed == QuotesSendable
          ? _value.QuotesSendable
          : QuotesSendable // ignore: cast_nullable_to_non_nullable
              as bool?,
      QuotesAcceptable: freezed == QuotesAcceptable
          ? _value.QuotesAcceptable
          : QuotesAcceptable // ignore: cast_nullable_to_non_nullable
              as bool?,
      OrderAccessEnabled: freezed == OrderAccessEnabled
          ? _value.OrderAccessEnabled
          : OrderAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      OrdersEditable: freezed == OrdersEditable
          ? _value.OrdersEditable
          : OrdersEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      OrdersSendable: freezed == OrdersSendable
          ? _value.OrdersSendable
          : OrdersSendable // ignore: cast_nullable_to_non_nullable
              as bool?,
      InvoiceAccessEnabled: freezed == InvoiceAccessEnabled
          ? _value.InvoiceAccessEnabled
          : InvoiceAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      InvoicesEditable: freezed == InvoicesEditable
          ? _value.InvoicesEditable
          : InvoicesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      InvoicesSendable: freezed == InvoicesSendable
          ? _value.InvoicesSendable
          : InvoicesSendable // ignore: cast_nullable_to_non_nullable
              as bool?,
      InvoicesSyncable: freezed == InvoicesSyncable
          ? _value.InvoicesSyncable
          : InvoicesSyncable // ignore: cast_nullable_to_non_nullable
              as bool?,
      PaymentsAndCreditNotesEnabled: freezed == PaymentsAndCreditNotesEnabled
          ? _value.PaymentsAndCreditNotesEnabled
          : PaymentsAndCreditNotesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      SiPaymentsAndCreditNotesEnabled: freezed ==
              SiPaymentsAndCreditNotesEnabled
          ? _value.SiPaymentsAndCreditNotesEnabled
          : SiPaymentsAndCreditNotesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      SupplierInvoiceAccessEnabled: freezed == SupplierInvoiceAccessEnabled
          ? _value.SupplierInvoiceAccessEnabled
          : SupplierInvoiceAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      SupplierInvoicesEditable: freezed == SupplierInvoicesEditable
          ? _value.SupplierInvoicesEditable
          : SupplierInvoicesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      SupplierInvoicesSendable: freezed == SupplierInvoicesSendable
          ? _value.SupplierInvoicesSendable
          : SupplierInvoicesSendable // ignore: cast_nullable_to_non_nullable
              as bool?,
      SupplierInvoicesSyncable: freezed == SupplierInvoicesSyncable
          ? _value.SupplierInvoicesSyncable
          : SupplierInvoicesSyncable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobAccessEnabled: freezed == JobAccessEnabled
          ? _value.JobAccessEnabled
          : JobAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobEditAddEnabled: freezed == JobEditAddEnabled
          ? _value.JobEditAddEnabled
          : JobEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobStatusEditable: freezed == JobStatusEditable
          ? _value.JobStatusEditable
          : JobStatusEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobCanComplete: freezed == JobCanComplete
          ? _value.JobCanComplete
          : JobCanComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobDataVisibility: freezed == JobDataVisibility
          ? _value.JobDataVisibility
          : JobDataVisibility // ignore: cast_nullable_to_non_nullable
              as String?,
      JobCanAcceptReject: freezed == JobCanAcceptReject
          ? _value.JobCanAcceptReject
          : JobCanAcceptReject // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobPhotosEnabled: freezed == JobPhotosEnabled
          ? _value.JobPhotosEnabled
          : JobPhotosEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobPhotosEditable: freezed == JobPhotosEditable
          ? _value.JobPhotosEditable
          : JobPhotosEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobNotesEnabled: freezed == JobNotesEnabled
          ? _value.JobNotesEnabled
          : JobNotesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobNotesEditable: freezed == JobNotesEditable
          ? _value.JobNotesEditable
          : JobNotesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobScribblesEnabled: freezed == JobScribblesEnabled
          ? _value.JobScribblesEnabled
          : JobScribblesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobScribblesEditable: freezed == JobScribblesEditable
          ? _value.JobScribblesEditable
          : JobScribblesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobFilesEnabled: freezed == JobFilesEnabled
          ? _value.JobFilesEnabled
          : JobFilesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobFilesEditable: freezed == JobFilesEditable
          ? _value.JobFilesEditable
          : JobFilesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobChargesEnabled: freezed == JobChargesEnabled
          ? _value.JobChargesEnabled
          : JobChargesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobChargesEditable: freezed == JobChargesEditable
          ? _value.JobChargesEditable
          : JobChargesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobChargesAllVisible: freezed == JobChargesAllVisible
          ? _value.JobChargesAllVisible
          : JobChargesAllVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobSheetsEnabled: freezed == JobSheetsEnabled
          ? _value.JobSheetsEnabled
          : JobSheetsEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobTemplatesEnabled: freezed == JobTemplatesEnabled
          ? _value.JobTemplatesEnabled
          : JobTemplatesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingAccessEnabled: freezed == BookingAccessEnabled
          ? _value.BookingAccessEnabled
          : BookingAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingEditAddEnabled: freezed == BookingEditAddEnabled
          ? _value.BookingEditAddEnabled
          : BookingEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingStatusEditable: freezed == BookingStatusEditable
          ? _value.BookingStatusEditable
          : BookingStatusEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingCanComplete: freezed == BookingCanComplete
          ? _value.BookingCanComplete
          : BookingCanComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingCanAcceptReject: freezed == BookingCanAcceptReject
          ? _value.BookingCanAcceptReject
          : BookingCanAcceptReject // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingDataVisibility: freezed == BookingDataVisibility
          ? _value.BookingDataVisibility
          : BookingDataVisibility // ignore: cast_nullable_to_non_nullable
              as String?,
      BookingPhotosEnabled: freezed == BookingPhotosEnabled
          ? _value.BookingPhotosEnabled
          : BookingPhotosEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingPhotosEditable: freezed == BookingPhotosEditable
          ? _value.BookingPhotosEditable
          : BookingPhotosEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingNotesEnabled: freezed == BookingNotesEnabled
          ? _value.BookingNotesEnabled
          : BookingNotesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingNotesEditable: freezed == BookingNotesEditable
          ? _value.BookingNotesEditable
          : BookingNotesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingScribblesEnabled: freezed == BookingScribblesEnabled
          ? _value.BookingScribblesEnabled
          : BookingScribblesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingScribblesEditable: freezed == BookingScribblesEditable
          ? _value.BookingScribblesEditable
          : BookingScribblesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingFilesEnabled: freezed == BookingFilesEnabled
          ? _value.BookingFilesEnabled
          : BookingFilesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingFilesEditable: freezed == BookingFilesEditable
          ? _value.BookingFilesEditable
          : BookingFilesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingChargesEnabled: freezed == BookingChargesEnabled
          ? _value.BookingChargesEnabled
          : BookingChargesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingChargesEditable: freezed == BookingChargesEditable
          ? _value.BookingChargesEditable
          : BookingChargesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingChargesAllVisible: freezed == BookingChargesAllVisible
          ? _value.BookingChargesAllVisible
          : BookingChargesAllVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactAccessEnabled: freezed == ContactAccessEnabled
          ? _value.ContactAccessEnabled
          : ContactAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactEditAddEnabled: freezed == ContactEditAddEnabled
          ? _value.ContactEditAddEnabled
          : ContactEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactViewContactDetailsWithin: freezed ==
              ContactViewContactDetailsWithin
          ? _value.ContactViewContactDetailsWithin
          : ContactViewContactDetailsWithin // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactNotesEnabled: freezed == ContactNotesEnabled
          ? _value.ContactNotesEnabled
          : ContactNotesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactNotesEditable: freezed == ContactNotesEditable
          ? _value.ContactNotesEditable
          : ContactNotesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactFilesEnabled: freezed == ContactFilesEnabled
          ? _value.ContactFilesEnabled
          : ContactFilesEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactFilesEditable: freezed == ContactFilesEditable
          ? _value.ContactFilesEditable
          : ContactFilesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      UserOnlyAccessEnabled: freezed == UserOnlyAccessEnabled
          ? _value.UserOnlyAccessEnabled
          : UserOnlyAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      LivePriceBookAccessEnabled: freezed == LivePriceBookAccessEnabled
          ? _value.LivePriceBookAccessEnabled
          : LivePriceBookAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeAccessEnabled: freezed == ChargeAccessEnabled
          ? _value.ChargeAccessEnabled
          : ChargeAccessEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeEditAddEnabled: freezed == ChargeEditAddEnabled
          ? _value.ChargeEditAddEnabled
          : ChargeEditAddEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargePricingDetailsVisible: freezed == ChargePricingDetailsVisible
          ? _value.ChargePricingDetailsVisible
          : ChargePricingDetailsVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeBuyPricesVisible: freezed == ChargeBuyPricesVisible
          ? _value.ChargeBuyPricesVisible
          : ChargeBuyPricesVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeBuyPricesEditable: freezed == ChargeBuyPricesEditable
          ? _value.ChargeBuyPricesEditable
          : ChargeBuyPricesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeSellPricesVisible: freezed == ChargeSellPricesVisible
          ? _value.ChargeSellPricesVisible
          : ChargeSellPricesVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargeSellPricesEditable: freezed == ChargeSellPricesEditable
          ? _value.ChargeSellPricesEditable
          : ChargeSellPricesEditable // ignore: cast_nullable_to_non_nullable
              as bool?,
      UnbilledChargeTotalsVisible: freezed == UnbilledChargeTotalsVisible
          ? _value.UnbilledChargeTotalsVisible
          : UnbilledChargeTotalsVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobFinancialTotalsVisible: freezed == JobFinancialTotalsVisible
          ? _value.JobFinancialTotalsVisible
          : JobFinancialTotalsVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      SectionCostRevenueVisible: freezed == SectionCostRevenueVisible
          ? _value.SectionCostRevenueVisible
          : SectionCostRevenueVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobAndBookingCostSummaryVisible: freezed ==
              JobAndBookingCostSummaryVisible
          ? _value.JobAndBookingCostSummaryVisible
          : JobAndBookingCostSummaryVisible // ignore: cast_nullable_to_non_nullable
              as bool?,
      CalendarDefaultNavigation: freezed == CalendarDefaultNavigation
          ? _value.CalendarDefaultNavigation
          : CalendarDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      TimesheetsDefaultNavigation: freezed == TimesheetsDefaultNavigation
          ? _value.TimesheetsDefaultNavigation
          : TimesheetsDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobsDefaultNavigation: freezed == JobsDefaultNavigation
          ? _value.JobsDefaultNavigation
          : JobsDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingsDefaultNavigation: freezed == BookingsDefaultNavigation
          ? _value.BookingsDefaultNavigation
          : BookingsDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      QuotesDefaultNavigation: freezed == QuotesDefaultNavigation
          ? _value.QuotesDefaultNavigation
          : QuotesDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      OrdersDefaultNavigation: freezed == OrdersDefaultNavigation
          ? _value.OrdersDefaultNavigation
          : OrdersDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      InvoicesDefaultNavigation: freezed == InvoicesDefaultNavigation
          ? _value.InvoicesDefaultNavigation
          : InvoicesDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      SupplierInvoicesDefaultNavigation: freezed ==
              SupplierInvoicesDefaultNavigation
          ? _value.SupplierInvoicesDefaultNavigation
          : SupplierInvoicesDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      ContactsDefaultNavigation: freezed == ContactsDefaultNavigation
          ? _value.ContactsDefaultNavigation
          : ContactsDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargesDefaultNavigation: freezed == ChargesDefaultNavigation
          ? _value.ChargesDefaultNavigation
          : ChargesDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobPlanningDefaultNavigation: freezed == JobPlanningDefaultNavigation
          ? _value.JobPlanningDefaultNavigation
          : JobPlanningDefaultNavigation // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobsNavigationEnabled: freezed == JobsNavigationEnabled
          ? _value.JobsNavigationEnabled
          : JobsNavigationEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      BookingsNavigationEnabled: freezed == BookingsNavigationEnabled
          ? _value.BookingsNavigationEnabled
          : BookingsNavigationEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      ChargesNavigationEnabled: freezed == ChargesNavigationEnabled
          ? _value.ChargesNavigationEnabled
          : ChargesNavigationEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      JobPlanningEnabled: freezed == JobPlanningEnabled
          ? _value.JobPlanningEnabled
          : JobPlanningEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Permissions extends _Permissions {
  const _$_Permissions(
      {this.DashboardAccessEnabled,
      this.TimesheetsAccessEnabled,
      this.TimesheetsCanChangeBillableStatus,
      this.TimesheetsCanAccessOtherUsers,
      this.TimesheetsCanReadOnlyAccessOtherUsers,
      this.TimesheetsDurationEntryTypeEnabled,
      this.TimesheetsHideViewJobButtonEnabled,
      this.TimesheetsHideViewTaskButtonEnabled,
      this.TimesheetsDescriptionMandatoryEnabled,
      this.JobAddTimesheetEntryEnabled,
      this.BookingAddTimesheetEntryEnabled,
      this.CalendarAccessEnabled,
      this.ActivityLogAccessEnabled,
      this.TemplateAccessEnabled,
      this.TemplatesEditable,
      this.QuoteAccessEnabled,
      this.QuotesEditable,
      this.QuotesSendable,
      this.QuotesAcceptable,
      this.OrderAccessEnabled,
      this.OrdersEditable,
      this.OrdersSendable,
      this.InvoiceAccessEnabled,
      this.InvoicesEditable,
      this.InvoicesSendable,
      this.InvoicesSyncable,
      this.PaymentsAndCreditNotesEnabled,
      this.SiPaymentsAndCreditNotesEnabled,
      this.SupplierInvoiceAccessEnabled,
      this.SupplierInvoicesEditable,
      this.SupplierInvoicesSendable,
      this.SupplierInvoicesSyncable,
      this.JobAccessEnabled,
      this.JobEditAddEnabled,
      this.JobStatusEditable,
      this.JobCanComplete,
      this.JobDataVisibility,
      this.JobCanAcceptReject,
      this.JobPhotosEnabled,
      this.JobPhotosEditable,
      this.JobNotesEnabled,
      this.JobNotesEditable,
      this.JobScribblesEnabled,
      this.JobScribblesEditable,
      this.JobFilesEnabled,
      this.JobFilesEditable,
      this.JobChargesEnabled,
      this.JobChargesEditable,
      this.JobChargesAllVisible,
      this.JobSheetsEnabled,
      this.JobTemplatesEnabled,
      this.BookingAccessEnabled,
      this.BookingEditAddEnabled,
      this.BookingStatusEditable,
      this.BookingCanComplete,
      this.BookingCanAcceptReject,
      this.BookingDataVisibility,
      this.BookingPhotosEnabled,
      this.BookingPhotosEditable,
      this.BookingNotesEnabled,
      this.BookingNotesEditable,
      this.BookingScribblesEnabled,
      this.BookingScribblesEditable,
      this.BookingFilesEnabled,
      this.BookingFilesEditable,
      this.BookingChargesEnabled,
      this.BookingChargesEditable,
      this.BookingChargesAllVisible,
      this.ContactAccessEnabled,
      this.ContactEditAddEnabled,
      this.ContactViewContactDetailsWithin,
      this.ContactNotesEnabled,
      this.ContactNotesEditable,
      this.ContactFilesEnabled,
      this.ContactFilesEditable,
      this.UserOnlyAccessEnabled,
      this.LivePriceBookAccessEnabled,
      this.ChargeAccessEnabled,
      this.ChargeEditAddEnabled,
      this.ChargePricingDetailsVisible,
      this.ChargeBuyPricesVisible,
      this.ChargeBuyPricesEditable,
      this.ChargeSellPricesVisible,
      this.ChargeSellPricesEditable,
      this.UnbilledChargeTotalsVisible,
      this.JobFinancialTotalsVisible,
      this.SectionCostRevenueVisible,
      this.JobAndBookingCostSummaryVisible,
      this.CalendarDefaultNavigation,
      this.TimesheetsDefaultNavigation,
      this.JobsDefaultNavigation,
      this.BookingsDefaultNavigation,
      this.QuotesDefaultNavigation,
      this.OrdersDefaultNavigation,
      this.InvoicesDefaultNavigation,
      this.SupplierInvoicesDefaultNavigation,
      this.ContactsDefaultNavigation,
      this.ChargesDefaultNavigation,
      this.JobPlanningDefaultNavigation,
      this.JobsNavigationEnabled,
      this.BookingsNavigationEnabled,
      this.ChargesNavigationEnabled,
      this.JobPlanningEnabled})
      : super._();

  factory _$_Permissions.fromJson(Map<String, dynamic> json) =>
      _$$_PermissionsFromJson(json);

  @override
  final bool? DashboardAccessEnabled;
  @override
  final bool? TimesheetsAccessEnabled;
  @override
  final bool? TimesheetsCanChangeBillableStatus;
  @override
  final bool? TimesheetsCanAccessOtherUsers;
  @override
  final bool? TimesheetsCanReadOnlyAccessOtherUsers;
  @override
  final bool? TimesheetsDurationEntryTypeEnabled;
  @override
  final bool? TimesheetsHideViewJobButtonEnabled;
  @override
  final bool? TimesheetsHideViewTaskButtonEnabled;
  @override
  final bool? TimesheetsDescriptionMandatoryEnabled;
  @override
  final bool? JobAddTimesheetEntryEnabled;
  @override
  final bool? BookingAddTimesheetEntryEnabled;
  @override
  final bool? CalendarAccessEnabled;
  @override
  final bool? ActivityLogAccessEnabled;
  @override
  final bool? TemplateAccessEnabled;
  @override
  final bool? TemplatesEditable;
  @override
  final bool? QuoteAccessEnabled;
  @override
  final bool? QuotesEditable;
  @override
  final bool? QuotesSendable;
  @override
  final bool? QuotesAcceptable;
  @override
  final bool? OrderAccessEnabled;
  @override
  final bool? OrdersEditable;
  @override
  final bool? OrdersSendable;
  @override
  final bool? InvoiceAccessEnabled;
  @override
  final bool? InvoicesEditable;
  @override
  final bool? InvoicesSendable;
  @override
  final bool? InvoicesSyncable;
  @override
  final bool? PaymentsAndCreditNotesEnabled;
  @override
  final bool? SiPaymentsAndCreditNotesEnabled;
  @override
  final bool? SupplierInvoiceAccessEnabled;
  @override
  final bool? SupplierInvoicesEditable;
  @override
  final bool? SupplierInvoicesSendable;
  @override
  final bool? SupplierInvoicesSyncable;
  @override
  final bool? JobAccessEnabled;
  @override
  final bool? JobEditAddEnabled;
  @override
  final bool? JobStatusEditable;
  @override
  final bool? JobCanComplete;
  @override
  final String? JobDataVisibility;
  @override
  final bool? JobCanAcceptReject;
  @override
  final bool? JobPhotosEnabled;
  @override
  final bool? JobPhotosEditable;
  @override
  final bool? JobNotesEnabled;
  @override
  final bool? JobNotesEditable;
  @override
  final bool? JobScribblesEnabled;
  @override
  final bool? JobScribblesEditable;
  @override
  final bool? JobFilesEnabled;
  @override
  final bool? JobFilesEditable;
  @override
  final bool? JobChargesEnabled;
  @override
  final bool? JobChargesEditable;
  @override
  final bool? JobChargesAllVisible;
  @override
  final bool? JobSheetsEnabled;
  @override
  final bool? JobTemplatesEnabled;
  @override
  final bool? BookingAccessEnabled;
  @override
  final bool? BookingEditAddEnabled;
  @override
  final bool? BookingStatusEditable;
  @override
  final bool? BookingCanComplete;
  @override
  final bool? BookingCanAcceptReject;
  @override
  final String? BookingDataVisibility;
  @override
  final bool? BookingPhotosEnabled;
  @override
  final bool? BookingPhotosEditable;
  @override
  final bool? BookingNotesEnabled;
  @override
  final bool? BookingNotesEditable;
  @override
  final bool? BookingScribblesEnabled;
  @override
  final bool? BookingScribblesEditable;
  @override
  final bool? BookingFilesEnabled;
  @override
  final bool? BookingFilesEditable;
  @override
  final bool? BookingChargesEnabled;
  @override
  final bool? BookingChargesEditable;
  @override
  final bool? BookingChargesAllVisible;
  @override
  final bool? ContactAccessEnabled;
  @override
  final bool? ContactEditAddEnabled;
  @override
  final bool? ContactViewContactDetailsWithin;
  @override
  final bool? ContactNotesEnabled;
  @override
  final bool? ContactNotesEditable;
  @override
  final bool? ContactFilesEnabled;
  @override
  final bool? ContactFilesEditable;
  @override
  final bool? UserOnlyAccessEnabled;
  @override
  final bool? LivePriceBookAccessEnabled;
  @override
  final bool? ChargeAccessEnabled;
  @override
  final bool? ChargeEditAddEnabled;
  @override
  final bool? ChargePricingDetailsVisible;
  @override
  final bool? ChargeBuyPricesVisible;
  @override
  final bool? ChargeBuyPricesEditable;
  @override
  final bool? ChargeSellPricesVisible;
  @override
  final bool? ChargeSellPricesEditable;
  @override
  final bool? UnbilledChargeTotalsVisible;
  @override
  final bool? JobFinancialTotalsVisible;
  @override
  final bool? SectionCostRevenueVisible;
  @override
  final bool? JobAndBookingCostSummaryVisible;
  @override
  final bool? CalendarDefaultNavigation;
  @override
  final bool? TimesheetsDefaultNavigation;
  @override
  final bool? JobsDefaultNavigation;
  @override
  final bool? BookingsDefaultNavigation;
  @override
  final bool? QuotesDefaultNavigation;
  @override
  final bool? OrdersDefaultNavigation;
  @override
  final bool? InvoicesDefaultNavigation;
  @override
  final bool? SupplierInvoicesDefaultNavigation;
  @override
  final bool? ContactsDefaultNavigation;
  @override
  final bool? ChargesDefaultNavigation;
  @override
  final bool? JobPlanningDefaultNavigation;
  @override
  final bool? JobsNavigationEnabled;
  @override
  final bool? BookingsNavigationEnabled;
  @override
  final bool? ChargesNavigationEnabled;
  @override
  final bool? JobPlanningEnabled;

  @override
  String toString() {
    return 'Permissions(DashboardAccessEnabled: $DashboardAccessEnabled, TimesheetsAccessEnabled: $TimesheetsAccessEnabled, TimesheetsCanChangeBillableStatus: $TimesheetsCanChangeBillableStatus, TimesheetsCanAccessOtherUsers: $TimesheetsCanAccessOtherUsers, TimesheetsCanReadOnlyAccessOtherUsers: $TimesheetsCanReadOnlyAccessOtherUsers, TimesheetsDurationEntryTypeEnabled: $TimesheetsDurationEntryTypeEnabled, TimesheetsHideViewJobButtonEnabled: $TimesheetsHideViewJobButtonEnabled, TimesheetsHideViewTaskButtonEnabled: $TimesheetsHideViewTaskButtonEnabled, TimesheetsDescriptionMandatoryEnabled: $TimesheetsDescriptionMandatoryEnabled, JobAddTimesheetEntryEnabled: $JobAddTimesheetEntryEnabled, BookingAddTimesheetEntryEnabled: $BookingAddTimesheetEntryEnabled, CalendarAccessEnabled: $CalendarAccessEnabled, ActivityLogAccessEnabled: $ActivityLogAccessEnabled, TemplateAccessEnabled: $TemplateAccessEnabled, TemplatesEditable: $TemplatesEditable, QuoteAccessEnabled: $QuoteAccessEnabled, QuotesEditable: $QuotesEditable, QuotesSendable: $QuotesSendable, QuotesAcceptable: $QuotesAcceptable, OrderAccessEnabled: $OrderAccessEnabled, OrdersEditable: $OrdersEditable, OrdersSendable: $OrdersSendable, InvoiceAccessEnabled: $InvoiceAccessEnabled, InvoicesEditable: $InvoicesEditable, InvoicesSendable: $InvoicesSendable, InvoicesSyncable: $InvoicesSyncable, PaymentsAndCreditNotesEnabled: $PaymentsAndCreditNotesEnabled, SiPaymentsAndCreditNotesEnabled: $SiPaymentsAndCreditNotesEnabled, SupplierInvoiceAccessEnabled: $SupplierInvoiceAccessEnabled, SupplierInvoicesEditable: $SupplierInvoicesEditable, SupplierInvoicesSendable: $SupplierInvoicesSendable, SupplierInvoicesSyncable: $SupplierInvoicesSyncable, JobAccessEnabled: $JobAccessEnabled, JobEditAddEnabled: $JobEditAddEnabled, JobStatusEditable: $JobStatusEditable, JobCanComplete: $JobCanComplete, JobDataVisibility: $JobDataVisibility, JobCanAcceptReject: $JobCanAcceptReject, JobPhotosEnabled: $JobPhotosEnabled, JobPhotosEditable: $JobPhotosEditable, JobNotesEnabled: $JobNotesEnabled, JobNotesEditable: $JobNotesEditable, JobScribblesEnabled: $JobScribblesEnabled, JobScribblesEditable: $JobScribblesEditable, JobFilesEnabled: $JobFilesEnabled, JobFilesEditable: $JobFilesEditable, JobChargesEnabled: $JobChargesEnabled, JobChargesEditable: $JobChargesEditable, JobChargesAllVisible: $JobChargesAllVisible, JobSheetsEnabled: $JobSheetsEnabled, JobTemplatesEnabled: $JobTemplatesEnabled, BookingAccessEnabled: $BookingAccessEnabled, BookingEditAddEnabled: $BookingEditAddEnabled, BookingStatusEditable: $BookingStatusEditable, BookingCanComplete: $BookingCanComplete, BookingCanAcceptReject: $BookingCanAcceptReject, BookingDataVisibility: $BookingDataVisibility, BookingPhotosEnabled: $BookingPhotosEnabled, BookingPhotosEditable: $BookingPhotosEditable, BookingNotesEnabled: $BookingNotesEnabled, BookingNotesEditable: $BookingNotesEditable, BookingScribblesEnabled: $BookingScribblesEnabled, BookingScribblesEditable: $BookingScribblesEditable, BookingFilesEnabled: $BookingFilesEnabled, BookingFilesEditable: $BookingFilesEditable, BookingChargesEnabled: $BookingChargesEnabled, BookingChargesEditable: $BookingChargesEditable, BookingChargesAllVisible: $BookingChargesAllVisible, ContactAccessEnabled: $ContactAccessEnabled, ContactEditAddEnabled: $ContactEditAddEnabled, ContactViewContactDetailsWithin: $ContactViewContactDetailsWithin, ContactNotesEnabled: $ContactNotesEnabled, ContactNotesEditable: $ContactNotesEditable, ContactFilesEnabled: $ContactFilesEnabled, ContactFilesEditable: $ContactFilesEditable, UserOnlyAccessEnabled: $UserOnlyAccessEnabled, LivePriceBookAccessEnabled: $LivePriceBookAccessEnabled, ChargeAccessEnabled: $ChargeAccessEnabled, ChargeEditAddEnabled: $ChargeEditAddEnabled, ChargePricingDetailsVisible: $ChargePricingDetailsVisible, ChargeBuyPricesVisible: $ChargeBuyPricesVisible, ChargeBuyPricesEditable: $ChargeBuyPricesEditable, ChargeSellPricesVisible: $ChargeSellPricesVisible, ChargeSellPricesEditable: $ChargeSellPricesEditable, UnbilledChargeTotalsVisible: $UnbilledChargeTotalsVisible, JobFinancialTotalsVisible: $JobFinancialTotalsVisible, SectionCostRevenueVisible: $SectionCostRevenueVisible, JobAndBookingCostSummaryVisible: $JobAndBookingCostSummaryVisible, CalendarDefaultNavigation: $CalendarDefaultNavigation, TimesheetsDefaultNavigation: $TimesheetsDefaultNavigation, JobsDefaultNavigation: $JobsDefaultNavigation, BookingsDefaultNavigation: $BookingsDefaultNavigation, QuotesDefaultNavigation: $QuotesDefaultNavigation, OrdersDefaultNavigation: $OrdersDefaultNavigation, InvoicesDefaultNavigation: $InvoicesDefaultNavigation, SupplierInvoicesDefaultNavigation: $SupplierInvoicesDefaultNavigation, ContactsDefaultNavigation: $ContactsDefaultNavigation, ChargesDefaultNavigation: $ChargesDefaultNavigation, JobPlanningDefaultNavigation: $JobPlanningDefaultNavigation, JobsNavigationEnabled: $JobsNavigationEnabled, BookingsNavigationEnabled: $BookingsNavigationEnabled, ChargesNavigationEnabled: $ChargesNavigationEnabled, JobPlanningEnabled: $JobPlanningEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Permissions &&
            (identical(other.DashboardAccessEnabled, DashboardAccessEnabled) ||
                other.DashboardAccessEnabled == DashboardAccessEnabled) &&
            (identical(other.TimesheetsAccessEnabled, TimesheetsAccessEnabled) ||
                other.TimesheetsAccessEnabled == TimesheetsAccessEnabled) &&
            (identical(other.TimesheetsCanChangeBillableStatus, TimesheetsCanChangeBillableStatus) ||
                other.TimesheetsCanChangeBillableStatus ==
                    TimesheetsCanChangeBillableStatus) &&
            (identical(other.TimesheetsCanAccessOtherUsers, TimesheetsCanAccessOtherUsers) ||
                other.TimesheetsCanAccessOtherUsers ==
                    TimesheetsCanAccessOtherUsers) &&
            (identical(other.TimesheetsCanReadOnlyAccessOtherUsers, TimesheetsCanReadOnlyAccessOtherUsers) ||
                other.TimesheetsCanReadOnlyAccessOtherUsers ==
                    TimesheetsCanReadOnlyAccessOtherUsers) &&
            (identical(other.TimesheetsDurationEntryTypeEnabled, TimesheetsDurationEntryTypeEnabled) ||
                other.TimesheetsDurationEntryTypeEnabled ==
                    TimesheetsDurationEntryTypeEnabled) &&
            (identical(other.TimesheetsHideViewJobButtonEnabled, TimesheetsHideViewJobButtonEnabled) ||
                other.TimesheetsHideViewJobButtonEnabled ==
                    TimesheetsHideViewJobButtonEnabled) &&
            (identical(other.TimesheetsHideViewTaskButtonEnabled, TimesheetsHideViewTaskButtonEnabled) ||
                other.TimesheetsHideViewTaskButtonEnabled ==
                    TimesheetsHideViewTaskButtonEnabled) &&
            (identical(other.TimesheetsDescriptionMandatoryEnabled, TimesheetsDescriptionMandatoryEnabled) ||
                other.TimesheetsDescriptionMandatoryEnabled ==
                    TimesheetsDescriptionMandatoryEnabled) &&
            (identical(other.JobAddTimesheetEntryEnabled, JobAddTimesheetEntryEnabled) ||
                other.JobAddTimesheetEntryEnabled ==
                    JobAddTimesheetEntryEnabled) &&
            (identical(other.BookingAddTimesheetEntryEnabled, BookingAddTimesheetEntryEnabled) ||
                other.BookingAddTimesheetEntryEnabled ==
                    BookingAddTimesheetEntryEnabled) &&
            (identical(other.CalendarAccessEnabled, CalendarAccessEnabled) ||
                other.CalendarAccessEnabled == CalendarAccessEnabled) &&
            (identical(other.ActivityLogAccessEnabled, ActivityLogAccessEnabled) ||
                other.ActivityLogAccessEnabled == ActivityLogAccessEnabled) &&
            (identical(other.TemplateAccessEnabled, TemplateAccessEnabled) || other.TemplateAccessEnabled == TemplateAccessEnabled) &&
            (identical(other.TemplatesEditable, TemplatesEditable) || other.TemplatesEditable == TemplatesEditable) &&
            (identical(other.QuoteAccessEnabled, QuoteAccessEnabled) || other.QuoteAccessEnabled == QuoteAccessEnabled) &&
            (identical(other.QuotesEditable, QuotesEditable) || other.QuotesEditable == QuotesEditable) &&
            (identical(other.QuotesSendable, QuotesSendable) || other.QuotesSendable == QuotesSendable) &&
            (identical(other.QuotesAcceptable, QuotesAcceptable) || other.QuotesAcceptable == QuotesAcceptable) &&
            (identical(other.OrderAccessEnabled, OrderAccessEnabled) || other.OrderAccessEnabled == OrderAccessEnabled) &&
            (identical(other.OrdersEditable, OrdersEditable) || other.OrdersEditable == OrdersEditable) &&
            (identical(other.OrdersSendable, OrdersSendable) || other.OrdersSendable == OrdersSendable) &&
            (identical(other.InvoiceAccessEnabled, InvoiceAccessEnabled) || other.InvoiceAccessEnabled == InvoiceAccessEnabled) &&
            (identical(other.InvoicesEditable, InvoicesEditable) || other.InvoicesEditable == InvoicesEditable) &&
            (identical(other.InvoicesSendable, InvoicesSendable) || other.InvoicesSendable == InvoicesSendable) &&
            (identical(other.InvoicesSyncable, InvoicesSyncable) || other.InvoicesSyncable == InvoicesSyncable) &&
            (identical(other.PaymentsAndCreditNotesEnabled, PaymentsAndCreditNotesEnabled) || other.PaymentsAndCreditNotesEnabled == PaymentsAndCreditNotesEnabled) &&
            (identical(other.SiPaymentsAndCreditNotesEnabled, SiPaymentsAndCreditNotesEnabled) || other.SiPaymentsAndCreditNotesEnabled == SiPaymentsAndCreditNotesEnabled) &&
            (identical(other.SupplierInvoiceAccessEnabled, SupplierInvoiceAccessEnabled) || other.SupplierInvoiceAccessEnabled == SupplierInvoiceAccessEnabled) &&
            (identical(other.SupplierInvoicesEditable, SupplierInvoicesEditable) || other.SupplierInvoicesEditable == SupplierInvoicesEditable) &&
            (identical(other.SupplierInvoicesSendable, SupplierInvoicesSendable) || other.SupplierInvoicesSendable == SupplierInvoicesSendable) &&
            (identical(other.SupplierInvoicesSyncable, SupplierInvoicesSyncable) || other.SupplierInvoicesSyncable == SupplierInvoicesSyncable) &&
            (identical(other.JobAccessEnabled, JobAccessEnabled) || other.JobAccessEnabled == JobAccessEnabled) &&
            (identical(other.JobEditAddEnabled, JobEditAddEnabled) || other.JobEditAddEnabled == JobEditAddEnabled) &&
            (identical(other.JobStatusEditable, JobStatusEditable) || other.JobStatusEditable == JobStatusEditable) &&
            (identical(other.JobCanComplete, JobCanComplete) || other.JobCanComplete == JobCanComplete) &&
            (identical(other.JobDataVisibility, JobDataVisibility) || other.JobDataVisibility == JobDataVisibility) &&
            (identical(other.JobCanAcceptReject, JobCanAcceptReject) || other.JobCanAcceptReject == JobCanAcceptReject) &&
            (identical(other.JobPhotosEnabled, JobPhotosEnabled) || other.JobPhotosEnabled == JobPhotosEnabled) &&
            (identical(other.JobPhotosEditable, JobPhotosEditable) || other.JobPhotosEditable == JobPhotosEditable) &&
            (identical(other.JobNotesEnabled, JobNotesEnabled) || other.JobNotesEnabled == JobNotesEnabled) &&
            (identical(other.JobNotesEditable, JobNotesEditable) || other.JobNotesEditable == JobNotesEditable) &&
            (identical(other.JobScribblesEnabled, JobScribblesEnabled) || other.JobScribblesEnabled == JobScribblesEnabled) &&
            (identical(other.JobScribblesEditable, JobScribblesEditable) || other.JobScribblesEditable == JobScribblesEditable) &&
            (identical(other.JobFilesEnabled, JobFilesEnabled) || other.JobFilesEnabled == JobFilesEnabled) &&
            (identical(other.JobFilesEditable, JobFilesEditable) || other.JobFilesEditable == JobFilesEditable) &&
            (identical(other.JobChargesEnabled, JobChargesEnabled) || other.JobChargesEnabled == JobChargesEnabled) &&
            (identical(other.JobChargesEditable, JobChargesEditable) || other.JobChargesEditable == JobChargesEditable) &&
            (identical(other.JobChargesAllVisible, JobChargesAllVisible) || other.JobChargesAllVisible == JobChargesAllVisible) &&
            (identical(other.JobSheetsEnabled, JobSheetsEnabled) || other.JobSheetsEnabled == JobSheetsEnabled) &&
            (identical(other.JobTemplatesEnabled, JobTemplatesEnabled) || other.JobTemplatesEnabled == JobTemplatesEnabled) &&
            (identical(other.BookingAccessEnabled, BookingAccessEnabled) || other.BookingAccessEnabled == BookingAccessEnabled) &&
            (identical(other.BookingEditAddEnabled, BookingEditAddEnabled) || other.BookingEditAddEnabled == BookingEditAddEnabled) &&
            (identical(other.BookingStatusEditable, BookingStatusEditable) || other.BookingStatusEditable == BookingStatusEditable) &&
            (identical(other.BookingCanComplete, BookingCanComplete) || other.BookingCanComplete == BookingCanComplete) &&
            (identical(other.BookingCanAcceptReject, BookingCanAcceptReject) || other.BookingCanAcceptReject == BookingCanAcceptReject) &&
            (identical(other.BookingDataVisibility, BookingDataVisibility) || other.BookingDataVisibility == BookingDataVisibility) &&
            (identical(other.BookingPhotosEnabled, BookingPhotosEnabled) || other.BookingPhotosEnabled == BookingPhotosEnabled) &&
            (identical(other.BookingPhotosEditable, BookingPhotosEditable) || other.BookingPhotosEditable == BookingPhotosEditable) &&
            (identical(other.BookingNotesEnabled, BookingNotesEnabled) || other.BookingNotesEnabled == BookingNotesEnabled) &&
            (identical(other.BookingNotesEditable, BookingNotesEditable) || other.BookingNotesEditable == BookingNotesEditable) &&
            (identical(other.BookingScribblesEnabled, BookingScribblesEnabled) || other.BookingScribblesEnabled == BookingScribblesEnabled) &&
            (identical(other.BookingScribblesEditable, BookingScribblesEditable) || other.BookingScribblesEditable == BookingScribblesEditable) &&
            (identical(other.BookingFilesEnabled, BookingFilesEnabled) || other.BookingFilesEnabled == BookingFilesEnabled) &&
            (identical(other.BookingFilesEditable, BookingFilesEditable) || other.BookingFilesEditable == BookingFilesEditable) &&
            (identical(other.BookingChargesEnabled, BookingChargesEnabled) || other.BookingChargesEnabled == BookingChargesEnabled) &&
            (identical(other.BookingChargesEditable, BookingChargesEditable) || other.BookingChargesEditable == BookingChargesEditable) &&
            (identical(other.BookingChargesAllVisible, BookingChargesAllVisible) || other.BookingChargesAllVisible == BookingChargesAllVisible) &&
            (identical(other.ContactAccessEnabled, ContactAccessEnabled) || other.ContactAccessEnabled == ContactAccessEnabled) &&
            (identical(other.ContactEditAddEnabled, ContactEditAddEnabled) || other.ContactEditAddEnabled == ContactEditAddEnabled) &&
            (identical(other.ContactViewContactDetailsWithin, ContactViewContactDetailsWithin) || other.ContactViewContactDetailsWithin == ContactViewContactDetailsWithin) &&
            (identical(other.ContactNotesEnabled, ContactNotesEnabled) || other.ContactNotesEnabled == ContactNotesEnabled) &&
            (identical(other.ContactNotesEditable, ContactNotesEditable) || other.ContactNotesEditable == ContactNotesEditable) &&
            (identical(other.ContactFilesEnabled, ContactFilesEnabled) || other.ContactFilesEnabled == ContactFilesEnabled) &&
            (identical(other.ContactFilesEditable, ContactFilesEditable) || other.ContactFilesEditable == ContactFilesEditable) &&
            (identical(other.UserOnlyAccessEnabled, UserOnlyAccessEnabled) || other.UserOnlyAccessEnabled == UserOnlyAccessEnabled) &&
            (identical(other.LivePriceBookAccessEnabled, LivePriceBookAccessEnabled) || other.LivePriceBookAccessEnabled == LivePriceBookAccessEnabled) &&
            (identical(other.ChargeAccessEnabled, ChargeAccessEnabled) || other.ChargeAccessEnabled == ChargeAccessEnabled) &&
            (identical(other.ChargeEditAddEnabled, ChargeEditAddEnabled) || other.ChargeEditAddEnabled == ChargeEditAddEnabled) &&
            (identical(other.ChargePricingDetailsVisible, ChargePricingDetailsVisible) || other.ChargePricingDetailsVisible == ChargePricingDetailsVisible) &&
            (identical(other.ChargeBuyPricesVisible, ChargeBuyPricesVisible) || other.ChargeBuyPricesVisible == ChargeBuyPricesVisible) &&
            (identical(other.ChargeBuyPricesEditable, ChargeBuyPricesEditable) || other.ChargeBuyPricesEditable == ChargeBuyPricesEditable) &&
            (identical(other.ChargeSellPricesVisible, ChargeSellPricesVisible) || other.ChargeSellPricesVisible == ChargeSellPricesVisible) &&
            (identical(other.ChargeSellPricesEditable, ChargeSellPricesEditable) || other.ChargeSellPricesEditable == ChargeSellPricesEditable) &&
            (identical(other.UnbilledChargeTotalsVisible, UnbilledChargeTotalsVisible) || other.UnbilledChargeTotalsVisible == UnbilledChargeTotalsVisible) &&
            (identical(other.JobFinancialTotalsVisible, JobFinancialTotalsVisible) || other.JobFinancialTotalsVisible == JobFinancialTotalsVisible) &&
            (identical(other.SectionCostRevenueVisible, SectionCostRevenueVisible) || other.SectionCostRevenueVisible == SectionCostRevenueVisible) &&
            (identical(other.JobAndBookingCostSummaryVisible, JobAndBookingCostSummaryVisible) || other.JobAndBookingCostSummaryVisible == JobAndBookingCostSummaryVisible) &&
            (identical(other.CalendarDefaultNavigation, CalendarDefaultNavigation) || other.CalendarDefaultNavigation == CalendarDefaultNavigation) &&
            (identical(other.TimesheetsDefaultNavigation, TimesheetsDefaultNavigation) || other.TimesheetsDefaultNavigation == TimesheetsDefaultNavigation) &&
            (identical(other.JobsDefaultNavigation, JobsDefaultNavigation) || other.JobsDefaultNavigation == JobsDefaultNavigation) &&
            (identical(other.BookingsDefaultNavigation, BookingsDefaultNavigation) || other.BookingsDefaultNavigation == BookingsDefaultNavigation) &&
            (identical(other.QuotesDefaultNavigation, QuotesDefaultNavigation) || other.QuotesDefaultNavigation == QuotesDefaultNavigation) &&
            (identical(other.OrdersDefaultNavigation, OrdersDefaultNavigation) || other.OrdersDefaultNavigation == OrdersDefaultNavigation) &&
            (identical(other.InvoicesDefaultNavigation, InvoicesDefaultNavigation) || other.InvoicesDefaultNavigation == InvoicesDefaultNavigation) &&
            (identical(other.SupplierInvoicesDefaultNavigation, SupplierInvoicesDefaultNavigation) || other.SupplierInvoicesDefaultNavigation == SupplierInvoicesDefaultNavigation) &&
            (identical(other.ContactsDefaultNavigation, ContactsDefaultNavigation) || other.ContactsDefaultNavigation == ContactsDefaultNavigation) &&
            (identical(other.ChargesDefaultNavigation, ChargesDefaultNavigation) || other.ChargesDefaultNavigation == ChargesDefaultNavigation) &&
            (identical(other.JobPlanningDefaultNavigation, JobPlanningDefaultNavigation) || other.JobPlanningDefaultNavigation == JobPlanningDefaultNavigation) &&
            (identical(other.JobsNavigationEnabled, JobsNavigationEnabled) || other.JobsNavigationEnabled == JobsNavigationEnabled) &&
            (identical(other.BookingsNavigationEnabled, BookingsNavigationEnabled) || other.BookingsNavigationEnabled == BookingsNavigationEnabled) &&
            (identical(other.ChargesNavigationEnabled, ChargesNavigationEnabled) || other.ChargesNavigationEnabled == ChargesNavigationEnabled) &&
            (identical(other.JobPlanningEnabled, JobPlanningEnabled) || other.JobPlanningEnabled == JobPlanningEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        DashboardAccessEnabled,
        TimesheetsAccessEnabled,
        TimesheetsCanChangeBillableStatus,
        TimesheetsCanAccessOtherUsers,
        TimesheetsCanReadOnlyAccessOtherUsers,
        TimesheetsDurationEntryTypeEnabled,
        TimesheetsHideViewJobButtonEnabled,
        TimesheetsHideViewTaskButtonEnabled,
        TimesheetsDescriptionMandatoryEnabled,
        JobAddTimesheetEntryEnabled,
        BookingAddTimesheetEntryEnabled,
        CalendarAccessEnabled,
        ActivityLogAccessEnabled,
        TemplateAccessEnabled,
        TemplatesEditable,
        QuoteAccessEnabled,
        QuotesEditable,
        QuotesSendable,
        QuotesAcceptable,
        OrderAccessEnabled,
        OrdersEditable,
        OrdersSendable,
        InvoiceAccessEnabled,
        InvoicesEditable,
        InvoicesSendable,
        InvoicesSyncable,
        PaymentsAndCreditNotesEnabled,
        SiPaymentsAndCreditNotesEnabled,
        SupplierInvoiceAccessEnabled,
        SupplierInvoicesEditable,
        SupplierInvoicesSendable,
        SupplierInvoicesSyncable,
        JobAccessEnabled,
        JobEditAddEnabled,
        JobStatusEditable,
        JobCanComplete,
        JobDataVisibility,
        JobCanAcceptReject,
        JobPhotosEnabled,
        JobPhotosEditable,
        JobNotesEnabled,
        JobNotesEditable,
        JobScribblesEnabled,
        JobScribblesEditable,
        JobFilesEnabled,
        JobFilesEditable,
        JobChargesEnabled,
        JobChargesEditable,
        JobChargesAllVisible,
        JobSheetsEnabled,
        JobTemplatesEnabled,
        BookingAccessEnabled,
        BookingEditAddEnabled,
        BookingStatusEditable,
        BookingCanComplete,
        BookingCanAcceptReject,
        BookingDataVisibility,
        BookingPhotosEnabled,
        BookingPhotosEditable,
        BookingNotesEnabled,
        BookingNotesEditable,
        BookingScribblesEnabled,
        BookingScribblesEditable,
        BookingFilesEnabled,
        BookingFilesEditable,
        BookingChargesEnabled,
        BookingChargesEditable,
        BookingChargesAllVisible,
        ContactAccessEnabled,
        ContactEditAddEnabled,
        ContactViewContactDetailsWithin,
        ContactNotesEnabled,
        ContactNotesEditable,
        ContactFilesEnabled,
        ContactFilesEditable,
        UserOnlyAccessEnabled,
        LivePriceBookAccessEnabled,
        ChargeAccessEnabled,
        ChargeEditAddEnabled,
        ChargePricingDetailsVisible,
        ChargeBuyPricesVisible,
        ChargeBuyPricesEditable,
        ChargeSellPricesVisible,
        ChargeSellPricesEditable,
        UnbilledChargeTotalsVisible,
        JobFinancialTotalsVisible,
        SectionCostRevenueVisible,
        JobAndBookingCostSummaryVisible,
        CalendarDefaultNavigation,
        TimesheetsDefaultNavigation,
        JobsDefaultNavigation,
        BookingsDefaultNavigation,
        QuotesDefaultNavigation,
        OrdersDefaultNavigation,
        InvoicesDefaultNavigation,
        SupplierInvoicesDefaultNavigation,
        ContactsDefaultNavigation,
        ChargesDefaultNavigation,
        JobPlanningDefaultNavigation,
        JobsNavigationEnabled,
        BookingsNavigationEnabled,
        ChargesNavigationEnabled,
        JobPlanningEnabled
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PermissionsCopyWith<_$_Permissions> get copyWith =>
      __$$_PermissionsCopyWithImpl<_$_Permissions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PermissionsToJson(
      this,
    );
  }
}

abstract class _Permissions extends Permissions {
  const factory _Permissions(
      {final bool? DashboardAccessEnabled,
      final bool? TimesheetsAccessEnabled,
      final bool? TimesheetsCanChangeBillableStatus,
      final bool? TimesheetsCanAccessOtherUsers,
      final bool? TimesheetsCanReadOnlyAccessOtherUsers,
      final bool? TimesheetsDurationEntryTypeEnabled,
      final bool? TimesheetsHideViewJobButtonEnabled,
      final bool? TimesheetsHideViewTaskButtonEnabled,
      final bool? TimesheetsDescriptionMandatoryEnabled,
      final bool? JobAddTimesheetEntryEnabled,
      final bool? BookingAddTimesheetEntryEnabled,
      final bool? CalendarAccessEnabled,
      final bool? ActivityLogAccessEnabled,
      final bool? TemplateAccessEnabled,
      final bool? TemplatesEditable,
      final bool? QuoteAccessEnabled,
      final bool? QuotesEditable,
      final bool? QuotesSendable,
      final bool? QuotesAcceptable,
      final bool? OrderAccessEnabled,
      final bool? OrdersEditable,
      final bool? OrdersSendable,
      final bool? InvoiceAccessEnabled,
      final bool? InvoicesEditable,
      final bool? InvoicesSendable,
      final bool? InvoicesSyncable,
      final bool? PaymentsAndCreditNotesEnabled,
      final bool? SiPaymentsAndCreditNotesEnabled,
      final bool? SupplierInvoiceAccessEnabled,
      final bool? SupplierInvoicesEditable,
      final bool? SupplierInvoicesSendable,
      final bool? SupplierInvoicesSyncable,
      final bool? JobAccessEnabled,
      final bool? JobEditAddEnabled,
      final bool? JobStatusEditable,
      final bool? JobCanComplete,
      final String? JobDataVisibility,
      final bool? JobCanAcceptReject,
      final bool? JobPhotosEnabled,
      final bool? JobPhotosEditable,
      final bool? JobNotesEnabled,
      final bool? JobNotesEditable,
      final bool? JobScribblesEnabled,
      final bool? JobScribblesEditable,
      final bool? JobFilesEnabled,
      final bool? JobFilesEditable,
      final bool? JobChargesEnabled,
      final bool? JobChargesEditable,
      final bool? JobChargesAllVisible,
      final bool? JobSheetsEnabled,
      final bool? JobTemplatesEnabled,
      final bool? BookingAccessEnabled,
      final bool? BookingEditAddEnabled,
      final bool? BookingStatusEditable,
      final bool? BookingCanComplete,
      final bool? BookingCanAcceptReject,
      final String? BookingDataVisibility,
      final bool? BookingPhotosEnabled,
      final bool? BookingPhotosEditable,
      final bool? BookingNotesEnabled,
      final bool? BookingNotesEditable,
      final bool? BookingScribblesEnabled,
      final bool? BookingScribblesEditable,
      final bool? BookingFilesEnabled,
      final bool? BookingFilesEditable,
      final bool? BookingChargesEnabled,
      final bool? BookingChargesEditable,
      final bool? BookingChargesAllVisible,
      final bool? ContactAccessEnabled,
      final bool? ContactEditAddEnabled,
      final bool? ContactViewContactDetailsWithin,
      final bool? ContactNotesEnabled,
      final bool? ContactNotesEditable,
      final bool? ContactFilesEnabled,
      final bool? ContactFilesEditable,
      final bool? UserOnlyAccessEnabled,
      final bool? LivePriceBookAccessEnabled,
      final bool? ChargeAccessEnabled,
      final bool? ChargeEditAddEnabled,
      final bool? ChargePricingDetailsVisible,
      final bool? ChargeBuyPricesVisible,
      final bool? ChargeBuyPricesEditable,
      final bool? ChargeSellPricesVisible,
      final bool? ChargeSellPricesEditable,
      final bool? UnbilledChargeTotalsVisible,
      final bool? JobFinancialTotalsVisible,
      final bool? SectionCostRevenueVisible,
      final bool? JobAndBookingCostSummaryVisible,
      final bool? CalendarDefaultNavigation,
      final bool? TimesheetsDefaultNavigation,
      final bool? JobsDefaultNavigation,
      final bool? BookingsDefaultNavigation,
      final bool? QuotesDefaultNavigation,
      final bool? OrdersDefaultNavigation,
      final bool? InvoicesDefaultNavigation,
      final bool? SupplierInvoicesDefaultNavigation,
      final bool? ContactsDefaultNavigation,
      final bool? ChargesDefaultNavigation,
      final bool? JobPlanningDefaultNavigation,
      final bool? JobsNavigationEnabled,
      final bool? BookingsNavigationEnabled,
      final bool? ChargesNavigationEnabled,
      final bool? JobPlanningEnabled}) = _$_Permissions;
  const _Permissions._() : super._();

  factory _Permissions.fromJson(Map<String, dynamic> json) =
      _$_Permissions.fromJson;

  @override
  bool? get DashboardAccessEnabled;
  @override
  bool? get TimesheetsAccessEnabled;
  @override
  bool? get TimesheetsCanChangeBillableStatus;
  @override
  bool? get TimesheetsCanAccessOtherUsers;
  @override
  bool? get TimesheetsCanReadOnlyAccessOtherUsers;
  @override
  bool? get TimesheetsDurationEntryTypeEnabled;
  @override
  bool? get TimesheetsHideViewJobButtonEnabled;
  @override
  bool? get TimesheetsHideViewTaskButtonEnabled;
  @override
  bool? get TimesheetsDescriptionMandatoryEnabled;
  @override
  bool? get JobAddTimesheetEntryEnabled;
  @override
  bool? get BookingAddTimesheetEntryEnabled;
  @override
  bool? get CalendarAccessEnabled;
  @override
  bool? get ActivityLogAccessEnabled;
  @override
  bool? get TemplateAccessEnabled;
  @override
  bool? get TemplatesEditable;
  @override
  bool? get QuoteAccessEnabled;
  @override
  bool? get QuotesEditable;
  @override
  bool? get QuotesSendable;
  @override
  bool? get QuotesAcceptable;
  @override
  bool? get OrderAccessEnabled;
  @override
  bool? get OrdersEditable;
  @override
  bool? get OrdersSendable;
  @override
  bool? get InvoiceAccessEnabled;
  @override
  bool? get InvoicesEditable;
  @override
  bool? get InvoicesSendable;
  @override
  bool? get InvoicesSyncable;
  @override
  bool? get PaymentsAndCreditNotesEnabled;
  @override
  bool? get SiPaymentsAndCreditNotesEnabled;
  @override
  bool? get SupplierInvoiceAccessEnabled;
  @override
  bool? get SupplierInvoicesEditable;
  @override
  bool? get SupplierInvoicesSendable;
  @override
  bool? get SupplierInvoicesSyncable;
  @override
  bool? get JobAccessEnabled;
  @override
  bool? get JobEditAddEnabled;
  @override
  bool? get JobStatusEditable;
  @override
  bool? get JobCanComplete;
  @override
  String? get JobDataVisibility;
  @override
  bool? get JobCanAcceptReject;
  @override
  bool? get JobPhotosEnabled;
  @override
  bool? get JobPhotosEditable;
  @override
  bool? get JobNotesEnabled;
  @override
  bool? get JobNotesEditable;
  @override
  bool? get JobScribblesEnabled;
  @override
  bool? get JobScribblesEditable;
  @override
  bool? get JobFilesEnabled;
  @override
  bool? get JobFilesEditable;
  @override
  bool? get JobChargesEnabled;
  @override
  bool? get JobChargesEditable;
  @override
  bool? get JobChargesAllVisible;
  @override
  bool? get JobSheetsEnabled;
  @override
  bool? get JobTemplatesEnabled;
  @override
  bool? get BookingAccessEnabled;
  @override
  bool? get BookingEditAddEnabled;
  @override
  bool? get BookingStatusEditable;
  @override
  bool? get BookingCanComplete;
  @override
  bool? get BookingCanAcceptReject;
  @override
  String? get BookingDataVisibility;
  @override
  bool? get BookingPhotosEnabled;
  @override
  bool? get BookingPhotosEditable;
  @override
  bool? get BookingNotesEnabled;
  @override
  bool? get BookingNotesEditable;
  @override
  bool? get BookingScribblesEnabled;
  @override
  bool? get BookingScribblesEditable;
  @override
  bool? get BookingFilesEnabled;
  @override
  bool? get BookingFilesEditable;
  @override
  bool? get BookingChargesEnabled;
  @override
  bool? get BookingChargesEditable;
  @override
  bool? get BookingChargesAllVisible;
  @override
  bool? get ContactAccessEnabled;
  @override
  bool? get ContactEditAddEnabled;
  @override
  bool? get ContactViewContactDetailsWithin;
  @override
  bool? get ContactNotesEnabled;
  @override
  bool? get ContactNotesEditable;
  @override
  bool? get ContactFilesEnabled;
  @override
  bool? get ContactFilesEditable;
  @override
  bool? get UserOnlyAccessEnabled;
  @override
  bool? get LivePriceBookAccessEnabled;
  @override
  bool? get ChargeAccessEnabled;
  @override
  bool? get ChargeEditAddEnabled;
  @override
  bool? get ChargePricingDetailsVisible;
  @override
  bool? get ChargeBuyPricesVisible;
  @override
  bool? get ChargeBuyPricesEditable;
  @override
  bool? get ChargeSellPricesVisible;
  @override
  bool? get ChargeSellPricesEditable;
  @override
  bool? get UnbilledChargeTotalsVisible;
  @override
  bool? get JobFinancialTotalsVisible;
  @override
  bool? get SectionCostRevenueVisible;
  @override
  bool? get JobAndBookingCostSummaryVisible;
  @override
  bool? get CalendarDefaultNavigation;
  @override
  bool? get TimesheetsDefaultNavigation;
  @override
  bool? get JobsDefaultNavigation;
  @override
  bool? get BookingsDefaultNavigation;
  @override
  bool? get QuotesDefaultNavigation;
  @override
  bool? get OrdersDefaultNavigation;
  @override
  bool? get InvoicesDefaultNavigation;
  @override
  bool? get SupplierInvoicesDefaultNavigation;
  @override
  bool? get ContactsDefaultNavigation;
  @override
  bool? get ChargesDefaultNavigation;
  @override
  bool? get JobPlanningDefaultNavigation;
  @override
  bool? get JobsNavigationEnabled;
  @override
  bool? get BookingsNavigationEnabled;
  @override
  bool? get ChargesNavigationEnabled;
  @override
  bool? get JobPlanningEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_PermissionsCopyWith<_$_Permissions> get copyWith =>
      throw _privateConstructorUsedError;
}
