import 'package:flutter/material.dart';

import '../widgets/transactionItem.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  Function removeAlertHandler;
  TransactionList(this.transactionList, this.removeAlertHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactionList.isEmpty
          ? Column(children: <Widget>[
              Text(
                "No transaction added yet!",
                style: Theme.of(context).textTheme.title,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(transactionList[index],removeAlertHandler);
              },
              itemCount: transactionList.length,
            ),
    );
  }
}
