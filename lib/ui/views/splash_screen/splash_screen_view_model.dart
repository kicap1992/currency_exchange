import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../models/all_currency.dart';
import '../../../models/all_info_model.dart';
import '../../../models/my_response.dart';

class SplashScreenViewModel extends CustomBaseViewModel {
  final log = getLogger('SplashScreenViewModel');
  MyResponseModel? myResponseModel;
  Future<void> init() async {
    globalVar.backPressed = 'cantBack';
    getData();
  }

  getData() async {
    setBusy(true);

    try {
      var response = await httpService.get('/latest/IDR');
      // log.i(response.data);
      myResponseModel = MyResponseModel.fromJson(response.data);
      globalVar.myResponseModel = myResponseModel;
      // log.i(myResponseModel!.conversionRates);
      AllCurrencyModel allCurrencyModel =
          AllCurrencyModel.fromJson(myResponseModel!.conversionRates!);
      globalVar.allCurrencyModel = allCurrencyModel;
      final String jsonData =
          await rootBundle.loadString('assets/codes-all.json');
      globalVar.jsonAllCurrency = jsonDecode(jsonData);
      // log.i(globalVar.jsonAllCurrency);
      // conver jsonData to Map<String, dynamic>
      for (var item in globalVar.jsonAllCurrency) {
        // log.i(item);
        globalVar.allInfoModel.add(AllInfoModel.fromJson(item));
      }
      Future.delayed(const Duration(seconds: 1), () {
        navigationService.replaceWith(Routes.appIndexTrackingView);
      });
    } catch (e) {
      snackbarService.showSnackbar(message: e.toString());
      log.e(e);
    } finally {
      setBusy(false);
      globalVar.backPressed = 'backNormal';
    }
  }
}
