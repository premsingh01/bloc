import 'package:bloc_study/bloc/counter/counter_bloc.dart';
import 'package:bloc_study/ui/counter_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const CounterScreen(),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () {
          //Equitable example Start--------------------
          // Person person1 = Person(name: "Testt", age: "25");
          // Person person11 = Person(name: "Test", age: "25");
          // PersonTwo person2 = PersonTwo(name: "Test", age: "25");
          // // Person person3 = Person(name: "Testt", age: "25");
          // print("${person1.hashCode}");
          // print("${person11.hashCode}");
          // print(person1 == person11);
          // // print(person1 == person2);
          // // print("${person1 == person2} & ${person2 == person3}");
          //Equitable example End--------------------
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
//+++++++++++++++++++++CODE EXAMPLE(Without EQUITABLE)+++++++++++++++++++++
// class Person {
//   const Person({required this.name, required this.age});
//   final String name;
//   final String age;

//   @override
//   bool operator ==(Object other) {
//     return other is Person && name == other.name && age == other.age;
//   }

//   @override
//   int get hashCode => name.hashCode ^ age.hashCode;
// }

//+++++++++++++++++++++EQUITABLE CODE EXAMPLE+++++++++++++++++++++
class Person extends Equatable {
  const Person({required this.name, required this.age});
  final String name;
  final String age;

  @override
  List<Object?> get props => [name, age];
}

class PersonTwo extends Equatable {
  const PersonTwo({required this.name, required this.age});
  final String name;
  final String age;

  @override
  List<Object?> get props => [name, age];
}
