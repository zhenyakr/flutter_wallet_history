import 'package:flutter/material.dart';
import 'package:flutter_wallet_history/widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constrains) {
              return Column(
                children: [
                  Container(
                    height: constrains.maxHeight * 0.6,
                    child: Image.asset(
                      'images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              );
            },
          )
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ))
                .toList(),
          );
  }
}
