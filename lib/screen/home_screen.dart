import 'package:flutter/material.dart';
import 'package:flutter_ewallet/models/transaction.dart';
import 'package:flutter_ewallet/widget/menu_box.dart';
import 'package:flutter_ewallet/widget/transaction_detail.dart';
import 'package:flutter_ewallet/widget/transaction_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue.shade800, Colors.white60],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.blueGrey,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello',
                          style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Bastomi Adi Nugroho',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15
                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Stack(
                        children: const [
                          Icon(
                            Icons.notifications_none_rounded,
                            color: Colors.white,
                            size: 30,
                            
                          ),
                          Positioned(child: Icon(
                            Icons.brightness_1,
                            size: 8.0,
                            color: Colors.redAccent,
                          ))
                        ],
                      )
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: Column(
                children: const [
                  Text(
                      'Saldo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                        'Rp. 2.000.000.000',
                      style: TextStyle(color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  MenuWidget(
                      icon: Icons.send_rounded,
                      text: 'Kirim'
                  ),
                  MenuWidget(
                      icon: Icons.account_balance_wallet_rounded,
                      text: 'Terima'
                  ),
                  MenuWidget(
                      icon: Icons.payment_rounded,
                      text: 'Bayar'
                  ),
                  MenuWidget(
                      icon: Icons.more_horiz_rounded,
                      text: 'Lainnya'
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45)
                  )
                ),
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 25
                    ),
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            'Transaksi Terakhir',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF3D538F),
                                fontWeight: FontWeight.bold
                            ),
                          )
                          ),
                          GestureDetector(
                            onTap: (){
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext ctx){
                                    return const TransactionDetail();
                                  },
                                isScrollControlled: true
                              );
                            },
                            child: const Text(
                              'Lihat Semua',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF3D538F),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index){
                          return TransactionItem(
                            transaction: transactions[index],
                          );
                        },
                        itemCount: transactions.length,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
