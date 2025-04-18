import 'package:bloc_study/ui/counter_screen.dart';
import 'package:bloc_study/ui/switch_screen.dart';
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
          ],
        ),
      ),
    );
  }
}
