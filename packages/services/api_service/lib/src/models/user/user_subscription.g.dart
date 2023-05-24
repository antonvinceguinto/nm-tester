// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSubscription _$$_UserSubscriptionFromJson(Map<String, dynamic> json) =>
    _$_UserSubscription(
      subscription_id: json['subscription_id'] as int?,
      subscription_public_name: json['subscription_public_name'] as String?,
      subscription_start_date: json['subscription_start_date'] == null
          ? null
          : DateTime.parse(json['subscription_start_date'] as String),
      subscription_expiration_date: json['subscription_expiration_date'] == null
          ? null
          : DateTime.parse(json['subscription_expiration_date'] as String),
      subscription_is_disabled: json['subscription_is_disabled'] as bool?,
      subscription_has_billing_problem:
          json['subscription_has_billing_problem'] as bool?,
      subscription_is_trial: json['subscription_is_trial'] as bool?,
      contact_is_access_disabled: json['contact_is_access_disabled'] as bool?,
      subscription_status_string: json['subscription_status_string'] as String?,
      subscription_type_string: json['subscription_type_string'] as String?,
      subscription_status_html: json['subscription_status_html'] as String?,
      subscription_is_good: json['subscription_is_good'] as bool?,
      subscription_is_buy_now_button_visible:
          json['subscription_is_buy_now_button_visible'] as bool?,
      subscription_buy_now_button_text:
          json['subscription_buy_now_button_text'] as String?,
    );

Map<String, dynamic> _$$_UserSubscriptionToJson(_$_UserSubscription instance) =>
    <String, dynamic>{
      'subscription_id': instance.subscription_id,
      'subscription_public_name': instance.subscription_public_name,
      'subscription_start_date':
          instance.subscription_start_date?.toIso8601String(),
      'subscription_expiration_date':
          instance.subscription_expiration_date?.toIso8601String(),
      'subscription_is_disabled': instance.subscription_is_disabled,
      'subscription_has_billing_problem':
          instance.subscription_has_billing_problem,
      'subscription_is_trial': instance.subscription_is_trial,
      'contact_is_access_disabled': instance.contact_is_access_disabled,
      'subscription_status_string': instance.subscription_status_string,
      'subscription_type_string': instance.subscription_type_string,
      'subscription_status_html': instance.subscription_status_html,
      'subscription_is_good': instance.subscription_is_good,
      'subscription_is_buy_now_button_visible':
          instance.subscription_is_buy_now_button_visible,
      'subscription_buy_now_button_text':
          instance.subscription_buy_now_button_text,
    };
