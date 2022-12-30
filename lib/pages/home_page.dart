import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/utils/my_button.dart';
import 'package:wallet_app/utils/my_card.dart';
import 'package:wallet_app/utils/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // pagecontroller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.monetization_on,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Colors.pink[200],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 8.0,
              ),
              //appbar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "My",
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        //
                        Text(
                          " Cards",
                          style: TextStyle(fontSize: 28),
                        ),
                      ],
                    ),
                    //plus button
                    Container(
                      // padding: EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),

              //cards
              Container(
                height: 200,
                child: PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    MyCard(
                      balance: 5250.25,
                      cardNumber: 12345678,
                      expiryMonth: 10,
                      expiryYear: 24,
                      color: Colors.deepPurple[300],
                    ),
                    MyCard(
                      balance: 1468.15,
                      cardNumber: 12345678,
                      expiryMonth: 11,
                      expiryYear: 22,
                      color: Colors.blue[300],
                    ),
                    MyCard(
                      balance: 5840.27,
                      cardNumber: 12345678,
                      expiryMonth: 16,
                      expiryYear: 05,
                      color: Colors.green[300],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 9.0,
                  dotWidth: 9.0,
                  activeDotColor: Colors.grey.shade800,
                ),
              ),

              SizedBox(height: 25),
              //3 buttons => send + pay + bill
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //send button
                    MyButton(
                      iconImagePath: 'lib/icons/send-money.png',
                      buttonText: 'Send',
                    ),
                    // pay button
                    MyButton(
                      iconImagePath: 'lib/icons/credit-card.png',
                      buttonText: 'Pay',
                    ),
                    //bills button
                    MyButton(
                      iconImagePath: 'lib/icons/bill.png',
                      buttonText: 'Bill',
                    ),
                  ],
                ),
              ),
              //colums -> stats + transactions
              SizedBox(height: 40),

              //column -> state -> transection history
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    //statistics
                    MyListTile(
                      iconImagePath: 'lib/icons/statistics.png',
                      tileSubTitle: 'Statistics',
                      tileTitle: 'Payment and Income',
                    ),

                    //transection history
                    MyListTile(
                      iconImagePath: 'lib/icons/transaction.png',
                      tileSubTitle: 'Transaction',
                      tileTitle: 'Transection History',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
