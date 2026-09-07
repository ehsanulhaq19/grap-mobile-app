import 'package:grap/features/studio/domain/entities/credit_balance.dart';
import 'package:grap/features/studio/domain/repositories/billing_repository.dart';

class WatchCreditBalanceUseCase {
  const WatchCreditBalanceUseCase(this._repository);

  final BillingRepository _repository;

  Stream<CreditBalance> call() => _repository.watchCreditBalance();
}
