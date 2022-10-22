import 'package:crypto_coin_historical/custom_button.dart';
import 'package:crypto_coin_historical/custom_button_top_coins.dart';
//import 'package:crypto_coin_historical/time_page.dart';
import 'package:flutter/material.dart';

//import 'coins_page.dart';

typedef VoidCallback = void Function();

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    const textStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("HISTORICAL PRICE"),
      ),
      body: SingleChildScrollView(
          child: Column (
            children: const <Widget>[
              
              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10), //apply padding to LTRB, L:Left, T:Top, R:Right, B:Bottom
                child: Text(
                  'Select a crypto coin or a list',
                  style: textStyle,
                )
              ),

              SizedBox(height: 10),
              
              CustomButton(coinId: "btc-bitcoin", coinName: "BITCOIN"),
              CustomButton(coinId: "eth-ethereum", coinName: "ETHEREUM"),
              CustomButton(coinId: "bnb-binance-coin", coinName: "BINANCE COIN"),
              CustomButton(coinId: "sol-solana", coinName: "SOLANA"),
              
              SizedBox(height: 50),
              
              CustomButtonTopCoin(
                coinText: "TOP 100 COINS",
                numberOfCoins: 100,
              ),
              CustomButtonTopCoin(
                coinText: "TOP 1000 COINS",
                numberOfCoins: 1000,
              ),
              CustomButtonTopCoin(
                coinText: "TOP 10000 COINS",
                numberOfCoins: 10000,
              ),
              //Expanded(child: SizedBox(height: 60)),
          ],
        ),
      ),
    );
  }

  void newMethod1() {
    debugPrint("ddd");
  }
}
