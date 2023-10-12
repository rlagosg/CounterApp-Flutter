import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;
  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 2.5,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hola mundo',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$counter',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
          increaseFn: increase, decreaseFn: decrease, resetFn: reset),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActions({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            onPressed: () => increaseFn(),
            child: const Icon(Icons.exposure_plus_1_outlined)),
        const SizedBox(
          width: 20,
        ),
        FloatingActionButton(
            onPressed: () => resetFn(),
            child: const Icon(Icons.exposure_outlined)),
        const SizedBox(
          width: 20,
        ),
        FloatingActionButton(
            onPressed: () => decreaseFn(),
            child: const Icon(Icons.exposure_neg_1_outlined)),
      ],
    );
  }
}
