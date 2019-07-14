import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FittedBox(
          child: Text('\$${spendingAmount.toStringAsFixed(2)}'),
        ),
        Container(
          height: 50,
          width: 10,
          margin: EdgeInsets.only(top: 4, bottom: 4),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        Text(label),
      ],
    );
  }
}
