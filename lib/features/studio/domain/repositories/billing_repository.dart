import 'package:grap/features/studio/domain/entities/credit_balance.dart';

abstract class BillingRepository {
  Future<CreditBalance> getCreditBalance();

  Stream<CreditBalance> watchCreditBalance();
}
