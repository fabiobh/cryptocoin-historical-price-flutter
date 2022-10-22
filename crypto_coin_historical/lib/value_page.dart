//import 'dart:convert';
import 'dart:io';

import 'package:crypto_coin_historical/model/crypto_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ValuePage extends StatefulWidget {
  final String coinName;
  final String urlCoin;
  final String dateType;
  const ValuePage({Key? key, required this.coinName, required this.urlCoin, required this.dateType}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ValuePageState();
  }
}

class ValuePageState extends State<ValuePage> {
  final String urlBase = "https://api.coinpaprika.com/v1/coins";
  //final String urlCoin = "https://api.coinpaprika.com/v1/tickers/btc-bitcoin/historical?start=2021-10-12&interval=1d&limit=4000";

  
  bool stateCircularProgressIndicator = true;
  List<CryptoDetails> cdList = CryptoDetails.getMockObjects();

  @override
  void initState() {
    super.initState();
    debugPrint("valuePage init");
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    // List<int> myList = <int>[];

    // List<String> list = ['one', 'two', 'three', 'four'];
    // List<Widget> widgets = list.map((name) => Text(name)).toList();
    //print(cd.timestamp);
    String pageTitle = widget.dateType+" - PRICE";

    return Scaffold(
        appBar: AppBar(
          title: Text(pageTitle),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  cdList = cdList.reversed.toList();
                });
              },
              icon: const Icon(Icons.change_circle),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(child: Text(widget.coinName)),
              const SizedBox(height: 20),
              Visibility(
                  child: const CircularProgressIndicator(),
                  visible: stateCircularProgressIndicator),
              // Column(
              //   children: [
              _getListWidgets(cdList),
              //   ],
              // )
            ],
          ),
        ));
  }

  Widget _getListWidgets(List<CryptoDetails> lstItens) {
    return Column(
        children: lstItens
            .map((i) =>
                (Text("${i.timestamp.split('T')[0].trim()} --- ${i.price}")))
            .toList());

    // return const Text("Hello World", textAlign: TextAlign.center);
  }

  void getHttp() async {
    debugPrint('começou');
    bool isOnline = await hasNetwork();
    debugPrint("isOnline: $isOnline");
    try {
      Response response = await Dio().get(widget.urlCoin);
      //print(response);
      var listaData = response.data as List;

      List<CryptoDetails> myList2 = <CryptoDetails>[];

      for (var i = 0; i < listaData.length; i++) {
        var a = CryptoDetails(
            timestamp: response.data[i]["timestamp"],
            price: response.data[i]["price"],
            volume_24h: response.data[i]["volume_24h"],
            marketCap: response.data[i]["market_cap"]);
        myList2.add(a);
      }

      // print("listaData.length: ${listaData.length}");
      // print("length: ${myList2.length}");
      // print("marketCap: ${myList2[0].marketCap}");

      // print('timestamp: ${response.data[0]["timestamp"]}');
      // print('price: ${response.data[0]["price"]}');

      setState(() {
        stateCircularProgressIndicator = false;
        //animals.reversed.toList();
        cdList = myList2.reversed.toList();
      });

      debugPrint('acabou');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}
