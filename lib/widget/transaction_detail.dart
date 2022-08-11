import 'package:flutter/material.dart';
import 'package:flutter_ewallet/models/transaction.dart';
import 'package:flutter_ewallet/widget/transaction_item.dart';

class TransactionDetail extends StatelessWidget {
  const TransactionDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 50, bottom: 10),
          child: Row(
            children: [
              IconButton(onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_back_rounded)
              ),
              Text(
                'History Transaksi',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              )

            ],
          ),
        ),
        Expanded(
            child: ListView.builder(itemBuilder: (context,index){
              return TransactionItem(transaction: transactions[index]);
            }, itemCount: transactions.length),
        )
      ],
    );
  }
}
