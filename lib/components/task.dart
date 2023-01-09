import 'package:flutter/material.dart';
import 'package:flutter_application_first/components/difficulty.dart';
import 'package:flutter_application_first/data/task_inherited.dart';

class Task extends StatefulWidget {
  final String tarefa;
  final String imgUrl;
  final double dificuldade;

  const Task({super.key, required this.tarefa, required this.dificuldade, required this.imgUrl});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  bool assetOrNetwork() {
    if (widget.imgUrl.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(66, 207, 207, 207),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    width: 72,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: assetOrNetwork()
                          ? Image.asset(
                              widget.imgUrl,
                              fit: BoxFit.contain,
                            )
                          : Image.network(
                              widget.imgUrl,
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          widget.tarefa,
                          style: const TextStyle(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Difficulty(difficultyLevel: widget.dificuldade)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 64,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            TaskInherited.of(context).nivel += 1;
                            print(TaskInherited.of(context).nivel);
                            nivel++;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.arrow_drop_up),
                            Text(
                              "UP",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: widget.dificuldade > 0 ? (nivel / widget.dificuldade) / 10 : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nivel $nivel",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
