import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/decision_node.dart';
import '../../domain/models/panel.dart';
import '../../domain/models/topic.dart';
import 'decision_tree_datasource.dart';

part 'local_decision_tree_datasource.g.dart';

/// Panel ids that have (or will have) a decision tree file.
/// File name convention: `${panelId}_decision_trees.json`
const List<String> _panelIds = ['msk', 'chest', 'neuro', 'abdominal', 'cardiac', 'pediatric'];

@riverpod
LocalDecisionTreeDatasource localDecisionTreeDatasource(Ref ref) {
  return LocalDecisionTreeDatasource();
}

class LocalDecisionTreeDatasource implements DecisionTreeDatasource {
  final Map<String, Map<String, dynamic>> _cacheByPanelId = {};
  bool _panelsLoaded = false;

  static String _pathForPanel(String panelId) => 'assets/data/decision_trees/${panelId}_decision_trees.json';

  Future<void> _ensurePanelsLoaded() async {
    if (_panelsLoaded) return;
    for (final panelId in _panelIds) {
      try {
        final jsonString = await rootBundle.loadString(_pathForPanel(panelId));
        final data = json.decode(jsonString) as Map<String, dynamic>;
        _cacheByPanelId[panelId] = data;
      } catch (_) {
        // Skip missing or invalid files
      }
    }
    _panelsLoaded = true;
  }

  @override
  Future<List<Panel>> getPanels() async {
    await _ensurePanelsLoaded();
    final panels = <Panel>[];
    for (final entry in _cacheByPanelId.entries) {
      final data = entry.value;
      final panelInfo = data['panel_info'] as Map<String, dynamic>?;
      if (panelInfo == null) continue;
      final topics = data['topics'] as List<dynamic>? ?? [];
      final panelJson = <String, dynamic>{...panelInfo, 'topicCount': topics.length};
      panels.add(Panel.fromJson(panelJson));
    }
    // Sort panels: enabled panels first, then by name (case-insensitive)
    panels.sort((a, b) {
      // Place enabled panels before disabled ones
      if (a.isEnabled != b.isEnabled) {
        return a.isEnabled ? -1 : 1; // negative means a is the winner, positive means b is the winner of the sort
      }
      // If same enabled status, sort by name (case-insensitive)
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return panels;
  }

  @override
  Future<Panel?> getPanel(String panelId) async {
    final panels = await getPanels();
    return panels.where((p) => p.id == panelId).firstOrNull;
  }

  @override
  Future<List<Topic>> getTopics(String panelId) async {
    await _ensurePanelsLoaded();
    final data = _cacheByPanelId[panelId];
    if (data == null) return [];
    final topics = data['topics'] as List<dynamic>? ?? [];
    return topics.map((t) => Topic.fromJson(t as Map<String, dynamic>)).where((t) => t.panelId == panelId).toList();
  }

  @override
  Future<Topic?> getTopic(String topicId) async {
    await _ensurePanelsLoaded();
    for (final data in _cacheByPanelId.values) {
      final topics = data['topics'] as List<dynamic>? ?? [];
      final match = topics.where((t) => (t as Map)['id'] == topicId).firstOrNull;
      if (match != null) {
        return Topic.fromJson(match as Map<String, dynamic>);
      }
    }
    return null;
  }

  /// Find the raw topic JSON object by topic ID.
  Map<String, dynamic>? _findTopicJson(String topicId) {
    for (final data in _cacheByPanelId.values) {
      final topics = data['topics'] as List<dynamic>? ?? [];
      for (final t in topics) {
        final topicMap = t as Map<String, dynamic>;
        if (topicMap['id'] == topicId) {
          return topicMap;
        }
      }
    }
    return null;
  }

  @override
  Future<DecisionNode?> getNode(String nodeId) async {
    // NOTE: With nested nodes, nodeId is only unique within a topic.
    // This method searches all topics. Prefer getAllNodesForTopic when possible.
    await _ensurePanelsLoaded();
    for (final data in _cacheByPanelId.values) {
      final topics = data['topics'] as List<dynamic>? ?? [];
      for (final t in topics) {
        final topicMap = t as Map<String, dynamic>;
        final nodes = topicMap['nodes'] as Map<String, dynamic>? ?? {};
        final nodeData = nodes[nodeId];
        if (nodeData != null) {
          return DecisionNode.fromJson(nodeData as Map<String, dynamic>);
        }
      }
    }
    return null;
  }

  @override
  Future<Map<String, DecisionNode>> getAllNodesForTopic(String topicId) async {
    await _ensurePanelsLoaded();
    final topicJson = _findTopicJson(topicId);
    if (topicJson == null) return {};

    final nodes = topicJson['nodes'] as Map<String, dynamic>? ?? {};
    final topicNodes = <String, DecisionNode>{};
    for (final entry in nodes.entries) {
      final nodeData = entry.value as Map<String, dynamic>;
      topicNodes[entry.key] = DecisionNode.fromJson(nodeData);
    }
    return topicNodes;
  }
}
