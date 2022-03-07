import 'package:flutter/material.dart';
import 'display.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final WeightController = TextEditingController();
  final HeightController = TextEditingController();

  @override
  void dispose() {
    WeightController.dispose();
    HeightController.dispose();
    super.dispose();
  }

  double? result;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('BMI Calculator'),
            backgroundColor: Colors.blueGrey,
          ),
          body: Container(
            padding: EdgeInsets.all(30.0),
            child: (
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: HeightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Your height in cm',
                          icon: Icon(Icons.line_weight),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: WeightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Your weight in kg',
                          icon: Icon(Icons.line_weight),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Text("Calculate",
                      ),
                      onPressed: calculateBMI,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                      ),
                    ),
                    Expanded(
                        child: Center(
                          child: Text(
                            result == null ? "Your BMI"
                            : '${result!.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 50),
                          ),
                        )
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Suggestion(bmi: result!.toStringAsFixed(2)))
                        );
                        },
                      child: Expanded(
                        child: Container(
                          child: Text(
                            'Suggestion',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.blueGrey,
                          height: 50.0,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(HeightController.text) / 100;
    double weight = double.parse(WeightController.text);

    double heightSquare = height * height;
    result = weight / heightSquare;
    setState(() {});
  }
}
