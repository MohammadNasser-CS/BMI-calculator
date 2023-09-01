import 'package:course_bmi/pages/result_page.dart';
import 'package:course_bmi/widgets/gender_widget.dart';
import 'package:course_bmi/widgets/height_slided_widget.dart';
import 'package:course_bmi/widgets/weight_age_cards.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender _selectedGender = Gender.male;
  int _height = 120;
  int _weight = 50;
  int _age = 12;
  double _calculateBMI() {
    final heightPerMeter = _height / 100;
    final bmi = _weight / (heightPerMeter * heightPerMeter);
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          size: 32,
        ),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GenderCard(
                      gender: Gender.male,
                      isActive: _selectedGender == Gender.male,
                      onClick: () {
                        setState(() {
                          _selectedGender = Gender.male;
                        });
                      },
                    ),
                    const SizedBox(width: 10.0),
                    GenderCard(
                      gender: Gender.female,
                      isActive: _selectedGender == Gender.female,
                      onClick: () {
                        setState(() {
                          _selectedGender = Gender.female;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                HeightSlider(
                  getHeight: ((newHeightValue) {
                    _height = newHeightValue;
                  }),
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                        child: WeightAgeCard(
                      title: 'WRIGHT',
                      initialValue: 50,
                      getValue: (newWeight) {
                        _weight = newWeight;
                      },
                    )),
                    const SizedBox(width: 6),
                    Expanded(
                      child: WeightAgeCard(
                        title: 'AGE',
                        initialValue: 12,
                        getValue: (newAge) {
                          _age = newAge;
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                double result = _calculateBMI();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResultPage(bmi: result),
                  ),
                );
              },
              color: Colors.redAccent,
              height: 53,
              child: const SafeArea(
                  top: false,
                  child: Text(
                    'Calculate Your Bmi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
