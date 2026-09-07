import 'dart:async';

import 'package:grap/features/studio/domain/entities/credit_balance.dart';

class BillingLocalDataSource {
  BillingLocalDataSource() {
    _balance = const CreditBalance(
      available: 250,
      used: 75,
      total: 325,
    );
    _controller = StreamController<CreditBalance>.broadcast(
      onListen: () => _controller.add(_balance),
    );
  }

  late final CreditBalance _balance;
  late final StreamController<CreditBalance> _controller;

  Future<CreditBalance> getCreditBalance() async => _balance;

  Stream<CreditBalance> watchCreditBalance() => _controller.stream;

  void dispose() {
    _controller.close();
  }
}
