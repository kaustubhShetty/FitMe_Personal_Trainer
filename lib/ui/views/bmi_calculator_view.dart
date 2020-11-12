import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:provider_architecture/ui/views/register_screen.dart';
import 'package:provider_architecture/ui/views/databaseWork.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'dart:math';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}


class _BmiCalculatorState extends State<BmiCalculator> {
  bool isLoading = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  String userid = "";
  double bmi = 0;
  String result = "";
  //String interpretation = "";

  final _formKey = GlobalKey<FormState>();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  @override
  void initState() {
    //INIT STATE METHOD
    // TODO: implement initState
    super.initState();
    userid = auth.currentUser.uid;
    CollectData();
  }

  Future<void> CollectData() async {
    Map<String, dynamic> userData = await DB().getData(userid);

    _ageController.text = userData['Age'].toString();
    _weightController.text = userData['Weight'].toString(); //'55';
    _heightController.text = userData['Height'].toString(); //'1.6';
    this.setState(() {
      this.isLoading = false;
    });
  }

String getResult() {
    setState(() {
      if (bmi >= 25) {
        result = 'Overweight';
      } else if (bmi > 18.5) {
        result =  'Normal';
      } else {
        result = 'Underweight';
      }
    });

  }

  double calculating() {
    double temp = double.parse(_weightController.text) /
        pow(double.parse(_heightController.text), 2);
    setState(() {
      bmi = double.parse(temp.toStringAsFixed(1));
    });
    getResult();
  }

  @override
  Widget build(BuildContext context) {
    //BUILD

    final mq = MediaQuery.of(context);

    final ageField = Container(
      height: 50,
      width: 100,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _ageController,
        style: TextStyle(
          color: Colors.black87,
        ),
        cursorColor: Colors.black87,
        //cursorColor: Colors.white,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            //New////////
            borderSide: BorderSide(
              color: Colors.black87,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black87),
          ),
          hintText: "(in years)",
          //labelText: "Age",
          labelStyle: TextStyle(
            color: Colors.black87,
          ),
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );

    final weightField = Container(
      height: 50,
      width: 100,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _weightController,
        style: TextStyle(
          color: Colors.black87,
        ),
        cursorColor: Colors.black87,
        //cursorColor: Colors.white,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            //New////////
            borderSide: BorderSide(
              color: Colors.black87,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black87),
          ),
          hintText: "(in kg)",
          //labelText: "Weight",
          labelStyle: TextStyle(
            color: Colors.black87,
          ),
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );

    final heightField = Container(
      height: 50,
      width: 100,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: _heightController,
        style: TextStyle(
          color: Colors.black87,
        ),
        cursorColor: Colors.black87,
        //cursorColor: Colors.white,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            //New////////
            borderSide: BorderSide(
              color: Colors.black87,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black87),
          ),
          hintText: "(in meters)",
          //labelText: "Height",
          labelStyle: TextStyle(
            color: Colors.black87,
          ),
          hintStyle: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );

    final calculateBmiButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Color(0xffF39A6E),
      child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Calculate BMI",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            setState(() {
              calculating();
            });
          }),
    );

    final fields = Padding(
      //padding: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
      //padding: EdgeInsets.only(bottom: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 22),
          Row(
            children: [
              Text(
                "Age:         ",
                style: TextStyle(fontSize: 20),
              ), //7 spaces
              ageField,
            ],
          ),
          SizedBox(height: 22),
          // weightField,
          Row(
            children: [
              Text(
                "Weight:    ",
                style: TextStyle(fontSize: 20),
              ),
              weightField,
            ],
          ),
          SizedBox(height: 22),
          //heightField,
          Row(
            children: [
              Text(
                "Height:     ",
                style: TextStyle(fontSize: 20),
              ),
              heightField,
            ],
          ),
          //SizedBox(height: 8),
          //heightField,
          //SizedBox(height: 15),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bmi Calculator",
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: this.isLoading
          ? Container()
          : SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20), //36
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      fields,
                      calculateBmiButton,
                      SizedBox(
                        height: 22,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.orange[200],
                        ),
                        //color: Colors.orange,
                        width: 310,
                        height: 140,
                        child: Column(
                          children: [
                            Center(
                              child: Text("${result}",style: TextStyle(fontSize: 30),),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Text(
                                "Your BMI is: ${bmi}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
