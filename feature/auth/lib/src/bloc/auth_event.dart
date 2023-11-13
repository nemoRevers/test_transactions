part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final String login;
  final String password;

  const LoginEvent(
    this.login,
    this.password,
  );

  @override
  List<Object?> get props => <Object?>[
        login,
        password,
      ];
}

class HideDialog extends AuthEvent {
  const HideDialog();

  @override
  List<Object?> get props => <Object?>[];
}
