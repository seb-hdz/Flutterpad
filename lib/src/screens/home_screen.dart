import 'package:flutter/material.dart';
import 'package:flutterpad/src/widgets/home.dart';
import 'package:flutterpad/src/widgets/ui/bottom_modal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const SafeArea(child: Home()),
      floatingActionButton: ElevatedButton(
        child: const Text("Go"),
        onPressed: () {
          BottomModal.open(
            BottomModal(
              context: context,
              title: "Hello",
              withHandler: false,
              children: const [
                Text("Hello, World!"),
              ],
            ),
          );
        },
      ),
    );
  }
}
