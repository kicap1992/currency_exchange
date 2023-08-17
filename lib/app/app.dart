import 'package:curreny_exchange/ui/views/app_index_tracking/custom_currency/konversi_dialog/konversi_dialog_view.dart';
import 'package:curreny_exchange/ui/views/app_index_tracking/custom_currency/konversi_dialog/pilih_negara_bottom_sheet/pilih_negara_bottom_sheet_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';

import '../services/global_var.dart';
import '../services/http_services.dart';
import '../services/my_easyloading.dart';
import '../services/other_function.dart';
import '../ui/views/app_index_tracking/app_index_tracking_view.dart';
import '../ui/views/app_index_tracking/custom_currency/custom_currency_view.dart';
import '../ui/views/app_index_tracking/today_currency/today_currency_view.dart';
import '../ui/views/loading_screen/loading_screen_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(
      page: AppIndexTrackingView,
      children: [
        MaterialRoute(page: LoadingScreenView, initial: true),
        MaterialRoute(page: TodayCurrencyView),
        MaterialRoute(page: CustomCurrencyView),
      ],
    ),
  ],
  dialogs: [
    StackedDialog(classType: KonversiDialogView),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: PilihNegaraBottomSheetView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    //

    LazySingleton(classType: MyEasyLoading),
    LazySingleton(classType: MyHttpServices),
    LazySingleton(classType: OtherFunction),
    LazySingleton(classType: GlobalVar),
  ],
  logger: StackedLogger(),
)
class App {}
