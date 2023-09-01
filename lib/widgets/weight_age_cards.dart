import 'package:flutter/material.dart';

class WeightAgeCard extends StatefulWidget {
  const WeightAgeCard(
      {super.key,
      required this.title,
      required this.initialValue,
      required this.getValue});
  final String title;
  final int initialValue;
  final Function(int newValue) getValue;
  @override
  State<WeightAgeCard> createState() => _WeightAgeCardState();
}

class _WeightAgeCardState extends State<WeightAgeCard> {
  late int _cardValue;
  @override
  void initState() {
    super.initState();
    _cardValue = widget.initialValue;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xff1A1F38),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(color: Colors.grey, fontSize: 25),
          ),
          const SizedBox(height: 12),
          Text(
            '$_cardValue',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _cardValue++;
                    });
                    widget.getValue(_cardValue);
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 25,
                  ),
                ),
              ),
              const Spacer(),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                child: IconButton(
                  onPressed: () {
                    if (_cardValue > 1) {
                      setState(() {
                        _cardValue--;
                      });
                      widget.getValue(_cardValue);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Not Allowed Nigative Value'),
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
