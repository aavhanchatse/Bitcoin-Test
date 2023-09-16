import 'package:bitcoin_price/models/currency_data_model.dart';
import 'package:bitcoin_price/repo/auth_repo.dart';
import 'package:bitcoin_price/utils/default_snackbar_util.dart';
import 'package:bitcoin_price/utils/internet_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var currencyData = CurrencyData().obs;
  var loading = true.obs;
  var selectedCurrency = 0.obs;
  var currencies = <Currency>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getCurrencyData();
  }

  void getCurrencyData() async {
    final isInternet = await InternetUtil.isInternetConnected();
    loading.value = true;

    if (isInternet) {
      try {
        final CurrencyData? result = await MasterRepo().getCurrencyData();

        if (result != null) {
          setValues(result);
        } else {
          loading.value = false;
          SnackBarUtil.showSnackBar(
              "Couldn't fetch data. Try after some time.");
        }
      } catch (error) {
        loading.value = false;
        SnackBarUtil.showSnackBar('Something went wrong');
        debugPrint('error: $error');
      }
    } else {
      SnackBarUtil.showSnackBar('No Internet Connected');
    }
  }

  void setValues(CurrencyData result) {
    currencyData.value = result;
    Map<String, dynamic> currencyMap = result.bpi!.toJson();

    // for (var element in currencyMap.entries) {
    //   final value = Currency.fromJson(element.value);
    //   element.value = value;
    // }

    final currencyList = currencyMap.entries.map((entry) {
      Map<String, dynamic> currencyData = entry.value;
      return Currency.fromJson(currencyData);
    }).toList();

    currencies.clear();
    currencies.addAll(currencyList);

    loading.value = false;
  }
}
