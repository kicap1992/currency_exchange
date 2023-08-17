import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/app.bottomsheets.dart';
import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';
import '../../../../../app/themes/app_colors.dart';
import '../../../../../app/themes/app_text.dart';
import '../../../../../models/all_info_model.dart';

class KonversiDialogViewModel extends CustomBaseViewModel {
  final log = getLogger('KonversiDialogViewModel');
  String? currencyCountry;
  Widget? currencyWidget;
  String? hintText;
  String? konversiCountry;
  Widget? konversiWidget;

  TextEditingController nilaiTukaranController = TextEditingController();
  FocusNode nilaiTukaranFocusNode = FocusNode();

  Future<void> init() async {}

  pilihNegara(bool bool) async {
    // FocusScope.of(StackedService.navigatorKey!.currentContext!).unfocus();
    final res = await bottomSheetService.showCustomSheet(
      variant: BottomSheetType.pilihNegaraBottomSheetView,
      data: {
        'bool': bool,
        'currencyCountry': bool == true ? currencyCountry : konversiCountry,
      },
    );

    if (res!.confirmed == true) {
      log.i('${res.data}  ini res.data');
      // if (res.data !=
      AllInfoModel? allInfoModel = res.data;

      if (bool == true) {
        currencyCountry = allInfoModel!.alphabeticCode;
        log.i(allInfoModel.entity);
        hintText = 'Tukaran ${allInfoModel.alphabeticCode}';
        currencyWidget = Row(
          children: [
            Image.asset(
              'assets/flags/${allInfoModel.alphabeticCode!.toLowerCase()}.png',
              width: 30,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.error,
                  color: redColor,
                );
              },
            ),
            const SizedBox(width: 15),
            Expanded(
              child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: allInfoModel.entity,
                    style: regularTextStyle.copyWith(
                      color: greenColor,
                    ),
                    children: [
                      TextSpan(
                        text: ' (${allInfoModel.alphabeticCode})',
                        style: italicTextStyle.copyWith(
                          color: greenColor,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        );
      } else {
        // log.i(allInfoModel!.entity);

        konversiCountry = (res.data == 'all'
            ? 'Semua Mata Uang'
            : allInfoModel!.alphabeticCode)!;

        // hintText = 'Tukaran ${allInfoModel.alphabeticCode}';
        konversiWidget = Row(
          children: [
            Image.asset(
              'assets/flags/${allInfoModel!.alphabeticCode!.toLowerCase()}.png',
              width: 30,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.error,
                  color: redColor,
                );
              },
            ),
            const SizedBox(width: 15),
            Expanded(
              child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: allInfoModel.entity,
                    style: regularTextStyle.copyWith(
                      color: greenColor,
                    ),
                    children: [
                      TextSpan(
                        text: ' (${allInfoModel.alphabeticCode})',
                        style: italicTextStyle.copyWith(
                          color: greenColor,
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        );
      }
    }
    notifyListeners();
  }

  konversi(Function(DialogResponse p1)? completer) async {
    if (currencyCountry == null) {
      snackbarService.showSnackbar(
        message: 'Pilih Mata Uang',
        title: 'Pilih Negara',
      );
      pilihNegara(true);
      return;
    }
    if (nilaiTukaranController.text == '') {
      snackbarService.showSnackbar(
        message: 'Masukkan Nilai Tukaran',
        title: 'Nilai Tukaran',
      );

      // focus on textfield
      FocusScope.of(StackedService.navigatorKey!.currentContext!)
          .requestFocus(nilaiTukaranFocusNode);
      return;
    }

    if (konversiCountry == null) {
      snackbarService.showSnackbar(
        message: 'Pilih Mata Uang Koversi',
        title: 'Pilih Negara',
      );
      pilihNegara(false);
      return;
    }

    // remove keyboard
    FocusScope.of(StackedService.navigatorKey!.currentContext!).unfocus();

    completer!(
      DialogResponse(confirmed: true, data: {
        'currencyCountry': currencyCountry,
        'nilaiTukaran': nilaiTukaranController.text,
        'konversiCountry': konversiCountry,
      }),
    );
  }
}
