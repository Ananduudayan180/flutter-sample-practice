part of 'auth_cubit.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {}

class AuthError extends AuthState {
  final String errorMsg;
  AuthError({required this.errorMsg});
}
