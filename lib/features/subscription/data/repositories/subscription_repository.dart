import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/errors/app_error.dart';
import '../../../../core/errors/repository_error_mapper.dart';
import '../../domain/models/subscription.dart';
import '../datasources/firebase_subscription_datasource.dart';

part 'subscription_repository.g.dart';

@riverpod
SubscriptionRepository subscriptionRepository(Ref ref) {
  final datasource = ref.watch(firebaseSubscriptionDatasourceProvider);
  return SubscriptionRepositoryImpl(datasource);
}

abstract class SubscriptionRepository {
  Future<Either<AppError, Subscription?>> getSubscription(String userId);
  Stream<Subscription?> subscriptionStream(String userId);
  Future<Either<AppError, Subscription>> createTrialSubscription(String userId);
  Future<Either<AppError, void>> updateSubscription(Subscription subscription);
}

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final FirebaseSubscriptionDatasource _datasource;

  SubscriptionRepositoryImpl(this._datasource);

  @override
  Future<Either<AppError, Subscription?>> getSubscription(String userId) async {
    try {
      final subscription = await _datasource.getSubscription(userId);
      return Right(subscription);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }

  @override
  Stream<Subscription?> subscriptionStream(String userId) {
    return _datasource.subscriptionStream(userId);
  }

  @override
  Future<Either<AppError, Subscription>> createTrialSubscription(String userId) async {
    try {
      final subscription = await _datasource.createTrialSubscription(userId);
      return Right(subscription);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }

  @override
  Future<Either<AppError, void>> updateSubscription(Subscription subscription) async {
    try {
      await _datasource.updateSubscription(subscription);
      return const Right(null);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }
}
