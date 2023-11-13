import '../domain.dart';
import 'usecase.dart';

class CancelTransactionUseCase implements FutureUseCase<int, void> {
  final TransactionsRepository _transactionsRepository;

  const CancelTransactionUseCase(TransactionsRepository transactionsRepository)
      : _transactionsRepository = transactionsRepository;

  @override
  Future<void> execute(int input) {
    return _transactionsRepository.cancelTransaction(input);
  }
}
