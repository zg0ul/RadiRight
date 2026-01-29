import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/subscription.dart';
import '../../domain/enums/subscription_tier.dart';

part 'firebase_subscription_datasource.g.dart';

@riverpod
FirebaseSubscriptionDatasource firebaseSubscriptionDatasource(Ref ref) {
  return FirebaseSubscriptionDatasource(FirebaseFirestore.instance);
}

class FirebaseSubscriptionDatasource {
  final FirebaseFirestore _firestore;

  FirebaseSubscriptionDatasource(this._firestore);

  CollectionReference<Map<String, dynamic>> get _subscriptionsCollection => _firestore.collection('subscriptions');

  Future<Subscription?> getSubscription(String userId) async {
    final doc = await _subscriptionsCollection.doc(userId).get();
    if (!doc.exists || doc.data() == null) return null;
    return _parseSubscription(doc.id, doc.data()!);
  }

  Stream<Subscription?> subscriptionStream(String userId) {
    return _subscriptionsCollection.doc(userId).snapshots().map((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return _parseSubscription(doc.id, doc.data()!);
    });
  }

  Future<Subscription> createTrialSubscription(String userId) async {
    final now = DateTime.now();
    final trialEnd = now.add(const Duration(days: 7));

    final data = {
      'userId': userId,
      'tier': SubscriptionTier.trial.name,
      'startDate': Timestamp.fromDate(now),
      'endDate': Timestamp.fromDate(trialEnd),
      'isTrialUsed': true,
      'trialEndDate': Timestamp.fromDate(trialEnd),
      'createdAt': FieldValue.serverTimestamp(),
    };

    try {
      await _subscriptionsCollection.doc(userId).set(data);

      // Verify the document was created by reading it back
      final doc = await _subscriptionsCollection.doc(userId).get();
      if (!doc.exists) {
        throw Exception('Failed to create subscription document in Firestore. Please check security rules.');
      }
    } catch (e) {
      if (e is FirebaseException) {
        if (e.code == 'permission-denied') {
          throw Exception(
            'Permission denied: Firestore security rules are blocking subscription creation. Please check your Firestore rules allow users to create their own trial subscription.',
          );
        }
        throw Exception('Firestore error: ${e.message} (code: ${e.code})');
      }
      rethrow;
    }

    return Subscription(
      id: userId,
      userId: userId,
      tier: SubscriptionTier.trial,
      startDate: now,
      endDate: trialEnd,
      isTrialUsed: true,
      trialEndDate: trialEnd,
    );
  }

  Future<void> updateSubscription(Subscription subscription) async {
    final data = {
      'userId': subscription.userId,
      'tier': subscription.tier.name,
      'startDate': Timestamp.fromDate(subscription.startDate),
      'endDate': Timestamp.fromDate(subscription.endDate),
      'isTrialUsed': subscription.isTrialUsed,
      'trialEndDate': subscription.trialEndDate != null ? Timestamp.fromDate(subscription.trialEndDate!) : null,
      'updatedAt': FieldValue.serverTimestamp(),
    };

    await _subscriptionsCollection.doc(subscription.userId).update(data);
  }

  Subscription _parseSubscription(String id, Map<String, dynamic> data) {
    return Subscription(
      id: id,
      userId: data['userId'] as String,
      tier: SubscriptionTier.values.firstWhere((t) => t.name == data['tier'], orElse: () => SubscriptionTier.none),
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
      isTrialUsed: data['isTrialUsed'] as bool? ?? false,
      trialEndDate: data['trialEndDate'] != null ? (data['trialEndDate'] as Timestamp).toDate() : null,
    );
  }
}
