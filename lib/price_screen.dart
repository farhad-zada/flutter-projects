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
  String? selectedKey = 'Key One';
  double? coinExchangeRate;

  List<Text> currencyList = [];

  @override
  void initState() {
    initializer();
    super.initState();
  }

  void initializer() async {
    dynamic source = await CoinData().getExchangeRate(
      selectedCoin,
      selectedCurrency,
      selectedKey,
    );
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/abc.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
                color: Colors.teal[800],
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
                          dynamic coinData = await CoinData().getExchangeRate(
                              value, selectedCurrency, selectedKey);
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
                        width: 20.0,
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
              color: const Color(0xff404448),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff006658),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: AndroidPicker(
                      dropdownMenuData: kCurrenciesList,
                      selected: selectedCurrency,
                      toDo: (value) async {
                        dynamic coinData = await CoinData().getExchangeRate(
                          selectedCoin,
                          value,
                          selectedKey,
                        );
                        setState(
                          () {
                            selectedCurrency = value;
                            coinExchangeRate =
                                jsonDecode(coinData.body)['rate'];
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffff9944),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: AndroidPicker(
                      dropdownMenuData: apiKeys.keys.toList(),
                      selected: selectedKey,
                      toDo: (value) async {
                        dynamic coinData = await CoinData().getExchangeRate(
                          selectedCoin,
                          selectedCurrency,
                          value,
                        );
                        setState(
                          () {
                            selectedKey = value;
                            coinExchangeRate =
                                jsonDecode(coinData.body)['rate'];
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
