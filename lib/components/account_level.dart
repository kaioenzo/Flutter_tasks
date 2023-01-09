import 'package:flutter/material.dart';
import 'package:flutter_application_first/data/task_inherited.dart';

class AccountLevel extends StatefulWidget {
  AccountLevel({super.key});

  State<AccountLevel> createState() => _AccountLevelState();
}

class _AccountLevelState extends State<AccountLevel> {
  double accountLevel(BuildContext context) {
    return TaskInherited.of(context).nivel;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Account level: ${accountLevel(context)}",
        ),
        ElevatedButton(
          onPressed: (() => setState(() {})),
          child: const Icon(Icons.refresh),
        )
      ],
    );
  }
}
