import 'package:bloc_study/ui/counter/counter_screen.dart';
import 'package:bloc_study/ui/favourite_app/favourite_app_screen.dart';
import 'package:bloc_study/ui/image_picker/image_picker_screen.dart';
import 'package:bloc_study/ui/switch/switch_screen.dart';
import 'package:bloc_study/ui/to_do/to_do_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: SafeArea(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => CounterScreen()));
              },
              child: const Text("Counter Example"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => SwitchScreen()));
              },
              child: const Text("Switch Example"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => ImagePickerScreen()));
              },
              child: const Text("Image Picker"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => ToDoScreen()));
              },
              child: const Text("Todo App"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => FavouriteAppScreen()));
              },
              child: const Text("Favourite App"),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
