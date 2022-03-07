import 'package:flutter/material.dart';
import 'main.dart';

class Suggestion extends StatelessWidget {

  Suggestion({required this.bmi});
  final String bmi;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Suggestion'),
            backgroundColor: Colors.blueGrey,
          ),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 50),
                            Center( child:
                              Text( 'Your BMI is $bmi\n${obesity()}',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            SizedBox(height: 50),
                            Image.asset('images/bmisug.png'),
                          ],
                        )
                      ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => App()));
                    },
                    child: Expanded(
                      child: Container(
                        child: Text(
                          'Back',
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
                ]
          ),
        ),
      )
    );
  }

  String? obesity(){
    double obese = double.parse(bmi);
    if (obese >= 30){
      return 'คุณอ้วนมาก';
    } else if (obese >= 25){
      return 'คุณอ้วน';
    } else if (obese >= 18.6){
      return 'คุณน้ำหนักปกติ';
    } else {
      return 'คุณผอมเกินไป';
    }
  }
}

