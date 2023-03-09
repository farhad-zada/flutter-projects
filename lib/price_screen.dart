import 'dart:convert';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'android_dropdown.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = 'EUR';
  String? selectedCoin = 'ETH';
  double? coinExchangeRate;

  List<Text> currencyList = [];

  @override
  void initState() {
    initializer();
    super.initState();
  }

  void initializer() async {
    dynamic source = await CoinData().getExchangeRate('ETH', 'EUR');
    setState(() {
      coinExchangeRate = jsonDecode(source.body)['rate'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              18.0,
              18.0,
              18.0,
              0.0,
            ),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 28.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '1 ',
                      style: kTextStyle,
                    ),
                    AndroidPicker(
                      dropdownMenuData: kCryptoList,
                      selected: selectedCoin,
                      toDo: (value) async {
                        dynamic coinData = await CoinData()
                            .getExchangeRate(value, selectedCurrency);
                        setState(
                          () {
                            selectedCoin = value;
                            coinExchangeRate =
                                jsonDecode(coinData.body)['rate'];
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '${coinExchangeRate?.toStringAsFixed(2)} $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 140.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              bottom: 30.0,
            ),
            color: Colors.blueGrey[700],
            child: AndroidPicker(
              dropdownMenuData: kCurrenciesList,
              selected: selectedCurrency,
              toDo: (value) async {
                dynamic coinData =
                    await CoinData().getExchangeRate(selectedCoin, value);
                setState(
                  () {
                    selectedCurrency = value;
                    coinExchangeRate = jsonDecode(coinData.body)['rate'];
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}







/* 
  Widget select(given) {
    if (!Platform.isIOS) {
      return IOSPicker(
          selected: selectedCurrency,
          dropdownMenuData: given,
          toDo: (index) async {
            dynamic coinData =
                await CoinData().getExchangeRate('ETH', given[index]);
            setState(() {
              selectedCurrency = given[index];
              coinExchangeRate = jsonDecode(coinData.body)['rate'];
            });
          });
    } else {
      return AndroidPicker(
        dropdownMenuData: given,
        selected: selectedCurrency,
        toDo: (value) async {
          dynamic coinData = await CoinData().getExchangeRate('ETH', value);
          setState(
            () {
              selectedCurrency = value;
              coinExchangeRate = jsonDecode(coinData.body)['rate'];
            },
          );
        },
      );
    }
  } */
