import '../core.dart';

enum TransactionType {
  replenishment(LocaleKeys.replenishment),
  transfer(LocaleKeys.transfer),
  withdrawal(LocaleKeys.withdrawal);

  final String title;

  const TransactionType(this.title);
}
