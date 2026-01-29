import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/decision_node.dart';
import '../../domain/models/panel.dart';
import '../../domain/models/topic.dart';
import 'decision_tree_datasource.dart';

part 'local_decision_tree_datasource.g.dart';

@riverpod
LocalDecisionTreeDatasource localDecisionTreeDatasource(
    Ref ref) {
  return LocalDecisionTreeDatasource();
}

class LocalDecisionTreeDatasource implements DecisionTreeDatasource {
  Map<String, dynamic>? _cachedData;
  bool _isLoaded = false;

  Future<void> _ensureLoaded() async {
    if (_isLoaded && _cachedData != null) return;

    try {
      final jsonString = await rootBundle.loadString(
        'assets/data/decision_trees/msk_decision_trees.json',
      );
      _cachedData = json.decode(jsonString) as Map<String, dynamic>;
      _isLoaded = true;
    } catch (e) {
      // Return empty data structure if file not found
      _cachedData = {
        'panels': [],
        'topics': [],
        'nodes': {},
      };
      _isLoaded = true;
    }
  }

  @override
  Future<List<Panel>> getPanels() async {
    await _ensureLoaded();
    final panels = _cachedData!['panels'] as List<dynamic>? ?? [];
    return panels
        .map((p) => Panel.fromJson(p as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<Panel?> getPanel(String panelId) async {
    final panels = await getPanels();
    return panels.where((p) => p.id == panelId).firstOrNull;
  }

  @override
  Future<List<Topic>> getTopics(String panelId) async {
    await _ensureLoaded();
    final topics = _cachedData!['topics'] as List<dynamic>? ?? [];
    return topics
        .map((t) => Topic.fromJson(t as Map<String, dynamic>))
        .where((t) => t.panelId == panelId)
        .toList();
  }

  @override
  Future<Topic?> getTopic(String topicId) async {
    await _ensureLoaded();
    final topics = _cachedData!['topics'] as List<dynamic>? ?? [];
    final topicData = topics.where((t) => t['id'] == topicId).firstOrNull;
    if (topicData == null) return null;
    return Topic.fromJson(topicData as Map<String, dynamic>);
  }

  @override
  Future<DecisionNode?> getNode(String nodeId) async {
    await _ensureLoaded();
    final nodes = _cachedData!['nodes'] as Map<String, dynamic>? ?? {};
    final nodeData = nodes[nodeId];
    if (nodeData == null) return null;
    return DecisionNode.fromJson(nodeData as Map<String, dynamic>);
  }

  @override
  Future<Map<String, DecisionNode>> getAllNodesForTopic(String topicId) async {
    await _ensureLoaded();
    final nodes = _cachedData!['nodes'] as Map<String, dynamic>? ?? {};
    final topicNodes = <String, DecisionNode>{};

    for (final entry in nodes.entries) {
      final nodeData = entry.value as Map<String, dynamic>;
      if (nodeData['topicId'] == topicId) {
        topicNodes[entry.key] = DecisionNode.fromJson(nodeData);
      }
    }

    return topicNodes;
  }
}
