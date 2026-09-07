import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:grap/features/studio/data/datasources/billing_local_datasource.dart';
import 'package:grap/features/studio/data/datasources/user_local_datasource.dart';
import 'package:grap/features/studio/data/repositories/billing_repository_impl.dart';
import 'package:grap/features/studio/data/repositories/user_repository_impl.dart';
import 'package:grap/features/studio/domain/entities/credit_balance.dart';
import 'package:grap/features/studio/domain/entities/user_profile.dart';
import 'package:grap/features/studio/domain/repositories/billing_repository.dart';
import 'package:grap/features/studio/domain/repositories/user_repository.dart';
import 'package:grap/features/studio/domain/usecases/get_credit_balance.dart';
import 'package:grap/features/studio/domain/usecases/get_user_profile.dart';
import 'package:grap/features/studio/domain/usecases/watch_credit_balance.dart';
import 'package:grap/features/studio/domain/usecases/watch_user_profile.dart';

final userLocalDataSourceProvider = Provider<UserLocalDataSource>((ref) {
  final dataSource = UserLocalDataSource();
  ref.onDispose(dataSource.dispose);
  return dataSource;
});

final billingLocalDataSourceProvider = Provider<BillingLocalDataSource>((ref) {
  final dataSource = BillingLocalDataSource();
  ref.onDispose(dataSource.dispose);
  return dataSource;
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.watch(userLocalDataSourceProvider));
});

final billingRepositoryProvider = Provider<BillingRepository>((ref) {
  return BillingRepositoryImpl(ref.watch(billingLocalDataSourceProvider));
});

final getUserProfileUseCaseProvider = Provider<GetUserProfileUseCase>((ref) {
  return GetUserProfileUseCase(ref.watch(userRepositoryProvider));
});

final watchUserProfileUseCaseProvider = Provider<WatchUserProfileUseCase>((ref) {
  return WatchUserProfileUseCase(ref.watch(userRepositoryProvider));
});

final getCreditBalanceUseCaseProvider = Provider<GetCreditBalanceUseCase>((ref) {
  return GetCreditBalanceUseCase(ref.watch(billingRepositoryProvider));
});

final watchCreditBalanceUseCaseProvider = Provider<WatchCreditBalanceUseCase>((ref) {
  return WatchCreditBalanceUseCase(ref.watch(billingRepositoryProvider));
});

final userProfileProvider = StreamProvider<UserProfile>((ref) {
  return ref.watch(watchUserProfileUseCaseProvider)();
});

final creditBalanceProvider = StreamProvider<CreditBalance>((ref) {
  return ref.watch(watchCreditBalanceUseCaseProvider)();
});
