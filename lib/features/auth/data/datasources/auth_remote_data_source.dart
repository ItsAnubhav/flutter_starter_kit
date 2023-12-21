import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSourceImpl({required this.dio});
}
