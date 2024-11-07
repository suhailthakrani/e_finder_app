import 'dart:convert';

class UserModel {
  final String id;
  final String uuid;
  final String name;
  final String email;
  final int status;
  final bool isAdmin;
  final String token;
  final Role role;
  final List<String> permissions;

  UserModel({
    required this.id,
    required this.uuid,
    required this.name,
    required this.email,
    required this.status,
    required this.isAdmin,
    required this.token,
    required this.role,
    required this.permissions,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: '${json['id']??""}',
      uuid: json['uuid']??"",
      name: json['name']??"",
      email: json['email']??"",
      status: json['status']??"",
      isAdmin: json['is_admin'] == 1,
      token: json['token']??"",
      role: Role.fromJson(json['roles']),
      permissions: List<String>.from(json['permissions']??[]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'name': name,
      'email': email,
      'status': status,
      'is_admin': isAdmin ? 1 : 0,
      'token': token,
      'roles': role.toJson(),
      'permissions': permissions,
    };
  }
}

class Role {
  final String id;
  final String roleName;

  Role({
    required this.id,
    required this.roleName,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: "${json['id']??""}",
      roleName: json['role_name']??"",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role_name': roleName,
    };
  }
}
