import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double? result;
  String condition = "Condition";

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double? calculateBMI(double weight, double height) {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  void showBMIResult() {
    setState(() {
      double? height = double.tryParse(heightController.text);
      double? weight = double.tryParse(weightController.text);

      if (height != null && weight != null && height > 0 && weight > 0) {
        result = calculateBMI(weight, height);
        if (result! < 18.5) {
          condition = "You are Underweight";
        } else if (result! < 24.9) {
          condition = "You are Fit";
        } else if (result! < 29.9) {
          condition = "You are Overweight";
        } else {
          condition = "You are Obese";
        }
      } else {
        result = null;
        condition = "Invalid Input";
      }
    });
  }

  void clearInputs() {
    setState(() {
      heightController.clear();
      weightController.clear();
      result = null;
      condition = "Condition";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                height: 380,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.pink[400],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                      width: 250,
                      child: TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 140, 179, 211)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          prefixIcon: Icon(
                            Icons.balance,
                            color: Colors.white,
                          ),
                          hintText: 'Enter Your Weight (kg)',
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 70,
                      width: 250,
                      child: TextField(
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 140, 179, 211)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          prefixIcon: Icon(
                            Icons.vertical_align_bottom_outlined,
                            color: Colors.white,
                          ),
                          hintText: 'Enter Your Height (cm)',
                          hintStyle: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: showBMIResult,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "Show Result",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 7),
                    ElevatedButton(
                      onPressed: clearInputs,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "Clear",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 17),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.pink[400],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 330,
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'BMI:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              result?.toStringAsFixed(2) ?? "0.00",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 7),
                      Container(
                        alignment: Alignment.center,
                        height: 80,
                        width: 330,
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          condition,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
