import 'package:flutter/material.dart';
import 'package:flutter_application_first/data/task_inherited.dart';
import 'package:flutter_application_first/screens/form_screen.dart';
import 'package:flutter_application_first/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

// final _router = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => TaskInherited(
//         child: const InitialScreen(),
//       ),
//       routes: [
//         GoRoute(
//           path: 'addTask',
//           builder: (context, state) => FormScreen(taskContext: context),
//         )
//       ],
//     ),
//   ],
// );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskInherited(child: InitialScreen()),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
