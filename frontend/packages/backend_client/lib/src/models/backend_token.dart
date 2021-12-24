import 'package:fresh_dio/fresh_dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'backend_token.g.dart';

@JsonSerializable()
class BackendToken extends OAuth2Token {
  const BackendToken(
      {required String accessToken,
      String? tokenType = 'bearer',
      int? expiresIn,
      String? refreshToken,
      String? scope})
      : super(
            accessToken: accessToken,
            tokenType: tokenType,
            expiresIn: expiresIn,
            refreshToken: refreshToken,
            scope: scope);
  factory BackendToken.fromJson(Map<String, dynamic> json) =>
      _$BackendTokenFromJson(json);
  Map<String, dynamic> toJson() => _$BackendTokenToJson(this);
}
