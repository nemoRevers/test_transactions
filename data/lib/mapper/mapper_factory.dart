import 'transaction_mapper.dart';
import 'user_mapper.dart';

class MapperFactory {
  TransactionMapper get transactionMapper => const TransactionMapper();
  UserMapper get userMapper => const UserMapper();
}
