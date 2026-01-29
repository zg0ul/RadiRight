import '../../domain/models/decision_node.dart';
import '../../domain/models/panel.dart';
import '../../domain/models/topic.dart';

abstract class DecisionTreeDatasource {
  Future<List<Panel>> getPanels();
  Future<Panel?> getPanel(String panelId);
  Future<List<Topic>> getTopics(String panelId);
  Future<Topic?> getTopic(String topicId);
  Future<DecisionNode?> getNode(String nodeId);
  Future<Map<String, DecisionNode>> getAllNodesForTopic(String topicId);
}
