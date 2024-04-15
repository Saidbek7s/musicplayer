import 'package:flutter/material.dart';

class NewmenuPage extends StatefulWidget {
  const NewmenuPage({super.key});

  @override
  State<NewmenuPage> createState() => _NewmenuPageState();
}

class _NewmenuPageState extends State<NewmenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Menu Page"),
      ),
    );
  }
}
