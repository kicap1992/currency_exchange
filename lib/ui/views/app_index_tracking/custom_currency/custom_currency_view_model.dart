import '../../../../app/app.dialogs.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../models/all_info_model.dart';
import '../../../../models/conversion_result_model.dart';

class CustomCurrencyViewModel extends CustomBaseViewModel {
  final log = getLogger('CustomCurrencyViewModel');
  ConversionResultModel? conversionResultModel;
  AllInfoModel? currencyInfoModel;
  AllInfoModel? konversiInfoModel;
  String? nilaiTukaran;
  Future<void> init() async {}

  myDialog() async {
    final res = await dialogService.showCustomDialog(
      variant: DialogType.konversiDialogView,
    );

    if (res!.confirmed) {
      setBusy(true);
      globalVar.backPressed = 'cantBack';
      easyLoading.customLoading('Loading Konversi Tukaran ...');
      log.i(res.data);
      String currencyCountry = res.data['currencyCountry'];
      String nilaiTukaran = res.data['nilaiTukaran'];
      String konversiCountry = res.data['konversiCountry'];

      this.nilaiTukaran = nilaiTukaran;

      String api = '/pair/$currencyCountry/$konversiCountry/$nilaiTukaran';

      try {
        var response = await httpService.get(api);
        log.i(response.data);

        for (var item in globalVar.allInfoModel) {
          if (item.alphabeticCode == currencyCountry) {
            currencyInfoModel = item;
          }
          if (item.alphabeticCode == konversiCountry) {
            konversiInfoModel = item;
          }
        }

        log.i(currencyInfoModel!.entity);
        log.i(konversiInfoModel!.entity);

        conversionResultModel = ConversionResultModel.fromJson(response.data);
      } catch (e) {
        snackbarService.showSnackbar(message: e.toString());
        log.e(e);
      } finally {
        setBusy(false);
        globalVar.backPressed = 'backNormal';
        easyLoading.dismissLoading();
        notifyListeners();
      }
    }
  }
}
