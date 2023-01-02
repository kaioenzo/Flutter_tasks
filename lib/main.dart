import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
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
                imgUrl: 'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
              ),
              Task(
                tarefa: 'Aprender Dart',
                dificuldade: 2,
                imgUrl: "https://upload.wikimedia.org/wikipedia/commons/c/c6/Dart_logo.png",
              ),
              Task(
                  tarefa: 'Aprender TypeScript',
                  dificuldade: 3,
                  imgUrl:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Typescript_logo_2020.svg/2048px-Typescript_logo_2020.svg.png"),
              Task(
                tarefa: 'Aprender Java',
                dificuldade: 4.5,
                imgUrl: "https://brandslogos.com/wp-content/uploads/images/large/java-logo-1.png",
              ),
              Task(
                tarefa: 'Aprender React',
                dificuldade: 3.5,
                imgUrl:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/2300px-React-icon.svg.png",
              ),
              Task(
                tarefa: 'Aprender Angular',
                dificuldade: 4,
                imgUrl: "https://angular.io/assets/images/logos/angular/angular.png",
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () => print('buttão!')),
        ));
  }
}

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

  List<double> getFills() {
    List<double> estrelas = [0, 0, 0, 0, 0, 0];
    final int parteInteira = widget.dificuldade.floor();
    for (var i = 0; i < parteInteira; i++) {
      estrelas[i] = 1;
    }
    final double diff = (widget.dificuldade - parteInteira);
    if (diff > 0) {
      estrelas[parteInteira] = 0.5;
    }
    return estrelas;
  }

  IconData star(double fill) {
    if (fill == 0) {
      return Icons.star_border;
    } else if (fill == 1) {
      return Icons.star;
    } else {
      return Icons.star_half;
    }
  }

  @override
  Widget build(BuildContext context) {
    final estrelas = getFills();

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
                          color: const Color.fromARGB(66, 207, 207, 207), borderRadius: BorderRadius.circular(4)),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.imgUrl,
                          fit: BoxFit.contain,
                        ),
                      )),
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
                      Row(
                        children: [
                          Icon(
                            star(estrelas[0]),
                            size: 15,
                            color: widget.dificuldade >= 1 ? Colors.blue : Colors.blue[100],
                          ),
                          Icon(
                            star(estrelas[1]),
                            size: 15,
                            color: widget.dificuldade >= 2 ? Colors.blue : Colors.blue[100],
                          ),
                          Icon(
                            star(estrelas[2]),
                            size: 15,
                            color: widget.dificuldade >= 3 ? Colors.blue : Colors.blue[100],
                          ),
                          Icon(
                            star(estrelas[3]),
                            size: 15,
                            color: widget.dificuldade >= 4 ? Colors.blue : Colors.blue[100],
                          ),
                          Icon(
                            star(estrelas[4]),
                            size: 15,
                            color: widget.dificuldade > 4 ? Colors.blue : Colors.blue[100],
                          ),
                        ],
                      )
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
                            nivel++;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.arrow_drop_up),
                            Text(
                              "Up",
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
                        )),
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
