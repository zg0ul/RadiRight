import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/errors/app_error.dart';
import '../../../../core/errors/repository_error_mapper.dart';
import '../../domain/models/decision_node.dart';
import '../../domain/models/panel.dart';
import '../../domain/models/topic.dart';
import '../datasources/local_decision_tree_datasource.dart';

part 'assessment_repository.g.dart';

@riverpod
AssessmentRepository assessmentRepository(Ref ref) {
  final datasource = ref.watch(localDecisionTreeDatasourceProvider);
  return AssessmentRepositoryImpl(datasource);
}

abstract class AssessmentRepository {
  Future<Either<AppError, List<Panel>>> getPanels();
  Future<Either<AppError, Panel?>> getPanel(String panelId);
  Future<Either<AppError, List<Topic>>> getTopics(String panelId);
  Future<Either<AppError, Topic?>> getTopic(String topicId);
  Future<Either<AppError, DecisionNode?>> getNode(String nodeId);
  Future<Either<AppError, Map<String, DecisionNode>>> getAllNodesForTopic(
      String topicId);
}

class AssessmentRepositoryImpl implements AssessmentRepository {
  final LocalDecisionTreeDatasource _datasource;

  AssessmentRepositoryImpl(this._datasource);

  @override
  Future<Either<AppError, List<Panel>>> getPanels() async {
    try {
      final panels = await _datasource.getPanels();
      return Right(panels);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }

  @override
  Future<Either<AppError, Panel?>> getPanel(String panelId) async {
    try {
      final panel = await _datasource.getPanel(panelId);
      return Right(panel);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }

  @override
  Future<Either<AppError, List<Topic>>> getTopics(String panelId) async {
    try {
      final topics = await _datasource.getTopics(panelId);
      return Right(topics);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }

  @override
  Future<Either<AppError, Topic?>> getTopic(String topicId) async {
    try {
      final topic = await _datasource.getTopic(topicId);
      return Right(topic);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }

  @override
  Future<Either<AppError, DecisionNode?>> getNode(String nodeId) async {
    try {
      final node = await _datasource.getNode(nodeId);
      return Right(node);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }

  @override
  Future<Either<AppError, Map<String, DecisionNode>>> getAllNodesForTopic(
      String topicId) async {
    try {
      final nodes = await _datasource.getAllNodesForTopic(topicId);
      return Right(nodes);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }
}
