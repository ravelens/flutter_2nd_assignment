import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transactions,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('\$${transactions.amount}'),
            ),
          ),
        ),
        title: Text(
          transactions.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transactions.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transactions.id),
                icon: const Icon(Icons.delete),
                label: const Text('Delete'))
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transactions.id),
              ),
      ),
    );
  }
}
