import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.bmi});
  final double bmi;
  String _getBmiStatus() {
    if (bmi > 0 && bmi <= 16) {
      return "Severe thinness";
    } else if (bmi > 16 && bmi <= 17) {
      return "Moderate thinness";
    } else if (bmi > 17 && bmi <= 18.5) {
      return "Mild thinness";
    } else if (bmi > 18.5 && bmi <= 25) {
      return "Normal";
    } else if (bmi > 25 && bmi <= 30) {
      return "Overweight";
    } else if (bmi > 30 && bmi <= 35) {
      return "Obese Class I";
    } else {
      return "Obese Class II";
    }
  }

  Color _getBmiStatusColor() {
    if (bmi > 0 && bmi <= 16) {
      return Colors.red;
    } else if (bmi > 16 && bmi <= 17) {
      return Colors.red.shade200;
    } else if (bmi > 17 && bmi <= 18.5) {
      return Colors.yellowAccent;
    } else if (bmi > 18.5 && bmi <= 25) {
      return Colors.green;
    } else if (bmi > 25 && bmi <= 30) {
      return Colors.yellowAccent;
    } else if (bmi > 30 && bmi <= 35) {
      return Colors.red.shade200;
    } else if (bmi > 35 && bmi <= 40) {
      return Colors.red;
    } else {
      return Colors.red.shade900;
    }
  }

  String _getBmiRange() {
    if (bmi > 0 && bmi <= 16) {
      return "1 - 16 kg/m2";
    } else if (bmi > 16 && bmi <= 17) {
      return "16,1 - 17 kg/m2";
    } else if (bmi > 17 && bmi <= 18.5) {
      return "17.1 - 18,5 kg/m2";
    } else if (bmi > 18.5 && bmi <= 25) {
      return "18,6 - 25 kg/m2";
    } else if (bmi > 25 && bmi <= 30) {
      return "25,1 - 30 kg/m2";
    } else if (bmi > 30 && bmi <= 35) {
      return "30,1 - 35 kg/m2";
    } else {
      return "more than 35 kg/m2";
    }
  }

  String _getBmiMessage() {
    if (bmi > 0 && bmi <= 18.5) {
      return "You Should Take More Care Of Your Health, And Eat More Food.";
    } else if (bmi > 18.5 && bmi <= 25) {
      return "You Have Normal Body, Good Job!";
    } else {
      return "You Should Take More Care Of Your Health, And Eat Less Food.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your BMI',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xff1A1F38),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              Text(
                _getBmiStatus(),
                style: TextStyle(color: _getBmiStatusColor(), fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                bmi.toStringAsFixed(1),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 75,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                '${_getBmiStatus()} BMI Range:',
                style: const TextStyle(color: Colors.grey, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                _getBmiRange(),
                style: const TextStyle(color: Colors.white, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                _getBmiMessage(),
                style: const TextStyle(color: Colors.white, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
