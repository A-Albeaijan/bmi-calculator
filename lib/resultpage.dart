import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.hight,
      required this.age,
      required this.weight});

  final double hight;
  final int age;
  final int weight;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = (MediaQuery.of(context).size.width);
    double temp = hight / 100;
    double output = weight / (temp * temp);
    String state = '';
    String message = '';
    Color background;
    if (output <= 18.4 && output > 0) {
      state = 'Underweight';
      background = Colors.yellow;
      message = 'You need to eat more and workout !';
    } else if (output >= 18.5 && output <= 24.9) {
      state = 'Normal';
      background = Colors.green;
      message = 'You are good, keep it up !';
    } else if (output >= 25 && output <= 39.9) {
      state = 'Overweight';
      background = Colors.orange;
      message = 'You need lose weight, eat healthy and keep working !';
    } else {
      state = 'Obese';
      background = Colors.red;
      message =
          'You need lose weight and work harder, eat healthy and keep working !';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(10, 15, 30, 1.0),
      ),
      backgroundColor: Color.fromRGBO(10, 15, 30, 1.0),
      body: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 28, 42, 82),
            width: double.infinity,
            height: 0.68 * height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state,
                  style: TextStyle(color: background, fontSize: 22),
                ),
                Text(
                  'BMI: ${output.toInt().toString()}',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  textAlign: TextAlign.center,
                  message,
                  style: TextStyle(color: Colors.white70, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: height * 0.12,
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'homepage');
              },
              child: const Text('Back to calculator'),
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
