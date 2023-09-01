import 'package:course_bmi/widgets/gender_widget.dart';
import 'package:course_bmi/widgets/height_slided_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender _selectedGender = Gender.male;
  int _height = 120;
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
          const SizedBox(height: 15.0),
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
                HeightSlider(getHeight: ((newHeightValue) {
                  _height=newHeightValue;
                }),),
              ],
            ),
          )
        ],
      ),
    );
  }
}


/**
 * Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 12.0),
                  HeightSlider(
                    getHeight: (newHeightValue) {
                      _height = newHeightValue;
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
 */
