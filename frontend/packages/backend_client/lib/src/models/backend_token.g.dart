// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backend_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackendToken _$BackendTokenFromJson(Map<String, dynamic> json) => BackendToken(
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String? ?? 'bearer',
      expiresIn: json['expiresIn'] as int?,
      refreshToken: json['refreshToken'] as String?,
      scope: json['scope'] as String?,
    );

Map<String, dynamic> _$BackendTokenToJson(BackendToken instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
      'scope': instance.scope,
    };
