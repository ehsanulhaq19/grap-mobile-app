import 'package:grap/features/studio/data/datasources/billing_local_datasource.dart';
import 'package:grap/features/studio/domain/entities/credit_balance.dart';
import 'package:grap/features/studio/domain/repositories/billing_repository.dart';

class BillingRepositoryImpl implements BillingRepository {
  BillingRepositoryImpl(this._localDataSource);

  final BillingLocalDataSource _localDataSource;

  @override
  Future<CreditBalance> getCreditBalance() {
    return _localDataSource.getCreditBalance();
  }

  @override
  Stream<CreditBalance> watchCreditBalance() {
    return _localDataSource.watchCreditBalance();
  }
}
