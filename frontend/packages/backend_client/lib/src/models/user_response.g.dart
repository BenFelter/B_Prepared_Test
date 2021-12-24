// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['pk'] as int,
      json['email'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['date_joined'] as String,
      json['last_login'] as String?,
      json['is_active'] as bool,
      json['is_staff'] as bool,
      json['is_superuser'] as bool,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'pk': instance.pk,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'date_joined': instance.date_joined,
      'last_login': instance.last_login,
      'is_active': instance.is_active,
      'is_staff': instance.is_staff,
      'is_superuser': instance.is_superuser,
    };
