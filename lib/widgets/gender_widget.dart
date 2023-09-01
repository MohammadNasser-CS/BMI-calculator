import 'package:flutter/material.dart';

enum Gender { male, female }

class GenderCard extends StatelessWidget {
  const GenderCard(
      {super.key,
      required this.gender,
      required this.isActive,
      required this.onClick});
  final Gender gender;
  final bool isActive;
  final Function() onClick;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xff1A1F38),
          border: Border.all(
              color: isActive ? Colors.pinkAccent : Colors.transparent),
        ),
        child: InkWell(
          onTap: onClick,
          child: Column(
            children: [
              Icon(
                gender == Gender.male ? Icons.male : Icons.female,
                color: isActive ? Colors.white : Colors.grey,
                size: 52,
              ),
              Text(
                gender == Gender.male ? 'Male' : 'Female',
                style: TextStyle(
                    color: isActive ? Colors.white : Colors.grey, fontSize: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/**
 * 
 *
  final bool isActive;
  final VoidCallback onClick;
 */
/**
 * Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xff1A1F38),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: isActive ? Colors.pinkAccent : Colors.transparent,
              width: 2)),
      child: InkWell(
        onTap: onClick,
        child: Column(
          children: [
            Icon(
              gender == Gender.male ? Icons.male : Icons.female,
              color: isActive ? Colors.white : Colors.grey,
              size: 60,
            ),
            const SizedBox(height: 12),
            Text(
              gender == Gender.male ? "Male" : "Female",
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
 */