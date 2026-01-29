import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/decision_node.dart';
import '../../domain/models/panel.dart';
import '../../domain/models/topic.dart';
import 'decision_tree_datasource.dart';

part 'firebase_decision_tree_datasource.g.dart';

@riverpod
FirebaseDecisionTreeDatasource firebaseDecisionTreeDatasource(Ref ref) {
  return FirebaseDecisionTreeDatasource(FirebaseFirestore.instance);
}

class FirebaseDecisionTreeDatasource implements DecisionTreeDatasource {
  final FirebaseFirestore _firestore;

  FirebaseDecisionTreeDatasource(this._firestore);

  CollectionReference<Map<String, dynamic>> get _panelsCollection => _firestore.collection('panels');

  CollectionReference<Map<String, dynamic>> get _topicsCollection => _firestore.collection('topics');

  CollectionReference<Map<String, dynamic>> get _nodesCollection => _firestore.collection('decisionNodes');

  @override
  Future<List<Panel>> getPanels() async {
    final snapshot = await _panelsCollection.where('isEnabled', isEqualTo: true).get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return Panel.fromJson(data);
    }).toList();
  }

  @override
  Future<Panel?> getPanel(String panelId) async {
    final doc = await _panelsCollection.doc(panelId).get();
    if (!doc.exists) return null;
    final data = doc.data()!;
    data['id'] = doc.id;
    return Panel.fromJson(data);
  }

  @override
  Future<List<Topic>> getTopics(String panelId) async {
    final snapshot = await _topicsCollection
        .where('panelId', isEqualTo: panelId)
        .where('isEnabled', isEqualTo: true)
        .get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return Topic.fromJson(data);
    }).toList();
  }

  @override
  Future<Topic?> getTopic(String topicId) async {
    final doc = await _topicsCollection.doc(topicId).get();
    if (!doc.exists) return null;
    final data = doc.data()!;
    data['id'] = doc.id;
    return Topic.fromJson(data);
  }

  @override
  Future<DecisionNode?> getNode(String nodeId) async {
    final doc = await _nodesCollection.doc(nodeId).get();
    if (!doc.exists) return null;
    final data = doc.data()!;
    data['id'] = doc.id;
    return DecisionNode.fromJson(data);
  }

  @override
  Future<Map<String, DecisionNode>> getAllNodesForTopic(String topicId) async {
    final snapshot = await _nodesCollection.where('topicId', isEqualTo: topicId).get();
    final nodes = <String, DecisionNode>{};

    for (final doc in snapshot.docs) {
      final data = doc.data();
      data['id'] = doc.id;
      nodes[doc.id] = DecisionNode.fromJson(data);
    }

    return nodes;
  }
}
