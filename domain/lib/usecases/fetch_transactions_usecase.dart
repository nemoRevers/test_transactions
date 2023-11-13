import '../domain.dart';
import 'usecase.dart';

class FetchTransactionsUseCase
    implements FutureUseCase<NoParams, List<TransactionModel>> {
  final TransactionsRepository _transactionsRepository;

  const FetchTransactionsUseCase(TransactionsRepository transactionsRepository)
      : _transactionsRepository = transactionsRepository;

  @override
  Future<List<TransactionModel>> execute(NoParams input) {
    return _transactionsRepository.getTransactions();
  }
}
