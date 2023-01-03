import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameInputController = TextEditingController();
  TextEditingController difficultyInputController = TextEditingController();
  TextEditingController imageInputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var snackBar = const SnackBar(
    content: Text('Successfully added!'),
    backgroundColor: Colors.green,
    margin: EdgeInsets.all(20),
    behavior: SnackBarBehavior.floating,
    elevation: 140.0,
    dismissDirection: DismissDirection.horizontal,
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("New Task"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(31, 173, 173, 173), borderRadius: BorderRadius.circular(10)),
              height: 650,
              width: 375,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: nameInputController,
                      textAlign: TextAlign.left,
                      validator: (value) => value == null || value.isEmpty ? 'Não pode ser vazio!' : null,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Your name',
                          fillColor: Colors.white70,
                          filled: true)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: difficultyInputController,
                      validator: (value) {
                        if (value!.isEmpty || int.parse(value) > 5 || int.parse(value) < 1) {
                          return 'Insira uma dificuldade entre 1 e 5';
                        }
                        return null;
                      },
                      textAlign: TextAlign.left,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Choose a difficulty',
                          fillColor: Colors.white70,
                          filled: true)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: imageInputController,
                      keyboardType: TextInputType.datetime,
                      validator: (value) => value == null || value.isEmpty ? 'Não pode ser vazio!' : null,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: const InputDecoration(
                          labelText: 'Url of image',
                          border: UnderlineInputBorder(),
                          fillColor: Colors.white70,
                          filled: true)),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageInputController.text,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/nophoto.png');
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context).pushReplacementNamed("/home");
                      }
                    },
                    child: const Text('Add task'))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
