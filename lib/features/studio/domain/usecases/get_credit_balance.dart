import 'package:grap/features/studio/domain/entities/credit_balance.dart';
import 'package:grap/features/studio/domain/repositories/billing_repository.dart';

class GetCreditBalanceUseCase {
  const GetCreditBalanceUseCase(this._repository);

  final BillingRepository _repository;

  Future<CreditBalance> call() => _repository.getCreditBalance();
}
