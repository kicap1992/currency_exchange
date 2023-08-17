import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../services/my_easyloading.dart';

class AppIndexTrackingViewModel extends IndexTrackingViewModel {
  final log = getLogger('AppIndexTrackingViewModel');
  final _navigationService = locator<NavigationService>();
  final _easyLoading = locator<MyEasyLoading>();

  final _bottomNavBarList = [
    {
      'name': 'Tukaran Global',
      // money icon
      'icon': Icons.attach_money,
      'header': 'TUKARAN UANG GLOBAL'
    },
    {'name': 'Input Tukaran', 'icon': Icons.money, 'header': 'INPUT TUKARAN'},
  ];

  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;

  final List<String> _views = [
    AppIndexTrackingViewRoutes.todayCurrencyView,
    AppIndexTrackingViewRoutes.customCurrencyView,
  ];

  String header = 'TUKARAN UANG GLOBAL';

  Future<void> init() async {
    _easyLoading.showLoading();
    await Future.delayed(const Duration(seconds: 1));
    _navigationService.navigateTo(
      _views[0],
      id: 3,
    );
    _easyLoading.dismissLoading();
  }

  void handleNavigation(int index) {
    log.d("handleNavigation: $index");
    log.d("currentIndex: $currentIndex");

    if (currentIndex == index) return;

    setIndex(index);
    header = _bottomNavBarList[index]['header'] as String;
    _navigationService.navigateTo(
      _views[index],
      id: 3,
    );
  }
}
