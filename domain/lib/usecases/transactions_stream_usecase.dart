import '../domain.dart';
import 'usecase.dart';

class TransactionsStreamUseCase
    implements UseCase<NoParams, Stream<List<TransactionModel>>> {
  final TransactionsRepository _transactionsRepository;

  const TransactionsStreamUseCase(TransactionsRepository transactionsRepository)
      : _transactionsRepository = transactionsRepository;

  @override
  Stream<List<TransactionModel>> execute(NoParams input) {
    return _transactionsRepository.broadcastTransactions;
  }
}
