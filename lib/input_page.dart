import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print("counter is $_counter");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      //body: Container(
      body: Column(
        children: [
          const Expanded(
            child: Row(
            children: [
               Expanded(
                child: ReusableCard(),
              ),
              Expanded(
                child: ReusableCard(),
              ),
            ],
          ),
          ),
          Expanded(
            child: Container(
              height: 200,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(),
                ),
                Expanded(
                  child: ReusableCard(),
                ),
              ],
            ),
          ),
        ],
      ),
      //),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 200,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
