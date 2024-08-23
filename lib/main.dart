import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _cont = 0;
  final TextEditingController _edt1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HotDogger App",
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.food_bank_rounded, color: Colors.amber),
          title: Text(
            "HotDogger™",
            style: TextStyle(color: Colors.amber),
          ),
          backgroundColor: Colors.redAccent[400],
        ),
        body: Column(
          children: [
            TextField(
              controller: _edt1Controller,
              decoration: InputDecoration(labelText: "Nome"),
            ),
            ElevatedButton(
              onPressed: () {
                String nome = _edt1Controller.text;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$nome"),
                  action: SnackBarAction(
                    label: 'Ok',
                    onPressed: () {},
                  ),
                ));
              },
              child: Text('Enviar'),
            ),
            Center(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 10)),
                    child: Text('$_cont',
                        style: TextStyle(
                            fontSize: 150, color: Colors.redAccent[400])))),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.shopping_cart,
            color: Colors.redAccent[400],
          ),
          backgroundColor: Colors.amber,
          shape: CircleBorder(),
          onPressed: () {
            setState(() {
              _cont = _cont + 1;
            });
            print(_cont);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
