import 'package:equatable/equatable.dart';

class LocalException extends Equatable implements Exception{
  final String? message;

  const LocalException({this.message}) : super();

  @override
  List<Object?> get props => [if(message!=null )message!];
}