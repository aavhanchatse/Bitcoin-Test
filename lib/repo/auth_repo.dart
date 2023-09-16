import 'dart:convert';

import 'package:bitcoin_price/app_constants/api_path.dart';
import 'package:bitcoin_price/models/currency_data_model.dart';
import 'package:bitcoin_price/utils/api_methods.dart';

class MasterRepo {
  final API _api = API();

  Future<CurrencyData?> getCurrencyData() async {
    final response = await _api.getMethod(ApiPath.getCurrencyPrices);

    Map<String, dynamic> map = (jsonDecode(response.body));

    return CurrencyData.fromJson(map);
  }
}
