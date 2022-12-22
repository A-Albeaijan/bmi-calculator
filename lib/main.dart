import 'package:bmi/resultpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BMI',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: homepage(),
        routes: {
          'homepage': (context) => homepage(),
        });
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextStyle font = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
  bool ismale = false;
  bool isfamle = false;
  double tall = 150;
  int age = 25;
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = (MediaQuery.of(context).size.width);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI'),
        backgroundColor: Color.fromRGBO(10, 15, 30, 1.0),
      ),
      backgroundColor: Color.fromRGBO(10, 15, 30, 1.0),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                gender('Male', height, width),
                gender('Female', height, width),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 28, 42, 82),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  'Height',
                  style: font,
                ),
                Text(
                  '${tall.toString()} CM',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white54,
                  ),
                ),
                Slider(
                  divisions: 100,
                  label: tall.round().toString(),
                  activeColor: Colors.white,
                  min: 120,
                  max: 220,
                  value: tall,
                  onChanged: (double value) {
                    setState(() {
                      tall = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              cal('Weight', height, width, weight),
              cal('Age', height, width, age),
            ],
          ),
          Container(
            width: double.infinity,
            height: height * 0.12,
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Result(age: age, hight: tall, weight: weight),
                  ),
                );
              },
              child: const Text('Calculat BMI'),
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

  Widget gender(String text, double height, double width) {
    Color temp = Color.fromARGB(255, 28, 42, 82);
    if (isfamle == true && text == 'Female') {
      temp = Colors.pink;
    } else if (ismale == true && text == 'Male') {
      temp = temp = Colors.blueAccent;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: temp,
      ),
      width: width * 0.4,
      height: height * 0.2,
      child: GestureDetector(
        onTap: () {
          print(text);
          setState(() {
            if (text == 'Male') {
              ismale = true;
              isfamle = false;
            } else {
              isfamle = true;
              ismale = false;
            }
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              text == 'Male' ? Icons.male : Icons.female,
              color: Colors.white,
              size: 70,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 20, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget cal(String text, double height, double width, int number) {
    Color temp = Color.fromARGB(255, 28, 42, 82);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: temp,
      ),
      width: width * 0.4,
      height: height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: font,
          ),
          Text(
            text == 'Weight' ? '${weight.toString()} Kg' : age.toString(),
            style: TextStyle(fontSize: 20, color: Colors.white70),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //remove
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      if (text == 'Weight') {
                        weight = weight - 1;
                      } else {
                        age = age - 1;
                      }
                    },
                  );
                },
                child: Icon(Icons.remove),
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: Color.fromARGB(255, 127, 144, 192),
                    fixedSize: const Size(40, 40)),
              ),

              //add
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (text == 'Weight') {
                      weight = weight + 1;
                    } else {
                      age = age + 1;
                    }
                  });
                },
                child: Icon(Icons.add),
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    primary: Color.fromARGB(255, 127, 144, 192),
                    fixedSize: const Size(40, 40)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
