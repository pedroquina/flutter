import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(
      {super.key,
      required this.label,
      required this.value,
      required this.percentage});

  final String label;
  final double value;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(children: <Widget>[
        Container(
          height: constraints.maxHeight * 0.3,
          child: FittedBox(
            child: Text('${value.toStringAsFixed(2)}'),
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.03),
        Container(
          height: constraints.maxHeight * 0.5,
          width: 10,
          child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5)),
            ),
            FractionallySizedBox(
              heightFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ]),
        ),
        Container(
          height: constraints.maxHeight * 0.10,
          child: FittedBox(child: Text(label)),
        ),
        SizedBox(height: constraints.maxHeight * 0.03),
      ]);
    });
  }
}
