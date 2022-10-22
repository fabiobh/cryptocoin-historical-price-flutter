import 'package:flutter/material.dart';
import 'package:crypto_coin_historical/custom_button.dart';

//import 'value_page.dart';

class TimePage extends StatelessWidget {
  final String coinName;
  final String coinId;
  const TimePage({Key? key, required this.coinName, required this.coinId}) : super(key: key);

  // final String myColor;
  // TimePage({required this.myColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TIME"),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Center(child: Text(coinName)),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20,
                10), //apply padding to LTRB, L:Left, T:Top, R:Right, B:Bottom
            child: Text(
                "Select which type of time you want to see Crypto Coins values",
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: 20),


          CustomButtonTime(myText: "YEAR", coinId: coinId, coinName: coinName, timeUrlEndpoint: "historical?start=2011-01-01&interval=365d&limit=100", ),
          CustomButtonTime(myText: "MONTH", coinId: coinId, coinName: coinName, timeUrlEndpoint: "historical?start=2015-01-01&interval=30d&limit=100", ),
          CustomButtonTime(myText: "WEEK", coinId: coinId, coinName: coinName, timeUrlEndpoint: "historical?start=2018-01-03&interval=7d&limit=1000", ),
          CustomButtonTime(myText: "DAY", coinId: coinId, coinName: coinName, timeUrlEndpoint: "historical?start=2018-01-03&interval=1d&limit=4000", ),
          
        ],
      ),
    );
  }
}

class MyNewTextWidget extends StatelessWidget {
  final String myText;

  const MyNewTextWidget({Key? key, required this.myText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20,
          10), //apply padding to LTRB, L:Left, T:Top, R:Right, B:Bottom
      child: Text(myText, textAlign: TextAlign.center),
    );
  }
}
