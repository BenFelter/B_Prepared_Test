import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final int pk;
  final String email;
  final String first_name;
  final String last_name;
  final String date_joined;
  final String? last_login;
  final bool is_active;
  final bool is_staff;
  final bool is_superuser;

  UserResponse(
    this.pk,
    this.email,
    this.first_name,
    this.last_name,
    this.date_joined,
    this.last_login,
    this.is_active,
    this.is_staff,
    this.is_superuser,
  );

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
