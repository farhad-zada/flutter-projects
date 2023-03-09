import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const kTextStyle = TextStyle(fontSize: 20.0, color: Colors.white);

const String apiKey = '46C390D3-7F01-4980-AC97-97AB19862F18';
const coinUrl =
    'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=D961D47F-029A-433B-9CD6-357702FE1E26';

const List<String> kCurrenciesList = [
  'USD',
  'EUR',
  'TRY',
  'RUB',
  /*'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'TRY',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',*/
];

const List<String> kCryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'DOGE',
  'APE',
  'BNB',
];

class CoinData {
  dynamic getExchangeRate(coin, currency) async {
    dynamic response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$coin/$currency?apikey=$apiKey'));
    return response;
  }
}
