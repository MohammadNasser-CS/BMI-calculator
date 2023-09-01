import 'package:flutter/material.dart';

class HeightSlider extends StatefulWidget {
  const HeightSlider({super.key, required this.getHeight});
  final Function(int newHeightValue) getHeight;
  @override
  State<HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  int _heightValue = 120;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xff1A1F38),
      ),
      child: Center(
        child: Column(
          children: [
            const Text(
              'HEIGHT',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 7.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$_heightValue',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 6.0),
                const Text(
                  'CM',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Slider(
              max: 220,
              min: 80,
              value: _heightValue.toDouble(),
              onChanged: (newHeight) {
                setState(() {
                  _heightValue = newHeight.toInt();
                });
                widget.getHeight(_heightValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
/**
 *   

 * 
 * Container(
      padding: const EdgeInsets.all(18.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: const Color(0xff1A1F38),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: [
            const Text(
              'HEIGHT',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$_heightValue',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'CM',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Slider(
              min: 80,
              max: 220,
              value: _heightValue.toDouble(),
              onChanged: (newHeight) {
                setState(() {
                  _heightValue = newHeight.toInt();
                });
                widget.getHeight(_heightValue);
              },
            ),
          ],
        ),
      ),
    )
 */