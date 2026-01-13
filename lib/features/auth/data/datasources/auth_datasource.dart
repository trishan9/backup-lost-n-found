import 'package:lost_n_found/features/auth/data/models/auth_api_model.dart';
import 'package:lost_n_found/features/auth/data/models/auth_hive_model.dart';

abstract interface class IAuthLocalDataSource {
  Future<bool> register(AuthHiveModel user);
  Future<AuthHiveModel?> login(String email, String password);
  Future<AuthHiveModel?> getCurrentUser();
  Future<bool> logout();

  Future<AuthHiveModel?> getUserById(String authId);
  Future<AuthHiveModel?> getUserByEmail(String email);
  Future<bool> updateUser(AuthHiveModel user);
  Future<bool> deleteUser(String authId);
}

abstract interface class IAuthRemoteDataSource {
  Future<bool> register(AuthApiModel user);
  Future<AuthApiModel?> login(String email, String password);
  Future<AuthApiModel?> getCurrentUser();
  Future<bool> logout();

  Future<AuthApiModel?> getUserById(String authId);
  Future<AuthApiModel?> getUserByEmail(String email);
  Future<bool> updateUser(AuthApiModel user);
  Future<bool> deleteUser(String authId);
}
