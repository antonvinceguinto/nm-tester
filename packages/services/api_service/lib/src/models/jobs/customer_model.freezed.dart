// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return _CustomerModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerModel {
  List<CustomerDatum> get data => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get total_all => throw _privateConstructorUsedError;
  List<HardwareProvider> get hardwareProviders =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerModelCopyWith<CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerModelCopyWith<$Res> {
  factory $CustomerModelCopyWith(
          CustomerModel value, $Res Function(CustomerModel) then) =
      _$CustomerModelCopyWithImpl<$Res, CustomerModel>;
  @useResult
  $Res call(
      {List<CustomerDatum> data,
      int? total,
      int? total_all,
      List<HardwareProvider> hardwareProviders});
}

/// @nodoc
class _$CustomerModelCopyWithImpl<$Res, $Val extends CustomerModel>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = freezed,
    Object? total_all = freezed,
    Object? hardwareProviders = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CustomerDatum>,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      total_all: freezed == total_all
          ? _value.total_all
          : total_all // ignore: cast_nullable_to_non_nullable
              as int?,
      hardwareProviders: null == hardwareProviders
          ? _value.hardwareProviders
          : hardwareProviders // ignore: cast_nullable_to_non_nullable
              as List<HardwareProvider>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerModelCopyWith<$Res>
    implements $CustomerModelCopyWith<$Res> {
  factory _$$_CustomerModelCopyWith(
          _$_CustomerModel value, $Res Function(_$_CustomerModel) then) =
      __$$_CustomerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CustomerDatum> data,
      int? total,
      int? total_all,
      List<HardwareProvider> hardwareProviders});
}

/// @nodoc
class __$$_CustomerModelCopyWithImpl<$Res>
    extends _$CustomerModelCopyWithImpl<$Res, _$_CustomerModel>
    implements _$$_CustomerModelCopyWith<$Res> {
  __$$_CustomerModelCopyWithImpl(
      _$_CustomerModel _value, $Res Function(_$_CustomerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? total = freezed,
    Object? total_all = freezed,
    Object? hardwareProviders = null,
  }) {
    return _then(_$_CustomerModel(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CustomerDatum>,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      total_all: freezed == total_all
          ? _value.total_all
          : total_all // ignore: cast_nullable_to_non_nullable
              as int?,
      hardwareProviders: null == hardwareProviders
          ? _value._hardwareProviders
          : hardwareProviders // ignore: cast_nullable_to_non_nullable
              as List<HardwareProvider>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerModel implements _CustomerModel {
  const _$_CustomerModel(
      {final List<CustomerDatum> data = const [],
      this.total,
      this.total_all,
      final List<HardwareProvider> hardwareProviders = const []})
      : _data = data,
        _hardwareProviders = hardwareProviders;

  factory _$_CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerModelFromJson(json);

  final List<CustomerDatum> _data;
  @override
  @JsonKey()
  List<CustomerDatum> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final int? total;
  @override
  final int? total_all;
  final List<HardwareProvider> _hardwareProviders;
  @override
  @JsonKey()
  List<HardwareProvider> get hardwareProviders {
    if (_hardwareProviders is EqualUnmodifiableListView)
      return _hardwareProviders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hardwareProviders);
  }

  @override
  String toString() {
    return 'CustomerModel(data: $data, total: $total, total_all: $total_all, hardwareProviders: $hardwareProviders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerModel &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.total_all, total_all) ||
                other.total_all == total_all) &&
            const DeepCollectionEquality()
                .equals(other._hardwareProviders, _hardwareProviders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      total,
      total_all,
      const DeepCollectionEquality().hash(_hardwareProviders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerModelCopyWith<_$_CustomerModel> get copyWith =>
      __$$_CustomerModelCopyWithImpl<_$_CustomerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerModelToJson(
      this,
    );
  }
}

abstract class _CustomerModel implements CustomerModel {
  const factory _CustomerModel(
      {final List<CustomerDatum> data,
      final int? total,
      final int? total_all,
      final List<HardwareProvider> hardwareProviders}) = _$_CustomerModel;

  factory _CustomerModel.fromJson(Map<String, dynamic> json) =
      _$_CustomerModel.fromJson;

  @override
  List<CustomerDatum> get data;
  @override
  int? get total;
  @override
  int? get total_all;
  @override
  List<HardwareProvider> get hardwareProviders;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerModelCopyWith<_$_CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

HardwareProvider _$HardwareProviderFromJson(Map<String, dynamic> json) {
  return _HardwareProvider.fromJson(json);
}

/// @nodoc
mixin _$HardwareProvider {
  String? get is_name => throw _privateConstructorUsedError;
  int? get is_contact_id => throw _privateConstructorUsedError;
  int? get is_tagged_products_contact_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HardwareProviderCopyWith<HardwareProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HardwareProviderCopyWith<$Res> {
  factory $HardwareProviderCopyWith(
          HardwareProvider value, $Res Function(HardwareProvider) then) =
      _$HardwareProviderCopyWithImpl<$Res, HardwareProvider>;
  @useResult
  $Res call(
      {String? is_name,
      int? is_contact_id,
      int? is_tagged_products_contact_id});
}

/// @nodoc
class _$HardwareProviderCopyWithImpl<$Res, $Val extends HardwareProvider>
    implements $HardwareProviderCopyWith<$Res> {
  _$HardwareProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? is_name = freezed,
    Object? is_contact_id = freezed,
    Object? is_tagged_products_contact_id = freezed,
  }) {
    return _then(_value.copyWith(
      is_name: freezed == is_name
          ? _value.is_name
          : is_name // ignore: cast_nullable_to_non_nullable
              as String?,
      is_contact_id: freezed == is_contact_id
          ? _value.is_contact_id
          : is_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      is_tagged_products_contact_id: freezed == is_tagged_products_contact_id
          ? _value.is_tagged_products_contact_id
          : is_tagged_products_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HardwareProviderCopyWith<$Res>
    implements $HardwareProviderCopyWith<$Res> {
  factory _$$_HardwareProviderCopyWith(
          _$_HardwareProvider value, $Res Function(_$_HardwareProvider) then) =
      __$$_HardwareProviderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? is_name,
      int? is_contact_id,
      int? is_tagged_products_contact_id});
}

/// @nodoc
class __$$_HardwareProviderCopyWithImpl<$Res>
    extends _$HardwareProviderCopyWithImpl<$Res, _$_HardwareProvider>
    implements _$$_HardwareProviderCopyWith<$Res> {
  __$$_HardwareProviderCopyWithImpl(
      _$_HardwareProvider _value, $Res Function(_$_HardwareProvider) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? is_name = freezed,
    Object? is_contact_id = freezed,
    Object? is_tagged_products_contact_id = freezed,
  }) {
    return _then(_$_HardwareProvider(
      is_name: freezed == is_name
          ? _value.is_name
          : is_name // ignore: cast_nullable_to_non_nullable
              as String?,
      is_contact_id: freezed == is_contact_id
          ? _value.is_contact_id
          : is_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      is_tagged_products_contact_id: freezed == is_tagged_products_contact_id
          ? _value.is_tagged_products_contact_id
          : is_tagged_products_contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HardwareProvider implements _HardwareProvider {
  const _$_HardwareProvider(
      {this.is_name, this.is_contact_id, this.is_tagged_products_contact_id});

  factory _$_HardwareProvider.fromJson(Map<String, dynamic> json) =>
      _$$_HardwareProviderFromJson(json);

  @override
  final String? is_name;
  @override
  final int? is_contact_id;
  @override
  final int? is_tagged_products_contact_id;

  @override
  String toString() {
    return 'HardwareProvider(is_name: $is_name, is_contact_id: $is_contact_id, is_tagged_products_contact_id: $is_tagged_products_contact_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HardwareProvider &&
            (identical(other.is_name, is_name) || other.is_name == is_name) &&
            (identical(other.is_contact_id, is_contact_id) ||
                other.is_contact_id == is_contact_id) &&
            (identical(other.is_tagged_products_contact_id,
                    is_tagged_products_contact_id) ||
                other.is_tagged_products_contact_id ==
                    is_tagged_products_contact_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, is_name, is_contact_id, is_tagged_products_contact_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HardwareProviderCopyWith<_$_HardwareProvider> get copyWith =>
      __$$_HardwareProviderCopyWithImpl<_$_HardwareProvider>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HardwareProviderToJson(
      this,
    );
  }
}

abstract class _HardwareProvider implements HardwareProvider {
  const factory _HardwareProvider(
      {final String? is_name,
      final int? is_contact_id,
      final int? is_tagged_products_contact_id}) = _$_HardwareProvider;

  factory _HardwareProvider.fromJson(Map<String, dynamic> json) =
      _$_HardwareProvider.fromJson;

  @override
  String? get is_name;
  @override
  int? get is_contact_id;
  @override
  int? get is_tagged_products_contact_id;
  @override
  @JsonKey(ignore: true)
  _$$_HardwareProviderCopyWith<_$_HardwareProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerDatum _$CustomerDatumFromJson(Map<String, dynamic> json) {
  return _CustomerDatum.fromJson(json);
}

/// @nodoc
mixin _$CustomerDatum {
  bool? get contact_is_user => throw _privateConstructorUsedError;
  bool? get contact_is_admin => throw _privateConstructorUsedError;
  bool? get contact_is_access_disabled => throw _privateConstructorUsedError;
  int? get contact_subrole_id => throw _privateConstructorUsedError;
  String? get contact_subrole_name => throw _privateConstructorUsedError;
  String? get contact_invitation_status => throw _privateConstructorUsedError;
  String? get contact_invitation_type => throw _privateConstructorUsedError;
  int? get contact_id => throw _privateConstructorUsedError;
  String? get contact_code => throw _privateConstructorUsedError;
  String? get contact_initials => throw _privateConstructorUsedError;
  String? get contact_name_display => throw _privateConstructorUsedError;
  String? get contact_name_first => throw _privateConstructorUsedError;
  String? get contact_name_last => throw _privateConstructorUsedError;
  String? get contact_name_business => throw _privateConstructorUsedError;
  String? get contact_address => throw _privateConstructorUsedError;
  String? get contact_address_coords => throw _privateConstructorUsedError;
  String? get contact_billing_address => throw _privateConstructorUsedError;
  String? get contact_email => throw _privateConstructorUsedError;
  String? get contact_email_for_invoices => throw _privateConstructorUsedError;
  String? get contact_special_notes => throw _privateConstructorUsedError;
  String? get contact_phone_ddi => throw _privateConstructorUsedError;
  String? get contact_phone_work => throw _privateConstructorUsedError;
  String? get contact_phone_mobile => throw _privateConstructorUsedError;
  String? get contact_phone_home => throw _privateConstructorUsedError;
  String? get contact_phone_fax => throw _privateConstructorUsedError;
  int? get contact_subscription_id => throw _privateConstructorUsedError;
  bool? get contact_has_profile_photo => throw _privateConstructorUsedError;
  String? get contact_brush_colour_argb => throw _privateConstructorUsedError;
  String? get contact_photo_uri => throw _privateConstructorUsedError;
  String? get contact_photo_thumb_uri => throw _privateConstructorUsedError;
  String? get contact_logo_uri => throw _privateConstructorUsedError;
  String? get contact_web_site => throw _privateConstructorUsedError;
  List<CustomerContactType> get contact_types =>
      throw _privateConstructorUsedError;
  bool? get contact_is_integrated_supplier =>
      throw _privateConstructorUsedError;
  bool? get contact_is_supplier_for_tagged_products =>
      throw _privateConstructorUsedError;
  String? get contact_hardware_provider => throw _privateConstructorUsedError;
  String? get integrated_supplier_name => throw _privateConstructorUsedError;
  bool? get contact_isdeleted => throw _privateConstructorUsedError;
  bool? get contact_is_archived => throw _privateConstructorUsedError;
  int? get contact_invoice_due_rule => throw _privateConstructorUsedError;
  dynamic get contact_invoice_due_days => throw _privateConstructorUsedError;
  int? get contact_quote_expiry_rule => throw _privateConstructorUsedError;
  dynamic get contact_quote_expiry_days => throw _privateConstructorUsedError;
  bool? get contact_has_saleitems => throw _privateConstructorUsedError;
  dynamic get conatct_is_linked_to_related_object =>
      throw _privateConstructorUsedError;
  String? get contact_created_by_contact_name_display =>
      throw _privateConstructorUsedError;
  DateTime? get contact_created_date => throw _privateConstructorUsedError;
  String? get contact_updated_by_contact_name_display =>
      throw _privateConstructorUsedError;
  DateTime? get contact_updated_date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerDatumCopyWith<CustomerDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerDatumCopyWith<$Res> {
  factory $CustomerDatumCopyWith(
          CustomerDatum value, $Res Function(CustomerDatum) then) =
      _$CustomerDatumCopyWithImpl<$Res, CustomerDatum>;
  @useResult
  $Res call(
      {bool? contact_is_user,
      bool? contact_is_admin,
      bool? contact_is_access_disabled,
      int? contact_subrole_id,
      String? contact_subrole_name,
      String? contact_invitation_status,
      String? contact_invitation_type,
      int? contact_id,
      String? contact_code,
      String? contact_initials,
      String? contact_name_display,
      String? contact_name_first,
      String? contact_name_last,
      String? contact_name_business,
      String? contact_address,
      String? contact_address_coords,
      String? contact_billing_address,
      String? contact_email,
      String? contact_email_for_invoices,
      String? contact_special_notes,
      String? contact_phone_ddi,
      String? contact_phone_work,
      String? contact_phone_mobile,
      String? contact_phone_home,
      String? contact_phone_fax,
      int? contact_subscription_id,
      bool? contact_has_profile_photo,
      String? contact_brush_colour_argb,
      String? contact_photo_uri,
      String? contact_photo_thumb_uri,
      String? contact_logo_uri,
      String? contact_web_site,
      List<CustomerContactType> contact_types,
      bool? contact_is_integrated_supplier,
      bool? contact_is_supplier_for_tagged_products,
      String? contact_hardware_provider,
      String? integrated_supplier_name,
      bool? contact_isdeleted,
      bool? contact_is_archived,
      int? contact_invoice_due_rule,
      dynamic contact_invoice_due_days,
      int? contact_quote_expiry_rule,
      dynamic contact_quote_expiry_days,
      bool? contact_has_saleitems,
      dynamic conatct_is_linked_to_related_object,
      String? contact_created_by_contact_name_display,
      DateTime? contact_created_date,
      String? contact_updated_by_contact_name_display,
      DateTime? contact_updated_date});
}

/// @nodoc
class _$CustomerDatumCopyWithImpl<$Res, $Val extends CustomerDatum>
    implements $CustomerDatumCopyWith<$Res> {
  _$CustomerDatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact_is_user = freezed,
    Object? contact_is_admin = freezed,
    Object? contact_is_access_disabled = freezed,
    Object? contact_subrole_id = freezed,
    Object? contact_subrole_name = freezed,
    Object? contact_invitation_status = freezed,
    Object? contact_invitation_type = freezed,
    Object? contact_id = freezed,
    Object? contact_code = freezed,
    Object? contact_initials = freezed,
    Object? contact_name_display = freezed,
    Object? contact_name_first = freezed,
    Object? contact_name_last = freezed,
    Object? contact_name_business = freezed,
    Object? contact_address = freezed,
    Object? contact_address_coords = freezed,
    Object? contact_billing_address = freezed,
    Object? contact_email = freezed,
    Object? contact_email_for_invoices = freezed,
    Object? contact_special_notes = freezed,
    Object? contact_phone_ddi = freezed,
    Object? contact_phone_work = freezed,
    Object? contact_phone_mobile = freezed,
    Object? contact_phone_home = freezed,
    Object? contact_phone_fax = freezed,
    Object? contact_subscription_id = freezed,
    Object? contact_has_profile_photo = freezed,
    Object? contact_brush_colour_argb = freezed,
    Object? contact_photo_uri = freezed,
    Object? contact_photo_thumb_uri = freezed,
    Object? contact_logo_uri = freezed,
    Object? contact_web_site = freezed,
    Object? contact_types = null,
    Object? contact_is_integrated_supplier = freezed,
    Object? contact_is_supplier_for_tagged_products = freezed,
    Object? contact_hardware_provider = freezed,
    Object? integrated_supplier_name = freezed,
    Object? contact_isdeleted = freezed,
    Object? contact_is_archived = freezed,
    Object? contact_invoice_due_rule = freezed,
    Object? contact_invoice_due_days = freezed,
    Object? contact_quote_expiry_rule = freezed,
    Object? contact_quote_expiry_days = freezed,
    Object? contact_has_saleitems = freezed,
    Object? conatct_is_linked_to_related_object = freezed,
    Object? contact_created_by_contact_name_display = freezed,
    Object? contact_created_date = freezed,
    Object? contact_updated_by_contact_name_display = freezed,
    Object? contact_updated_date = freezed,
  }) {
    return _then(_value.copyWith(
      contact_is_user: freezed == contact_is_user
          ? _value.contact_is_user
          : contact_is_user // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_is_admin: freezed == contact_is_admin
          ? _value.contact_is_admin
          : contact_is_admin // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_is_access_disabled: freezed == contact_is_access_disabled
          ? _value.contact_is_access_disabled
          : contact_is_access_disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_subrole_id: freezed == contact_subrole_id
          ? _value.contact_subrole_id
          : contact_subrole_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contact_subrole_name: freezed == contact_subrole_name
          ? _value.contact_subrole_name
          : contact_subrole_name // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_invitation_status: freezed == contact_invitation_status
          ? _value.contact_invitation_status
          : contact_invitation_status // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_invitation_type: freezed == contact_invitation_type
          ? _value.contact_invitation_type
          : contact_invitation_type // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_id: freezed == contact_id
          ? _value.contact_id
          : contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contact_code: freezed == contact_code
          ? _value.contact_code
          : contact_code // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_initials: freezed == contact_initials
          ? _value.contact_initials
          : contact_initials // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_name_display: freezed == contact_name_display
          ? _value.contact_name_display
          : contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_name_first: freezed == contact_name_first
          ? _value.contact_name_first
          : contact_name_first // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_name_last: freezed == contact_name_last
          ? _value.contact_name_last
          : contact_name_last // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_name_business: freezed == contact_name_business
          ? _value.contact_name_business
          : contact_name_business // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_address: freezed == contact_address
          ? _value.contact_address
          : contact_address // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_address_coords: freezed == contact_address_coords
          ? _value.contact_address_coords
          : contact_address_coords // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_billing_address: freezed == contact_billing_address
          ? _value.contact_billing_address
          : contact_billing_address // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_email: freezed == contact_email
          ? _value.contact_email
          : contact_email // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_email_for_invoices: freezed == contact_email_for_invoices
          ? _value.contact_email_for_invoices
          : contact_email_for_invoices // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_special_notes: freezed == contact_special_notes
          ? _value.contact_special_notes
          : contact_special_notes // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_phone_ddi: freezed == contact_phone_ddi
          ? _value.contact_phone_ddi
          : contact_phone_ddi // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_phone_work: freezed == contact_phone_work
          ? _value.contact_phone_work
          : contact_phone_work // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_phone_mobile: freezed == contact_phone_mobile
          ? _value.contact_phone_mobile
          : contact_phone_mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_phone_home: freezed == contact_phone_home
          ? _value.contact_phone_home
          : contact_phone_home // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_phone_fax: freezed == contact_phone_fax
          ? _value.contact_phone_fax
          : contact_phone_fax // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_subscription_id: freezed == contact_subscription_id
          ? _value.contact_subscription_id
          : contact_subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contact_has_profile_photo: freezed == contact_has_profile_photo
          ? _value.contact_has_profile_photo
          : contact_has_profile_photo // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_brush_colour_argb: freezed == contact_brush_colour_argb
          ? _value.contact_brush_colour_argb
          : contact_brush_colour_argb // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_photo_uri: freezed == contact_photo_uri
          ? _value.contact_photo_uri
          : contact_photo_uri // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_photo_thumb_uri: freezed == contact_photo_thumb_uri
          ? _value.contact_photo_thumb_uri
          : contact_photo_thumb_uri // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_logo_uri: freezed == contact_logo_uri
          ? _value.contact_logo_uri
          : contact_logo_uri // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_web_site: freezed == contact_web_site
          ? _value.contact_web_site
          : contact_web_site // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_types: null == contact_types
          ? _value.contact_types
          : contact_types // ignore: cast_nullable_to_non_nullable
              as List<CustomerContactType>,
      contact_is_integrated_supplier: freezed == contact_is_integrated_supplier
          ? _value.contact_is_integrated_supplier
          : contact_is_integrated_supplier // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_is_supplier_for_tagged_products: freezed ==
              contact_is_supplier_for_tagged_products
          ? _value.contact_is_supplier_for_tagged_products
          : contact_is_supplier_for_tagged_products // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_hardware_provider: freezed == contact_hardware_provider
          ? _value.contact_hardware_provider
          : contact_hardware_provider // ignore: cast_nullable_to_non_nullable
              as String?,
      integrated_supplier_name: freezed == integrated_supplier_name
          ? _value.integrated_supplier_name
          : integrated_supplier_name // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_isdeleted: freezed == contact_isdeleted
          ? _value.contact_isdeleted
          : contact_isdeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_is_archived: freezed == contact_is_archived
          ? _value.contact_is_archived
          : contact_is_archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_invoice_due_rule: freezed == contact_invoice_due_rule
          ? _value.contact_invoice_due_rule
          : contact_invoice_due_rule // ignore: cast_nullable_to_non_nullable
              as int?,
      contact_invoice_due_days: freezed == contact_invoice_due_days
          ? _value.contact_invoice_due_days
          : contact_invoice_due_days // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contact_quote_expiry_rule: freezed == contact_quote_expiry_rule
          ? _value.contact_quote_expiry_rule
          : contact_quote_expiry_rule // ignore: cast_nullable_to_non_nullable
              as int?,
      contact_quote_expiry_days: freezed == contact_quote_expiry_days
          ? _value.contact_quote_expiry_days
          : contact_quote_expiry_days // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contact_has_saleitems: freezed == contact_has_saleitems
          ? _value.contact_has_saleitems
          : contact_has_saleitems // ignore: cast_nullable_to_non_nullable
              as bool?,
      conatct_is_linked_to_related_object: freezed ==
              conatct_is_linked_to_related_object
          ? _value.conatct_is_linked_to_related_object
          : conatct_is_linked_to_related_object // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contact_created_by_contact_name_display: freezed ==
              contact_created_by_contact_name_display
          ? _value.contact_created_by_contact_name_display
          : contact_created_by_contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_created_date: freezed == contact_created_date
          ? _value.contact_created_date
          : contact_created_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contact_updated_by_contact_name_display: freezed ==
              contact_updated_by_contact_name_display
          ? _value.contact_updated_by_contact_name_display
          : contact_updated_by_contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_updated_date: freezed == contact_updated_date
          ? _value.contact_updated_date
          : contact_updated_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerDatumCopyWith<$Res>
    implements $CustomerDatumCopyWith<$Res> {
  factory _$$_CustomerDatumCopyWith(
          _$_CustomerDatum value, $Res Function(_$_CustomerDatum) then) =
      __$$_CustomerDatumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? contact_is_user,
      bool? contact_is_admin,
      bool? contact_is_access_disabled,
      int? contact_subrole_id,
      String? contact_subrole_name,
      String? contact_invitation_status,
      String? contact_invitation_type,
      int? contact_id,
      String? contact_code,
      String? contact_initials,
      String? contact_name_display,
      String? contact_name_first,
      String? contact_name_last,
      String? contact_name_business,
      String? contact_address,
      String? contact_address_coords,
      String? contact_billing_address,
      String? contact_email,
      String? contact_email_for_invoices,
      String? contact_special_notes,
      String? contact_phone_ddi,
      String? contact_phone_work,
      String? contact_phone_mobile,
      String? contact_phone_home,
      String? contact_phone_fax,
      int? contact_subscription_id,
      bool? contact_has_profile_photo,
      String? contact_brush_colour_argb,
      String? contact_photo_uri,
      String? contact_photo_thumb_uri,
      String? contact_logo_uri,
      String? contact_web_site,
      List<CustomerContactType> contact_types,
      bool? contact_is_integrated_supplier,
      bool? contact_is_supplier_for_tagged_products,
      String? contact_hardware_provider,
      String? integrated_supplier_name,
      bool? contact_isdeleted,
      bool? contact_is_archived,
      int? contact_invoice_due_rule,
      dynamic contact_invoice_due_days,
      int? contact_quote_expiry_rule,
      dynamic contact_quote_expiry_days,
      bool? contact_has_saleitems,
      dynamic conatct_is_linked_to_related_object,
      String? contact_created_by_contact_name_display,
      DateTime? contact_created_date,
      String? contact_updated_by_contact_name_display,
      DateTime? contact_updated_date});
}

/// @nodoc
class __$$_CustomerDatumCopyWithImpl<$Res>
    extends _$CustomerDatumCopyWithImpl<$Res, _$_CustomerDatum>
    implements _$$_CustomerDatumCopyWith<$Res> {
  __$$_CustomerDatumCopyWithImpl(
      _$_CustomerDatum _value, $Res Function(_$_CustomerDatum) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact_is_user = freezed,
    Object? contact_is_admin = freezed,
    Object? contact_is_access_disabled = freezed,
    Object? contact_subrole_id = freezed,
    Object? contact_subrole_name = freezed,
    Object? contact_invitation_status = freezed,
    Object? contact_invitation_type = freezed,
    Object? contact_id = freezed,
    Object? contact_code = freezed,
    Object? contact_initials = freezed,
    Object? contact_name_display = freezed,
    Object? contact_name_first = freezed,
    Object? contact_name_last = freezed,
    Object? contact_name_business = freezed,
    Object? contact_address = freezed,
    Object? contact_address_coords = freezed,
    Object? contact_billing_address = freezed,
    Object? contact_email = freezed,
    Object? contact_email_for_invoices = freezed,
    Object? contact_special_notes = freezed,
    Object? contact_phone_ddi = freezed,
    Object? contact_phone_work = freezed,
    Object? contact_phone_mobile = freezed,
    Object? contact_phone_home = freezed,
    Object? contact_phone_fax = freezed,
    Object? contact_subscription_id = freezed,
    Object? contact_has_profile_photo = freezed,
    Object? contact_brush_colour_argb = freezed,
    Object? contact_photo_uri = freezed,
    Object? contact_photo_thumb_uri = freezed,
    Object? contact_logo_uri = freezed,
    Object? contact_web_site = freezed,
    Object? contact_types = null,
    Object? contact_is_integrated_supplier = freezed,
    Object? contact_is_supplier_for_tagged_products = freezed,
    Object? contact_hardware_provider = freezed,
    Object? integrated_supplier_name = freezed,
    Object? contact_isdeleted = freezed,
    Object? contact_is_archived = freezed,
    Object? contact_invoice_due_rule = freezed,
    Object? contact_invoice_due_days = freezed,
    Object? contact_quote_expiry_rule = freezed,
    Object? contact_quote_expiry_days = freezed,
    Object? contact_has_saleitems = freezed,
    Object? conatct_is_linked_to_related_object = freezed,
    Object? contact_created_by_contact_name_display = freezed,
    Object? contact_created_date = freezed,
    Object? contact_updated_by_contact_name_display = freezed,
    Object? contact_updated_date = freezed,
  }) {
    return _then(_$_CustomerDatum(
      contact_is_user: freezed == contact_is_user
          ? _value.contact_is_user
          : contact_is_user // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_is_admin: freezed == contact_is_admin
          ? _value.contact_is_admin
          : contact_is_admin // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_is_access_disabled: freezed == contact_is_access_disabled
          ? _value.contact_is_access_disabled
          : contact_is_access_disabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_subrole_id: freezed == contact_subrole_id
          ? _value.contact_subrole_id
          : contact_subrole_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contact_subrole_name: freezed == contact_subrole_name
          ? _value.contact_subrole_name
          : contact_subrole_name // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_invitation_status: freezed == contact_invitation_status
          ? _value.contact_invitation_status
          : contact_invitation_status // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_invitation_type: freezed == contact_invitation_type
          ? _value.contact_invitation_type
          : contact_invitation_type // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_id: freezed == contact_id
          ? _value.contact_id
          : contact_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contact_code: freezed == contact_code
          ? _value.contact_code
          : contact_code // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_initials: freezed == contact_initials
          ? _value.contact_initials
          : contact_initials // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_name_display: freezed == contact_name_display
          ? _value.contact_name_display
          : contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_name_first: freezed == contact_name_first
          ? _value.contact_name_first
          : contact_name_first // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_name_last: freezed == contact_name_last
          ? _value.contact_name_last
          : contact_name_last // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_name_business: freezed == contact_name_business
          ? _value.contact_name_business
          : contact_name_business // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_address: freezed == contact_address
          ? _value.contact_address
          : contact_address // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_address_coords: freezed == contact_address_coords
          ? _value.contact_address_coords
          : contact_address_coords // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_billing_address: freezed == contact_billing_address
          ? _value.contact_billing_address
          : contact_billing_address // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_email: freezed == contact_email
          ? _value.contact_email
          : contact_email // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_email_for_invoices: freezed == contact_email_for_invoices
          ? _value.contact_email_for_invoices
          : contact_email_for_invoices // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_special_notes: freezed == contact_special_notes
          ? _value.contact_special_notes
          : contact_special_notes // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_phone_ddi: freezed == contact_phone_ddi
          ? _value.contact_phone_ddi
          : contact_phone_ddi // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_phone_work: freezed == contact_phone_work
          ? _value.contact_phone_work
          : contact_phone_work // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_phone_mobile: freezed == contact_phone_mobile
          ? _value.contact_phone_mobile
          : contact_phone_mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_phone_home: freezed == contact_phone_home
          ? _value.contact_phone_home
          : contact_phone_home // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_phone_fax: freezed == contact_phone_fax
          ? _value.contact_phone_fax
          : contact_phone_fax // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_subscription_id: freezed == contact_subscription_id
          ? _value.contact_subscription_id
          : contact_subscription_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contact_has_profile_photo: freezed == contact_has_profile_photo
          ? _value.contact_has_profile_photo
          : contact_has_profile_photo // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_brush_colour_argb: freezed == contact_brush_colour_argb
          ? _value.contact_brush_colour_argb
          : contact_brush_colour_argb // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_photo_uri: freezed == contact_photo_uri
          ? _value.contact_photo_uri
          : contact_photo_uri // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_photo_thumb_uri: freezed == contact_photo_thumb_uri
          ? _value.contact_photo_thumb_uri
          : contact_photo_thumb_uri // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_logo_uri: freezed == contact_logo_uri
          ? _value.contact_logo_uri
          : contact_logo_uri // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_web_site: freezed == contact_web_site
          ? _value.contact_web_site
          : contact_web_site // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_types: null == contact_types
          ? _value._contact_types
          : contact_types // ignore: cast_nullable_to_non_nullable
              as List<CustomerContactType>,
      contact_is_integrated_supplier: freezed == contact_is_integrated_supplier
          ? _value.contact_is_integrated_supplier
          : contact_is_integrated_supplier // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_is_supplier_for_tagged_products: freezed ==
              contact_is_supplier_for_tagged_products
          ? _value.contact_is_supplier_for_tagged_products
          : contact_is_supplier_for_tagged_products // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_hardware_provider: freezed == contact_hardware_provider
          ? _value.contact_hardware_provider
          : contact_hardware_provider // ignore: cast_nullable_to_non_nullable
              as String?,
      integrated_supplier_name: freezed == integrated_supplier_name
          ? _value.integrated_supplier_name
          : integrated_supplier_name // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_isdeleted: freezed == contact_isdeleted
          ? _value.contact_isdeleted
          : contact_isdeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_is_archived: freezed == contact_is_archived
          ? _value.contact_is_archived
          : contact_is_archived // ignore: cast_nullable_to_non_nullable
              as bool?,
      contact_invoice_due_rule: freezed == contact_invoice_due_rule
          ? _value.contact_invoice_due_rule
          : contact_invoice_due_rule // ignore: cast_nullable_to_non_nullable
              as int?,
      contact_invoice_due_days: freezed == contact_invoice_due_days
          ? _value.contact_invoice_due_days
          : contact_invoice_due_days // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contact_quote_expiry_rule: freezed == contact_quote_expiry_rule
          ? _value.contact_quote_expiry_rule
          : contact_quote_expiry_rule // ignore: cast_nullable_to_non_nullable
              as int?,
      contact_quote_expiry_days: freezed == contact_quote_expiry_days
          ? _value.contact_quote_expiry_days
          : contact_quote_expiry_days // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contact_has_saleitems: freezed == contact_has_saleitems
          ? _value.contact_has_saleitems
          : contact_has_saleitems // ignore: cast_nullable_to_non_nullable
              as bool?,
      conatct_is_linked_to_related_object: freezed ==
              conatct_is_linked_to_related_object
          ? _value.conatct_is_linked_to_related_object
          : conatct_is_linked_to_related_object // ignore: cast_nullable_to_non_nullable
              as dynamic,
      contact_created_by_contact_name_display: freezed ==
              contact_created_by_contact_name_display
          ? _value.contact_created_by_contact_name_display
          : contact_created_by_contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_created_date: freezed == contact_created_date
          ? _value.contact_created_date
          : contact_created_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      contact_updated_by_contact_name_display: freezed ==
              contact_updated_by_contact_name_display
          ? _value.contact_updated_by_contact_name_display
          : contact_updated_by_contact_name_display // ignore: cast_nullable_to_non_nullable
              as String?,
      contact_updated_date: freezed == contact_updated_date
          ? _value.contact_updated_date
          : contact_updated_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerDatum implements _CustomerDatum {
  const _$_CustomerDatum(
      {this.contact_is_user,
      this.contact_is_admin,
      this.contact_is_access_disabled,
      this.contact_subrole_id,
      this.contact_subrole_name,
      this.contact_invitation_status,
      this.contact_invitation_type,
      this.contact_id,
      this.contact_code,
      this.contact_initials,
      this.contact_name_display,
      this.contact_name_first,
      this.contact_name_last,
      this.contact_name_business,
      this.contact_address,
      this.contact_address_coords,
      this.contact_billing_address,
      this.contact_email,
      this.contact_email_for_invoices,
      this.contact_special_notes,
      this.contact_phone_ddi,
      this.contact_phone_work,
      this.contact_phone_mobile,
      this.contact_phone_home,
      this.contact_phone_fax,
      this.contact_subscription_id,
      this.contact_has_profile_photo,
      this.contact_brush_colour_argb,
      this.contact_photo_uri,
      this.contact_photo_thumb_uri,
      this.contact_logo_uri,
      this.contact_web_site,
      final List<CustomerContactType> contact_types = const [],
      this.contact_is_integrated_supplier,
      this.contact_is_supplier_for_tagged_products,
      this.contact_hardware_provider,
      this.integrated_supplier_name,
      this.contact_isdeleted,
      this.contact_is_archived,
      this.contact_invoice_due_rule,
      this.contact_invoice_due_days,
      this.contact_quote_expiry_rule,
      this.contact_quote_expiry_days,
      this.contact_has_saleitems,
      this.conatct_is_linked_to_related_object,
      this.contact_created_by_contact_name_display,
      this.contact_created_date,
      this.contact_updated_by_contact_name_display,
      this.contact_updated_date})
      : _contact_types = contact_types;

  factory _$_CustomerDatum.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerDatumFromJson(json);

  @override
  final bool? contact_is_user;
  @override
  final bool? contact_is_admin;
  @override
  final bool? contact_is_access_disabled;
  @override
  final int? contact_subrole_id;
  @override
  final String? contact_subrole_name;
  @override
  final String? contact_invitation_status;
  @override
  final String? contact_invitation_type;
  @override
  final int? contact_id;
  @override
  final String? contact_code;
  @override
  final String? contact_initials;
  @override
  final String? contact_name_display;
  @override
  final String? contact_name_first;
  @override
  final String? contact_name_last;
  @override
  final String? contact_name_business;
  @override
  final String? contact_address;
  @override
  final String? contact_address_coords;
  @override
  final String? contact_billing_address;
  @override
  final String? contact_email;
  @override
  final String? contact_email_for_invoices;
  @override
  final String? contact_special_notes;
  @override
  final String? contact_phone_ddi;
  @override
  final String? contact_phone_work;
  @override
  final String? contact_phone_mobile;
  @override
  final String? contact_phone_home;
  @override
  final String? contact_phone_fax;
  @override
  final int? contact_subscription_id;
  @override
  final bool? contact_has_profile_photo;
  @override
  final String? contact_brush_colour_argb;
  @override
  final String? contact_photo_uri;
  @override
  final String? contact_photo_thumb_uri;
  @override
  final String? contact_logo_uri;
  @override
  final String? contact_web_site;
  final List<CustomerContactType> _contact_types;
  @override
  @JsonKey()
  List<CustomerContactType> get contact_types {
    if (_contact_types is EqualUnmodifiableListView) return _contact_types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contact_types);
  }

  @override
  final bool? contact_is_integrated_supplier;
  @override
  final bool? contact_is_supplier_for_tagged_products;
  @override
  final String? contact_hardware_provider;
  @override
  final String? integrated_supplier_name;
  @override
  final bool? contact_isdeleted;
  @override
  final bool? contact_is_archived;
  @override
  final int? contact_invoice_due_rule;
  @override
  final dynamic contact_invoice_due_days;
  @override
  final int? contact_quote_expiry_rule;
  @override
  final dynamic contact_quote_expiry_days;
  @override
  final bool? contact_has_saleitems;
  @override
  final dynamic conatct_is_linked_to_related_object;
  @override
  final String? contact_created_by_contact_name_display;
  @override
  final DateTime? contact_created_date;
  @override
  final String? contact_updated_by_contact_name_display;
  @override
  final DateTime? contact_updated_date;

  @override
  String toString() {
    return 'CustomerDatum(contact_is_user: $contact_is_user, contact_is_admin: $contact_is_admin, contact_is_access_disabled: $contact_is_access_disabled, contact_subrole_id: $contact_subrole_id, contact_subrole_name: $contact_subrole_name, contact_invitation_status: $contact_invitation_status, contact_invitation_type: $contact_invitation_type, contact_id: $contact_id, contact_code: $contact_code, contact_initials: $contact_initials, contact_name_display: $contact_name_display, contact_name_first: $contact_name_first, contact_name_last: $contact_name_last, contact_name_business: $contact_name_business, contact_address: $contact_address, contact_address_coords: $contact_address_coords, contact_billing_address: $contact_billing_address, contact_email: $contact_email, contact_email_for_invoices: $contact_email_for_invoices, contact_special_notes: $contact_special_notes, contact_phone_ddi: $contact_phone_ddi, contact_phone_work: $contact_phone_work, contact_phone_mobile: $contact_phone_mobile, contact_phone_home: $contact_phone_home, contact_phone_fax: $contact_phone_fax, contact_subscription_id: $contact_subscription_id, contact_has_profile_photo: $contact_has_profile_photo, contact_brush_colour_argb: $contact_brush_colour_argb, contact_photo_uri: $contact_photo_uri, contact_photo_thumb_uri: $contact_photo_thumb_uri, contact_logo_uri: $contact_logo_uri, contact_web_site: $contact_web_site, contact_types: $contact_types, contact_is_integrated_supplier: $contact_is_integrated_supplier, contact_is_supplier_for_tagged_products: $contact_is_supplier_for_tagged_products, contact_hardware_provider: $contact_hardware_provider, integrated_supplier_name: $integrated_supplier_name, contact_isdeleted: $contact_isdeleted, contact_is_archived: $contact_is_archived, contact_invoice_due_rule: $contact_invoice_due_rule, contact_invoice_due_days: $contact_invoice_due_days, contact_quote_expiry_rule: $contact_quote_expiry_rule, contact_quote_expiry_days: $contact_quote_expiry_days, contact_has_saleitems: $contact_has_saleitems, conatct_is_linked_to_related_object: $conatct_is_linked_to_related_object, contact_created_by_contact_name_display: $contact_created_by_contact_name_display, contact_created_date: $contact_created_date, contact_updated_by_contact_name_display: $contact_updated_by_contact_name_display, contact_updated_date: $contact_updated_date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerDatum &&
            (identical(other.contact_is_user, contact_is_user) ||
                other.contact_is_user == contact_is_user) &&
            (identical(other.contact_is_admin, contact_is_admin) ||
                other.contact_is_admin == contact_is_admin) &&
            (identical(other.contact_is_access_disabled, contact_is_access_disabled) ||
                other.contact_is_access_disabled ==
                    contact_is_access_disabled) &&
            (identical(other.contact_subrole_id, contact_subrole_id) ||
                other.contact_subrole_id == contact_subrole_id) &&
            (identical(other.contact_subrole_name, contact_subrole_name) ||
                other.contact_subrole_name == contact_subrole_name) &&
            (identical(other.contact_invitation_status, contact_invitation_status) ||
                other.contact_invitation_status == contact_invitation_status) &&
            (identical(other.contact_invitation_type, contact_invitation_type) ||
                other.contact_invitation_type == contact_invitation_type) &&
            (identical(other.contact_id, contact_id) ||
                other.contact_id == contact_id) &&
            (identical(other.contact_code, contact_code) ||
                other.contact_code == contact_code) &&
            (identical(other.contact_initials, contact_initials) ||
                other.contact_initials == contact_initials) &&
            (identical(other.contact_name_display, contact_name_display) ||
                other.contact_name_display == contact_name_display) &&
            (identical(other.contact_name_first, contact_name_first) ||
                other.contact_name_first == contact_name_first) &&
            (identical(other.contact_name_last, contact_name_last) ||
                other.contact_name_last == contact_name_last) &&
            (identical(other.contact_name_business, contact_name_business) ||
                other.contact_name_business == contact_name_business) &&
            (identical(other.contact_address, contact_address) ||
                other.contact_address == contact_address) &&
            (identical(other.contact_address_coords, contact_address_coords) ||
                other.contact_address_coords == contact_address_coords) &&
            (identical(other.contact_billing_address, contact_billing_address) ||
                other.contact_billing_address == contact_billing_address) &&
            (identical(other.contact_email, contact_email) ||
                other.contact_email == contact_email) &&
            (identical(other.contact_email_for_invoices, contact_email_for_invoices) ||
                other.contact_email_for_invoices ==
                    contact_email_for_invoices) &&
            (identical(other.contact_special_notes, contact_special_notes) ||
                other.contact_special_notes == contact_special_notes) &&
            (identical(other.contact_phone_ddi, contact_phone_ddi) ||
                other.contact_phone_ddi == contact_phone_ddi) &&
            (identical(other.contact_phone_work, contact_phone_work) ||
                other.contact_phone_work == contact_phone_work) &&
            (identical(other.contact_phone_mobile, contact_phone_mobile) || other.contact_phone_mobile == contact_phone_mobile) &&
            (identical(other.contact_phone_home, contact_phone_home) || other.contact_phone_home == contact_phone_home) &&
            (identical(other.contact_phone_fax, contact_phone_fax) || other.contact_phone_fax == contact_phone_fax) &&
            (identical(other.contact_subscription_id, contact_subscription_id) || other.contact_subscription_id == contact_subscription_id) &&
            (identical(other.contact_has_profile_photo, contact_has_profile_photo) || other.contact_has_profile_photo == contact_has_profile_photo) &&
            (identical(other.contact_brush_colour_argb, contact_brush_colour_argb) || other.contact_brush_colour_argb == contact_brush_colour_argb) &&
            (identical(other.contact_photo_uri, contact_photo_uri) || other.contact_photo_uri == contact_photo_uri) &&
            (identical(other.contact_photo_thumb_uri, contact_photo_thumb_uri) || other.contact_photo_thumb_uri == contact_photo_thumb_uri) &&
            (identical(other.contact_logo_uri, contact_logo_uri) || other.contact_logo_uri == contact_logo_uri) &&
            (identical(other.contact_web_site, contact_web_site) || other.contact_web_site == contact_web_site) &&
            const DeepCollectionEquality().equals(other._contact_types, _contact_types) &&
            (identical(other.contact_is_integrated_supplier, contact_is_integrated_supplier) || other.contact_is_integrated_supplier == contact_is_integrated_supplier) &&
            (identical(other.contact_is_supplier_for_tagged_products, contact_is_supplier_for_tagged_products) || other.contact_is_supplier_for_tagged_products == contact_is_supplier_for_tagged_products) &&
            (identical(other.contact_hardware_provider, contact_hardware_provider) || other.contact_hardware_provider == contact_hardware_provider) &&
            (identical(other.integrated_supplier_name, integrated_supplier_name) || other.integrated_supplier_name == integrated_supplier_name) &&
            (identical(other.contact_isdeleted, contact_isdeleted) || other.contact_isdeleted == contact_isdeleted) &&
            (identical(other.contact_is_archived, contact_is_archived) || other.contact_is_archived == contact_is_archived) &&
            (identical(other.contact_invoice_due_rule, contact_invoice_due_rule) || other.contact_invoice_due_rule == contact_invoice_due_rule) &&
            const DeepCollectionEquality().equals(other.contact_invoice_due_days, contact_invoice_due_days) &&
            (identical(other.contact_quote_expiry_rule, contact_quote_expiry_rule) || other.contact_quote_expiry_rule == contact_quote_expiry_rule) &&
            const DeepCollectionEquality().equals(other.contact_quote_expiry_days, contact_quote_expiry_days) &&
            (identical(other.contact_has_saleitems, contact_has_saleitems) || other.contact_has_saleitems == contact_has_saleitems) &&
            const DeepCollectionEquality().equals(other.conatct_is_linked_to_related_object, conatct_is_linked_to_related_object) &&
            (identical(other.contact_created_by_contact_name_display, contact_created_by_contact_name_display) || other.contact_created_by_contact_name_display == contact_created_by_contact_name_display) &&
            (identical(other.contact_created_date, contact_created_date) || other.contact_created_date == contact_created_date) &&
            (identical(other.contact_updated_by_contact_name_display, contact_updated_by_contact_name_display) || other.contact_updated_by_contact_name_display == contact_updated_by_contact_name_display) &&
            (identical(other.contact_updated_date, contact_updated_date) || other.contact_updated_date == contact_updated_date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        contact_is_user,
        contact_is_admin,
        contact_is_access_disabled,
        contact_subrole_id,
        contact_subrole_name,
        contact_invitation_status,
        contact_invitation_type,
        contact_id,
        contact_code,
        contact_initials,
        contact_name_display,
        contact_name_first,
        contact_name_last,
        contact_name_business,
        contact_address,
        contact_address_coords,
        contact_billing_address,
        contact_email,
        contact_email_for_invoices,
        contact_special_notes,
        contact_phone_ddi,
        contact_phone_work,
        contact_phone_mobile,
        contact_phone_home,
        contact_phone_fax,
        contact_subscription_id,
        contact_has_profile_photo,
        contact_brush_colour_argb,
        contact_photo_uri,
        contact_photo_thumb_uri,
        contact_logo_uri,
        contact_web_site,
        const DeepCollectionEquality().hash(_contact_types),
        contact_is_integrated_supplier,
        contact_is_supplier_for_tagged_products,
        contact_hardware_provider,
        integrated_supplier_name,
        contact_isdeleted,
        contact_is_archived,
        contact_invoice_due_rule,
        const DeepCollectionEquality().hash(contact_invoice_due_days),
        contact_quote_expiry_rule,
        const DeepCollectionEquality().hash(contact_quote_expiry_days),
        contact_has_saleitems,
        const DeepCollectionEquality()
            .hash(conatct_is_linked_to_related_object),
        contact_created_by_contact_name_display,
        contact_created_date,
        contact_updated_by_contact_name_display,
        contact_updated_date
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerDatumCopyWith<_$_CustomerDatum> get copyWith =>
      __$$_CustomerDatumCopyWithImpl<_$_CustomerDatum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerDatumToJson(
      this,
    );
  }
}

abstract class _CustomerDatum implements CustomerDatum {
  const factory _CustomerDatum(
      {final bool? contact_is_user,
      final bool? contact_is_admin,
      final bool? contact_is_access_disabled,
      final int? contact_subrole_id,
      final String? contact_subrole_name,
      final String? contact_invitation_status,
      final String? contact_invitation_type,
      final int? contact_id,
      final String? contact_code,
      final String? contact_initials,
      final String? contact_name_display,
      final String? contact_name_first,
      final String? contact_name_last,
      final String? contact_name_business,
      final String? contact_address,
      final String? contact_address_coords,
      final String? contact_billing_address,
      final String? contact_email,
      final String? contact_email_for_invoices,
      final String? contact_special_notes,
      final String? contact_phone_ddi,
      final String? contact_phone_work,
      final String? contact_phone_mobile,
      final String? contact_phone_home,
      final String? contact_phone_fax,
      final int? contact_subscription_id,
      final bool? contact_has_profile_photo,
      final String? contact_brush_colour_argb,
      final String? contact_photo_uri,
      final String? contact_photo_thumb_uri,
      final String? contact_logo_uri,
      final String? contact_web_site,
      final List<CustomerContactType> contact_types,
      final bool? contact_is_integrated_supplier,
      final bool? contact_is_supplier_for_tagged_products,
      final String? contact_hardware_provider,
      final String? integrated_supplier_name,
      final bool? contact_isdeleted,
      final bool? contact_is_archived,
      final int? contact_invoice_due_rule,
      final dynamic contact_invoice_due_days,
      final int? contact_quote_expiry_rule,
      final dynamic contact_quote_expiry_days,
      final bool? contact_has_saleitems,
      final dynamic conatct_is_linked_to_related_object,
      final String? contact_created_by_contact_name_display,
      final DateTime? contact_created_date,
      final String? contact_updated_by_contact_name_display,
      final DateTime? contact_updated_date}) = _$_CustomerDatum;

  factory _CustomerDatum.fromJson(Map<String, dynamic> json) =
      _$_CustomerDatum.fromJson;

  @override
  bool? get contact_is_user;
  @override
  bool? get contact_is_admin;
  @override
  bool? get contact_is_access_disabled;
  @override
  int? get contact_subrole_id;
  @override
  String? get contact_subrole_name;
  @override
  String? get contact_invitation_status;
  @override
  String? get contact_invitation_type;
  @override
  int? get contact_id;
  @override
  String? get contact_code;
  @override
  String? get contact_initials;
  @override
  String? get contact_name_display;
  @override
  String? get contact_name_first;
  @override
  String? get contact_name_last;
  @override
  String? get contact_name_business;
  @override
  String? get contact_address;
  @override
  String? get contact_address_coords;
  @override
  String? get contact_billing_address;
  @override
  String? get contact_email;
  @override
  String? get contact_email_for_invoices;
  @override
  String? get contact_special_notes;
  @override
  String? get contact_phone_ddi;
  @override
  String? get contact_phone_work;
  @override
  String? get contact_phone_mobile;
  @override
  String? get contact_phone_home;
  @override
  String? get contact_phone_fax;
  @override
  int? get contact_subscription_id;
  @override
  bool? get contact_has_profile_photo;
  @override
  String? get contact_brush_colour_argb;
  @override
  String? get contact_photo_uri;
  @override
  String? get contact_photo_thumb_uri;
  @override
  String? get contact_logo_uri;
  @override
  String? get contact_web_site;
  @override
  List<CustomerContactType> get contact_types;
  @override
  bool? get contact_is_integrated_supplier;
  @override
  bool? get contact_is_supplier_for_tagged_products;
  @override
  String? get contact_hardware_provider;
  @override
  String? get integrated_supplier_name;
  @override
  bool? get contact_isdeleted;
  @override
  bool? get contact_is_archived;
  @override
  int? get contact_invoice_due_rule;
  @override
  dynamic get contact_invoice_due_days;
  @override
  int? get contact_quote_expiry_rule;
  @override
  dynamic get contact_quote_expiry_days;
  @override
  bool? get contact_has_saleitems;
  @override
  dynamic get conatct_is_linked_to_related_object;
  @override
  String? get contact_created_by_contact_name_display;
  @override
  DateTime? get contact_created_date;
  @override
  String? get contact_updated_by_contact_name_display;
  @override
  DateTime? get contact_updated_date;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerDatumCopyWith<_$_CustomerDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerContactType _$CustomerContactTypeFromJson(Map<String, dynamic> json) {
  return _CustomerContactType.fromJson(json);
}

/// @nodoc
mixin _$CustomerContactType {
  int? get contacttype_id => throw _privateConstructorUsedError;
  String? get contacttype_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerContactTypeCopyWith<CustomerContactType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerContactTypeCopyWith<$Res> {
  factory $CustomerContactTypeCopyWith(
          CustomerContactType value, $Res Function(CustomerContactType) then) =
      _$CustomerContactTypeCopyWithImpl<$Res, CustomerContactType>;
  @useResult
  $Res call({int? contacttype_id, String? contacttype_name});
}

/// @nodoc
class _$CustomerContactTypeCopyWithImpl<$Res, $Val extends CustomerContactType>
    implements $CustomerContactTypeCopyWith<$Res> {
  _$CustomerContactTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacttype_id = freezed,
    Object? contacttype_name = freezed,
  }) {
    return _then(_value.copyWith(
      contacttype_id: freezed == contacttype_id
          ? _value.contacttype_id
          : contacttype_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contacttype_name: freezed == contacttype_name
          ? _value.contacttype_name
          : contacttype_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerContactTypeCopyWith<$Res>
    implements $CustomerContactTypeCopyWith<$Res> {
  factory _$$_CustomerContactTypeCopyWith(_$_CustomerContactType value,
          $Res Function(_$_CustomerContactType) then) =
      __$$_CustomerContactTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? contacttype_id, String? contacttype_name});
}

/// @nodoc
class __$$_CustomerContactTypeCopyWithImpl<$Res>
    extends _$CustomerContactTypeCopyWithImpl<$Res, _$_CustomerContactType>
    implements _$$_CustomerContactTypeCopyWith<$Res> {
  __$$_CustomerContactTypeCopyWithImpl(_$_CustomerContactType _value,
      $Res Function(_$_CustomerContactType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contacttype_id = freezed,
    Object? contacttype_name = freezed,
  }) {
    return _then(_$_CustomerContactType(
      contacttype_id: freezed == contacttype_id
          ? _value.contacttype_id
          : contacttype_id // ignore: cast_nullable_to_non_nullable
              as int?,
      contacttype_name: freezed == contacttype_name
          ? _value.contacttype_name
          : contacttype_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerContactType implements _CustomerContactType {
  const _$_CustomerContactType({this.contacttype_id, this.contacttype_name});

  factory _$_CustomerContactType.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerContactTypeFromJson(json);

  @override
  final int? contacttype_id;
  @override
  final String? contacttype_name;

  @override
  String toString() {
    return 'CustomerContactType(contacttype_id: $contacttype_id, contacttype_name: $contacttype_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerContactType &&
            (identical(other.contacttype_id, contacttype_id) ||
                other.contacttype_id == contacttype_id) &&
            (identical(other.contacttype_name, contacttype_name) ||
                other.contacttype_name == contacttype_name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contacttype_id, contacttype_name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerContactTypeCopyWith<_$_CustomerContactType> get copyWith =>
      __$$_CustomerContactTypeCopyWithImpl<_$_CustomerContactType>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerContactTypeToJson(
      this,
    );
  }
}

abstract class _CustomerContactType implements CustomerContactType {
  const factory _CustomerContactType(
      {final int? contacttype_id,
      final String? contacttype_name}) = _$_CustomerContactType;

  factory _CustomerContactType.fromJson(Map<String, dynamic> json) =
      _$_CustomerContactType.fromJson;

  @override
  int? get contacttype_id;
  @override
  String? get contacttype_name;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerContactTypeCopyWith<_$_CustomerContactType> get copyWith =>
      throw _privateConstructorUsedError;
}
