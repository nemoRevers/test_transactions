import '../repositories/auth_repository.dart';
import 'usecase.dart';

typedef LoginPayload = (String email, String password);

class LoginUseCase implements FutureUseCase<LoginPayload, bool> {
  final AuthRepository _authRepository;

  const LoginUseCase(AuthRepository authRepository)
      : _authRepository = authRepository;

  @override
  Future<bool> execute(LoginPayload input) {
    return _authRepository.auth(input.$1, input.$2);
  }
}
