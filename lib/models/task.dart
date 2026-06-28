import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Task {


  final String id;
  String category;
  String title;
  String priority;
  Color dotColor;
  bool isDone;

  Task({
      required this.id,
      required this.category,
      required this.title,
      required this.priority,
      required this.dotColor,
      this.isDone = false
  });


  static final List<Task> _allTasks = [];
  static const _uuid = Uuid();
  static Task create({
    required String category,
    required String title,
    required String priority,
    required Color dotColor,
  }) {
    final task = Task(
      id: _uuid.v4(),
      category: category,
      title: title,
      priority: priority,
      dotColor: dotColor,
    );
    _allTasks.add(task);
    return task;
  }
  
  static List<Task> getAll() {
      return List.from(_allTasks);
  }

  static Task? findTaskById(String id) {
      try {
          return _allTasks.firstWhere((t) => t.id == id);
      } catch(e) {
        return null;
      }
  }
  static void deleteTaskById(String id) {
      _allTasks.removeWhere((t) => t.id == id);
  }

  static void clearAll() {
    _allTasks.clear();
  }

  void markAsDone() {
    isDone = true;
  }

  void toggleDone() {
    isDone = !isDone;
  }
  
  void delete() {
    _allTasks.remove(this);
  }

  void updateTitle(String title) {
    this.title = title;
  }


  Color get priorityColor {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }


}