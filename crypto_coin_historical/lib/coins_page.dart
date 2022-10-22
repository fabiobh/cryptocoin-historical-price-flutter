//import 'dart:convert';
import 'dart:io';

import 'package:crypto_coin_historical/custom_button.dart';
//import 'package:crypto_coin_historical/model/crypto_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model/crypto_coin.dart';

class CoinsPage extends StatefulWidget {
  final int coinQuantity;
  const CoinsPage({Key? key, required this.coinQuantity}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CoinsPageState();
  }
}

class CoinsPageState extends State<CoinsPage> {
  final String urlCoins = "https://api.coinpaprika.com/v1/coins";

  String pageTitle = "";
  bool stateCircularProgressIndicator = true;
  List<CryptoCoin> cdList = CryptoCoin.getMockObjects();

  @override
  void initState() {
    super.initState();
    debugPrint("dddd");

    setState(() {
      pageTitle = "TOP " + widget.coinQuantity.toString() + " COINS";
    });

    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    // List<int> myList = <int>[];

    // List<String> list = ['one', 'two', 'three', 'four'];
    // List<Widget> widgets = list.map((name) => Text(name)).toList();
    //print(cd.timestamp);

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
              Center(child: Text(widget.coinQuantity.toString() + " coins")),
              const SizedBox(height: 20),
              Visibility(
                  child: const CircularProgressIndicator(),
                  visible: stateCircularProgressIndicator),
              
                  Row(
                    children: [
                      _getListWidgets(cdList),
                    ],
                  ),
              
            ],
          ),
        ));
  }

  Widget _getListWidgets(List<CryptoCoin> lstItens) {

    return Expanded(
          flex: 100, // 20%
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: lstItens
            .map((i) => (
                CustomButton(
                  coinId: i.id, coinName: i.rank.toString() + " - "+i.name
                )
                // Text(
                //   "${i.rank} - ${i.id.split('-')[0].trim()} -- ${i.name} -- ${i.id}"
                // )
              )
            )
            .toList()
      )
    );

    // return const Text("Hello World", textAlign: TextAlign.center);
  }

  void getHttp() async {
    debugPrint('começou');
    bool isOnline = await hasNetwork();
    debugPrint("isOnline: $isOnline");
    try {
      Response response = await Dio().get(urlCoins);
      debugPrint(response.toString());
      var listaData = response.data as List;

      List<CryptoCoin> myList2 = <CryptoCoin>[];
      // listaData.length

      for (var i = 0; i < widget.coinQuantity; i++) {
        var a = CryptoCoin(
            id: response.data[i]["id"],
            name: response.data[i]["name"],
            symbol: response.data[i]["symbol"],
            rank: response.data[i]["rank"],
            isNew: response.data[i]["is_new"],
            isActive: response.data[i]["is_active"],
            type: response.data[i]["type"]);
        myList2.add(a);
      }

      debugPrint("listaData.length: ${listaData.length}");
      debugPrint("length: ${myList2.length}");

      //print("price: " + double.parse(response.data[0]["price"]).toString());

      setState(() {
        // pageTitle = "acabou";
        stateCircularProgressIndicator = false;
        //animals.reversed.toList();
        cdList = myList2.toList();
      });

      debugPrint('acabou');
    } catch (e) {
      debugPrint("error: "+e.toString());
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
