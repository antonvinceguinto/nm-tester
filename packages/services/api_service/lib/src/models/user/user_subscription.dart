import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_subscription.freezed.dart';
part 'user_subscription.g.dart';

@freezed
class UserSubscription with _$UserSubscription {
  const factory UserSubscription({
    int? subscription_id,
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
    String? subscription_buy_now_button_text,
  }) = _UserSubscription;

  factory UserSubscription.fromJson(Map<String, dynamic> json) =>
      _$UserSubscriptionFromJson(json);
}
