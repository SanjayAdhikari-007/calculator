import 'package:flutter/material.dart';

class OperationCard extends StatelessWidget {
  final Color color;
  final String arthOperator;
  const OperationCard({
    Key? key,
    required this.color,
    required this.arthOperator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.66),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        arthOperator,
        style: const TextStyle(
          fontSize: 60,
          color: Colors.white,
        ),
      )),
      // height: ,
    );
  }
}
