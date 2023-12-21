import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/base_reponse_entity.dart';
import '../repositories/auth_repository.dart';

class AuthUsecase extends UseCase<BaseResponseEntity, RegisterParams> {
  final AuthRepository repository;

  AuthUsecase({required this.repository});

  @override
  Future<Either<Failure, BaseResponseEntity>> call(
      RegisterParams params) async {
    throw UnimplementedError();
  }
}

class RegisterParams extends Equatable {
  final String name;
  final String email;
  final String password;

  const RegisterParams(
      {required this.name, required this.email, required this.password});

  @override
  List<Object?> get props => [name, email, password];
}
