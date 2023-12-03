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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PredmetiSemestar(title: '191049'),
    );
  }
}

class PredmetiSemestar extends StatefulWidget {
  const PredmetiSemestar({super.key, required this.title});



  final String title;

  @override
  State<PredmetiSemestar> createState() => _PredmetiSemestarState();
}

class _PredmetiSemestarState extends State<PredmetiSemestar> {
  List<String> _predmeti = [];

  void addPredmeti() {
    showDialog(context: context, builder: (BuildContext context) {
      String newPredmet = "";
      return AlertDialog(
        title: const Text("Dodaj nov predmet"),
        content: TextField(
          onChanged: (value) {
            newPredmet = value;
          },
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (newPredmet.isNotEmpty) {
                    _predmeti.add(newPredmet);
                  }
                  Navigator.pop(context);
                });
              },
              child: Text("Dodaj"))
        ],
      );
    });
  }



  void _incrementCounter() {
    setState(() {


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("191049"),
      ),
      body: ListView.builder(
        itemCount: _predmeti.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text(_predmeti[index], style: TextStyle(fontSize: 18),),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_rounded),
                  onPressed: () {
                    setState(() {
                      _predmeti.removeAt(index);
                    });
                },
                ),
              ),
    );
    }),
     floatingActionButton: FloatingActionButton(onPressed: addPredmeti,
       backgroundColor: Colors.deepPurpleAccent,
         child: Icon(Icons.add),



     ),
    );
  }
}

