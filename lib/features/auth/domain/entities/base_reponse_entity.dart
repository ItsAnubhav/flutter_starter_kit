// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BaseResponseEntity extends Equatable {
  int? status;
  String? errorMessage;

  BaseResponseEntity({this.status, this.errorMessage});

  @override
  List<Object?> get props => [status, errorMessage];
}
