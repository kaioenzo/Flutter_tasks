import 'package:flutter/material.dart';
import 'package:flutter_application_first/components/task.dart';
import 'package:flutter_application_first/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          Task(
            tarefa: 'Aprender Flutter',
            dificuldade: 3,
            imgUrl: 'assets/images/flutter.png',
          ),
          Task(
            tarefa: 'Aprender Dart',
            dificuldade: 2,
            imgUrl: "assets/images/Dart_logo.png",
          ),
          Task(tarefa: 'Aprender TypeScript', dificuldade: 3, imgUrl: "assets/images/Typescript_logo_2020.svg.png"),
          Task(
            tarefa: 'Aprender Java',
            dificuldade: 4.5,
            imgUrl: "assets/images/java-logo-1.png",
          ),
          Task(tarefa: 'Aprender React', dificuldade: 3.5, imgUrl: "assets/images/React-icon.svg.png"),
          Task(
            tarefa: 'Aprender Angular',
            dificuldade: 4,
            imgUrl: "assets/images/angular.png",
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed("/addTask");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
