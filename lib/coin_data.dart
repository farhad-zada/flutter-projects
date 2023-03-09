import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const kTextStyle = TextStyle(fontSize: 20.0, color: Colors.white);

const Map<String, String> apiKeys = {
  'Key One': '46C390D3-7F01-4980-AC97-97AB19862F18',
  'Key Two': 'D961D47F-029A-433B-9CD6-357702FE1E26',
  'Key Three': '17E0B381-113C-4122-9DCC-7FC3B98EA6A2',
};
const coinUrl =
    'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=D961D47F-029A-433B-9CD6-357702FE1E26';

const List<String> kCurrenciesList = [
  'USD',
  'EUR',
  'TRY',
  'RUB',
];

const List<String> kCryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'DOGE',
  'APE',
  'BNB',
];

const List<String> kApiKeys = [
  'Key One',
  'Key Two',
];

class CoinData {
  dynamic getExchangeRate(coin, currency, apiKey) async {
    dynamic response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/$coin/$currency?apikey=${apiKeys[apiKey]}'));
    return response;
  }
}
