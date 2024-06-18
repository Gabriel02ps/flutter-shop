import 'package:flutter/material.dart';
import 'package:shop/providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.deepPurple,
          title: const Text(
            'Exemplo Contador',
            style: TextStyle(color: Colors.white),
          )),
      body: Column(
        children: [
          Text(provider.state.value.toString()),
          IconButton(
              onPressed: () {
                setState(() {
                  provider.state.inc();
                });
                debugPrint(provider.state.value.toString());
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                setState(() {
                  provider.state.dec();
                });
                debugPrint(provider.state.value.toString());
              },
              icon: const Icon(Icons.remove)),
        ],
      ),
    );
  }
}
