// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      token: json['token'] as String,
      user_data: UserData.fromJson(json['user_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user_data': instance.user_data,
    };

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      username: json['username'] as String,
      subscriber_email: json['subscriber_email'] as String,
      subscriber_name_display: json['subscriber_name_display'] as String,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'username': instance.username,
      'subscriber_email': instance.subscriber_email,
      'subscriber_name_display': instance.subscriber_name_display,
    };
