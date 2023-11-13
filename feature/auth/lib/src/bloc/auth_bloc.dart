import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:navigation/navigation.dart';
import 'package:transactions/src/navigation/transactions_router.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final AppRouter _appRouter;
  // final SignInUseCase _authUseCase;
  AuthBloc({
    required AppRouter appRouter,
    required LoginUseCase loginUseCase,
    // required SignInUseCase authUseCase,
  })  : _appRouter = appRouter,
        _loginUseCase = loginUseCase,
        // _authUseCase = authUseCase,
        super(const AuthState()) {
    on<LoginEvent>(_login);
    on<HideDialog>(_hideDialog);
  }

  Future<void> _login(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    if (!_isFieldsValid(event, emit)) {
      return;
    }
    emit(state.copyWith(isLoading: true));
    try {
      final bool isValid =
          await _loginUseCase.execute((event.login, event.password));
      if (isValid) {
        await _appRouter.replace(const TransactionsRoute());
      } else {
        emit(state.copyWith(
          isLoading: false,
          loginErrorMessage: LocaleKeys.emailIsNotCorrect,
          passwordErrorMessage: LocaleKeys.passwordIsNotCorrect,
        ));
      }
    } on AppException catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorDialogDescription: e.message,
          showErrorDialog: true,
        ),
      );
    }
  }

  void _hideDialog(
    HideDialog event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(showErrorDialog: false));
    _appRouter.pop();
  }

  bool _isFieldsValid(LoginEvent event, Emitter<AuthState> emit) {
    final bool isLoginValid = event.login.isValidEmail();
    emit(const AuthState());
    if (!isLoginValid) {
      emit(state.copyWith(loginErrorMessage: LocaleKeys.emailIsNotCorrect));
    }
    if (event.password.isEmpty) {
      emit(state.copyWith(
        passwordErrorMessage: LocaleKeys.passwordIsNotCorrect,
      ));
    }
    return isLoginValid && event.password.isNotEmpty;
  }
}
