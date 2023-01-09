import 'package:flutter/material.dart';
import 'package:flutter_application_first/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required Widget child}) : super(child: child);

  final List<Task> taskList = [
    const Task(
      tarefa: 'Aprender Flutter',
      dificuldade: 3,
      imgUrl: 'assets/images/flutter.png',
    ),
    const Task(
      tarefa: 'Aprender Dart',
      dificuldade: 2,
      imgUrl: "assets/images/Dart_logo.png",
    ),
    const Task(tarefa: 'Aprender TypeScript', dificuldade: 3, imgUrl: "assets/images/Typescript_logo_2020.svg.png"),
    const Task(
      tarefa: 'Aprender Java',
      dificuldade: 4.5,
      imgUrl: "assets/images/java-logo-1.png",
    ),
    const Task(tarefa: 'Aprender React', dificuldade: 3.5, imgUrl: "assets/images/React-icon.svg.png"),
    const Task(
      tarefa: 'Aprender Angular',
      dificuldade: 4,
      imgUrl: "assets/images/angular.png",
    ),
  ];

  void addTask({required String name, required String photo, required double difficulty}) {
    taskList.add(
      Task(tarefa: name, dificuldade: difficulty, imgUrl: photo),
    );
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
