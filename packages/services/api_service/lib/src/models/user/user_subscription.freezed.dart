// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSubscription _$UserSubscriptionFromJson(Map<String, dynamic> json) {
  return _UserSubscription.fromJson(json);
}

/// @nodoc
mixin _$UserSubscription {
  int? get subscription_id => throw _privateConstructorUsedError;
  String? get subscription_public_name => throw _privateConstructorUsedError;
  DateTime? get subscription_start_date => throw _privateConstructorUsedError;
  DateTime? get subscription_expiration_date =>
      throw _privateConstructorUsedError;
  bool? get subscription_is_disabled => throw _privateConstructorUsedError;
  bool? get subscription_has_billing_problem =>
      throw _privateConstructorUsedError;
  bool? get subscription_is_trial => throw _privateConstructorUsedError;
  bool? get contact_is_access_disabled => throw _privateConstructorUsedError;
  String? get subscription_status_string => throw _privateConstructorUsedError;
  String? get subscription_type_string => throw _privateConstructorUsedError;
  String? get subscription_status_html => throw _privateConstructorUsedError;
  bool? get subscription_is_good => throw _privateConstructorUsedError;
  bool? get subscription_is_buy_now_button_visible =>
      throw _privateConstructorUsedError;
  String? get subscription_buy_now_button_text =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSubscriptionCopyWith<UserSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSubscriptionCopyWith<$Res> {
  factory $UserSubscriptionCopyWith(
          UserSubscription value, $Res Function(UserSubscription) then) =
      _$UserSubscriptionCopyWithImpl<$Res, UserSubscription>;
  @useResult
  $Res call(
      {int? subscription_id,
      String? subscription_public_name,
      DateTime? subscription_start_date,
      DateTime? subscription_expiration_date,
      bool? subscription_is_disabled,
      bool? subscription_has_billing_problem,
      bool? subscription_is_trial,
      bool? contact_is_access_disabled,
      String? subscription_status_string,
      String? subscription_type_string,
      String? subscription_status_html,
      bool? subscription_is_good,
      bool? subscription_is_buy_now_button_visible,
      String? subscription_buy_now_button_text});
}

/// @nodoc
class _$UserSubscriptionCopyWithImpl<$Res, $Val extends UserSubscription>
    implements $UserSubscriptionCopyWith<$Res> {
  _$UserSubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription_id = freezed,
    Object? subscription_public_name = freezed,
    Object? subscription_start_date = freezed,
    Object? subscription_expiration_date = freezed,
    Object? subscription_is_disabled = freezed,
    Object? subscription_has_billing_problem = freezed,
    Object? subscription_is_trial = freezed,
    Object? contact_is_access_disabled = freezed,
    Object? subscription_status_string = freezed,
    Object? subscription_type_string = freezed,
    Object? subscription_status_html = freezed,
    Object? subscription_is_good = freezed,
    Object? subscription_is_buy_now_button_visible = freezed,
    Object? subscription_buy_now_button_text = freezed,
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
      subscription_start_date: freezed == subscription_start_date
          ? _value.subscription_start_date
          : subscription_start_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subscription_expiration_date: freezed == subscription_expiration_date
          ? _value.subscription_expiration_date
          : subscription_expiration_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subscription_is_disabled: freezed == subscription_is_disabled
          ? _value.subscription_is_disabled
          : subscription_is_disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_has_billing_problem: freezed ==
              subscription_has_billing_problem
          ? _value.subscription_has_billing_problem
          : subscription_has_billing_problem // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_trial: freezed == subscription_is_trial
          ? _value.subscription_is_trial
          : subscription_is_trial // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_is_access_disabled: freezed == contact_is_access_disabled
          ? _value.contact_is_access_disabled
          : contact_is_access_disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_status_string: freezed == subscription_status_string
          ? _value.subscription_status_string
          : subscription_status_string // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_type_string: freezed == subscription_type_string
          ? _value.subscription_type_string
          : subscription_type_string // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_status_html: freezed == subscription_status_html
          ? _value.subscription_status_html
          : subscription_status_html // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_is_good: freezed == subscription_is_good
          ? _value.subscription_is_good
          : subscription_is_good // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_buy_now_button_visible: freezed ==
              subscription_is_buy_now_button_visible
          ? _value.subscription_is_buy_now_button_visible
          : subscription_is_buy_now_button_visible // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_buy_now_button_text: freezed ==
              subscription_buy_now_button_text
          ? _value.subscription_buy_now_button_text
          : subscription_buy_now_button_text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserSubscriptionCopyWith<$Res>
    implements $UserSubscriptionCopyWith<$Res> {
  factory _$$_UserSubscriptionCopyWith(
          _$_UserSubscription value, $Res Function(_$_UserSubscription) then) =
      __$$_UserSubscriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? subscription_id,
      String? subscription_public_name,
      DateTime? subscription_start_date,
      DateTime? subscription_expiration_date,
      bool? subscription_is_disabled,
      bool? subscription_has_billing_problem,
      bool? subscription_is_trial,
      bool? contact_is_access_disabled,
      String? subscription_status_string,
      String? subscription_type_string,
      String? subscription_status_html,
      bool? subscription_is_good,
      bool? subscription_is_buy_now_button_visible,
      String? subscription_buy_now_button_text});
}

/// @nodoc
class __$$_UserSubscriptionCopyWithImpl<$Res>
    extends _$UserSubscriptionCopyWithImpl<$Res, _$_UserSubscription>
    implements _$$_UserSubscriptionCopyWith<$Res> {
  __$$_UserSubscriptionCopyWithImpl(
      _$_UserSubscription _value, $Res Function(_$_UserSubscription) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription_id = freezed,
    Object? subscription_public_name = freezed,
    Object? subscription_start_date = freezed,
    Object? subscription_expiration_date = freezed,
    Object? subscription_is_disabled = freezed,
    Object? subscription_has_billing_problem = freezed,
    Object? subscription_is_trial = freezed,
    Object? contact_is_access_disabled = freezed,
    Object? subscription_status_string = freezed,
    Object? subscription_type_string = freezed,
    Object? subscription_status_html = freezed,
    Object? subscription_is_good = freezed,
    Object? subscription_is_buy_now_button_visible = freezed,
    Object? subscription_buy_now_button_text = freezed,
  }) {
    return _then(_$_UserSubscription(
      subscription_id: freezed == subscription_id
          ? _value.subscription_id
          : subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      subscription_public_name: freezed == subscription_public_name
          ? _value.subscription_public_name
          : subscription_public_name // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_start_date: freezed == subscription_start_date
          ? _value.subscription_start_date
          : subscription_start_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subscription_expiration_date: freezed == subscription_expiration_date
          ? _value.subscription_expiration_date
          : subscription_expiration_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      subscription_is_disabled: freezed == subscription_is_disabled
          ? _value.subscription_is_disabled
          : subscription_is_disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_has_billing_problem: freezed ==
              subscription_has_billing_problem
          ? _value.subscription_has_billing_problem
          : subscription_has_billing_problem // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_trial: freezed == subscription_is_trial
          ? _value.subscription_is_trial
          : subscription_is_trial // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_is_access_disabled: freezed == contact_is_access_disabled
          ? _value.contact_is_access_disabled
          : contact_is_access_disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_status_string: freezed == subscription_status_string
          ? _value.subscription_status_string
          : subscription_status_string // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_type_string: freezed == subscription_type_string
          ? _value.subscription_type_string
          : subscription_type_string // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_status_html: freezed == subscription_status_html
          ? _value.subscription_status_html
          : subscription_status_html // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription_is_good: freezed == subscription_is_good
          ? _value.subscription_is_good
          : subscription_is_good // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_is_buy_now_button_visible: freezed ==
              subscription_is_buy_now_button_visible
          ? _value.subscription_is_buy_now_button_visible
          : subscription_is_buy_now_button_visible // ignore: cast_nullable_to_non_nullable
              as bool?,
      subscription_buy_now_button_text: freezed ==
              subscription_buy_now_button_text
          ? _value.subscription_buy_now_button_text
          : subscription_buy_now_button_text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSubscription implements _UserSubscription {
  const _$_UserSubscription(
      {this.subscription_id,
      this.subscription_public_name,
      this.subscription_start_date,
      this.subscription_expiration_date,
      this.subscription_is_disabled,
      this.subscription_has_billing_problem,
      this.subscription_is_trial,
      this.contact_is_access_disabled,
      this.subscription_status_string,
      this.subscription_type_string,
      this.subscription_status_html,
      this.subscription_is_good,
      this.subscription_is_buy_now_button_visible,
      this.subscription_buy_now_button_text});

  factory _$_UserSubscription.fromJson(Map<String, dynamic> json) =>
      _$$_UserSubscriptionFromJson(json);

  @override
  final int? subscription_id;
  @override
  final String? subscription_public_name;
  @override
  final DateTime? subscription_start_date;
  @override
  final DateTime? subscription_expiration_date;
  @override
  final bool? subscription_is_disabled;
  @override
  final bool? subscription_has_billing_problem;
  @override
  final bool? subscription_is_trial;
  @override
  final bool? contact_is_access_disabled;
  @override
  final String? subscription_status_string;
  @override
  final String? subscription_type_string;
  @override
  final String? subscription_status_html;
  @override
  final bool? subscription_is_good;
  @override
  final bool? subscription_is_buy_now_button_visible;
  @override
  final String? subscription_buy_now_button_text;

  @override
  String toString() {
    return 'UserSubscription(subscription_id: $subscription_id, subscription_public_name: $subscription_public_name, subscription_start_date: $subscription_start_date, subscription_expiration_date: $subscription_expiration_date, subscription_is_disabled: $subscription_is_disabled, subscription_has_billing_problem: $subscription_has_billing_problem, subscription_is_trial: $subscription_is_trial, contact_is_access_disabled: $contact_is_access_disabled, subscription_status_string: $subscription_status_string, subscription_type_string: $subscription_type_string, subscription_status_html: $subscription_status_html, subscription_is_good: $subscription_is_good, subscription_is_buy_now_button_visible: $subscription_is_buy_now_button_visible, subscription_buy_now_button_text: $subscription_buy_now_button_text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSubscription &&
            (identical(other.subscription_id, subscription_id) ||
                other.subscription_id == subscription_id) &&
            (identical(other.subscription_public_name, subscription_public_name) ||
                other.subscription_public_name == subscription_public_name) &&
            (identical(other.subscription_start_date, subscription_start_date) ||
                other.subscription_start_date == subscription_start_date) &&
            (identical(other.subscription_expiration_date, subscription_expiration_date) ||
                other.subscription_expiration_date ==
                    subscription_expiration_date) &&
            (identical(other.subscription_is_disabled, subscription_is_disabled) ||
                other.subscription_is_disabled == subscription_is_disabled) &&
            (identical(other.subscription_has_billing_problem, subscription_has_billing_problem) ||
                other.subscription_has_billing_problem ==
                    subscription_has_billing_problem) &&
            (identical(other.subscription_is_trial, subscription_is_trial) ||
                other.subscription_is_trial == subscription_is_trial) &&
            (identical(other.contact_is_access_disabled, contact_is_access_disabled) ||
                other.contact_is_access_disabled ==
                    contact_is_access_disabled) &&
            (identical(other.subscription_status_string, subscription_status_string) ||
                other.subscription_status_string ==
                    subscription_status_string) &&
            (identical(other.subscription_type_string, subscription_type_string) ||
                other.subscription_type_string == subscription_type_string) &&
            (identical(other.subscription_status_html, subscription_status_html) ||
                other.subscription_status_html == subscription_status_html) &&
            (identical(other.subscription_is_good, subscription_is_good) ||
                other.subscription_is_good == subscription_is_good) &&
            (identical(other.subscription_is_buy_now_button_visible, subscription_is_buy_now_button_visible) ||
                other.subscription_is_buy_now_button_visible ==
                    subscription_is_buy_now_button_visible) &&
            (identical(other.subscription_buy_now_button_text, subscription_buy_now_button_text) ||
                other.subscription_buy_now_button_text ==
                    subscription_buy_now_button_text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      subscription_id,
      subscription_public_name,
      subscription_start_date,
      subscription_expiration_date,
      subscription_is_disabled,
      subscription_has_billing_problem,
      subscription_is_trial,
      contact_is_access_disabled,
      subscription_status_string,
      subscription_type_string,
      subscription_status_html,
      subscription_is_good,
      subscription_is_buy_now_button_visible,
      subscription_buy_now_button_text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSubscriptionCopyWith<_$_UserSubscription> get copyWith =>
      __$$_UserSubscriptionCopyWithImpl<_$_UserSubscription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSubscriptionToJson(
      this,
    );
  }
}

abstract class _UserSubscription implements UserSubscription {
  const factory _UserSubscription(
      {final int? subscription_id,
      final String? subscription_public_name,
      final DateTime? subscription_start_date,
      final DateTime? subscription_expiration_date,
      final bool? subscription_is_disabled,
      final bool? subscription_has_billing_problem,
      final bool? subscription_is_trial,
      final bool? contact_is_access_disabled,
      final String? subscription_status_string,
      final String? subscription_type_string,
      final String? subscription_status_html,
      final bool? subscription_is_good,
      final bool? subscription_is_buy_now_button_visible,
      final String? subscription_buy_now_button_text}) = _$_UserSubscription;

  factory _UserSubscription.fromJson(Map<String, dynamic> json) =
      _$_UserSubscription.fromJson;

  @override
  int? get subscription_id;
  @override
  String? get subscription_public_name;
  @override
  DateTime? get subscription_start_date;
  @override
  DateTime? get subscription_expiration_date;
  @override
  bool? get subscription_is_disabled;
  @override
  bool? get subscription_has_billing_problem;
  @override
  bool? get subscription_is_trial;
  @override
  bool? get contact_is_access_disabled;
  @override
  String? get subscription_status_string;
  @override
  String? get subscription_type_string;
  @override
  String? get subscription_status_html;
  @override
  bool? get subscription_is_good;
  @override
  bool? get subscription_is_buy_now_button_visible;
  @override
  String? get subscription_buy_now_button_text;
  @override
  @JsonKey(ignore: true)
  _$$_UserSubscriptionCopyWith<_$_UserSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}
