import 'package:flutter/material.dart';
import 'value_page.dart';
import 'time_page.dart';

class CustomButton extends StatelessWidget {
  final String coinName;
  final String coinId;

  const CustomButton({Key? key, required this.coinName, required this.coinId})
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
                      TimePage(coinName: coinName, coinId: coinId)));
            },
            child: Text(coinName)),
      ),
    );
  }
}

class CustomButtonTime extends StatelessWidget {
  final String myText;
  final String coinId;
  final String coinName;
  final String timeUrlEndpoint;

  const CustomButtonTime(
      {Key? key,
        required this.myText,
        required this.coinName,
        required this.coinId,
        required this.timeUrlEndpoint
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var myUrl = "https://api.coinpaprika.com/v1/tickers/" +
    //     coinId +
    //     "/historical?start=2021-10-12&interval=1d&limit=4000";
    var myUrl = "https://api.coinpaprika.com/v1/tickers/" +
        coinId +
        "/" +
        timeUrlEndpoint;
    //"/historical?start=2021-10-12&interval=1d&limit=4000";
    // const myUrl =
    //     "https://api.coinpaprika.com/v1/tickers/btc-bitcoin/historical?start=2021-10-12&interval=1d&limit=4000";
    debugPrint("myUrl: " + myUrl);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ValuePage(coinName: coinName, urlCoin: myUrl, dateType: myText)));
            },
            child: Text(myText)),
      ),
    );
  }
}
