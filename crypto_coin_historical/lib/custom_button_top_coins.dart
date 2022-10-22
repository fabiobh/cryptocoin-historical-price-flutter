import 'package:flutter/material.dart';

import 'coins_page.dart';
//import 'time_page.dart';

class CustomButtonTopCoin extends StatelessWidget {
  final int numberOfCoins;
  final String coinText;

  const CustomButtonTopCoin(
      {Key? key, required this.numberOfCoins, required this.coinText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CoinsPage(coinQuantity: numberOfCoins)));
            },
            child: Text(coinText)),
      ),
    );
  }
}
