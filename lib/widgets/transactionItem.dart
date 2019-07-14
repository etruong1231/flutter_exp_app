import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transactionItem;
  Function removeAlertHandler;
  TransactionItem(this.transactionItem, this.removeAlertHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
              child: Text(
                '\$${transactionItem.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text('${transactionItem.title}',
            style: Theme.of(context).textTheme.title),
        subtitle: Text('${DateFormat.yMMMd().format(transactionItem.date)}'),
        trailing: FlatButton(
          child: Icon(
            Icons.remove_circle,
            color: Colors.red,
          ),
          onPressed: () {
            removeAlertHandler(context, transactionItem.id);
          },
        ),
      ),
    );
  }
}
