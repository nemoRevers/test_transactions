part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final String? loginErrorMessage;
  final String? passwordErrorMessage;
  final String? errorDialogDescription;
  final bool showErrorDialog;

  const AuthState({
    this.isLoading = false,
    this.loginErrorMessage,
    this.passwordErrorMessage,
    this.errorDialogDescription,
    this.showErrorDialog = false,
  });

  AuthState copyWith({
    bool? isLoading,
    String? loginErrorMessage,
    String? passwordErrorMessage,
    String? errorDialogDescription,
    bool? showErrorDialog,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
      passwordErrorMessage: passwordErrorMessage ?? this.passwordErrorMessage,
      errorDialogDescription:
          errorDialogDescription ?? this.errorDialogDescription,
      showErrorDialog: showErrorDialog ?? this.showErrorDialog,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        isLoading,
        loginErrorMessage,
        passwordErrorMessage,
        errorDialogDescription,
        showErrorDialog,
      ];
}
