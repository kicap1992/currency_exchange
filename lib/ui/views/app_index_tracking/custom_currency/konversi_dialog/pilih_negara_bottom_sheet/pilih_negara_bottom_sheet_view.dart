import 'package:curreny_exchange/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../../app/themes/app_text.dart';
import './pilih_negara_bottom_sheet_view_model.dart';

// class PilihNegaraData {
//   final bool? isKonversi;
//   final String? alphabeticCode;

//   PilihNegaraData({
//     this.isKonversi,
//     this.alphabeticCode,
//   });
// }

class PilihNegaraBottomSheetView extends StatelessWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  const PilihNegaraBottomSheetView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PilihNegaraBottomSheetViewModel>.reactive(
      viewModelBuilder: () => PilihNegaraBottomSheetViewModel(),
      onViewModelReady: (PilihNegaraBottomSheetViewModel model) async {
        await model.init(request!.data);
      },
      builder: (
        BuildContext context,
        PilihNegaraBottomSheetViewModel model,
        Widget? child,
      ) {
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pilih Negara',
                style: italicTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var item in model.globalVar.allInfoModel)
                        Card(
                          // creata a checkbox at the e
                          color: request!.data['currencyCountry'] ==
                                  item.alphabeticCode
                              ? mainColor
                              : Colors.white,
                          child: ListTile(
                            onTap: () {
                              // if (isKonversi) {
                              completer!(
                                  SheetResponse(confirmed: true, data: item));
                              // }
                            },
                            leading: Image.asset(
                              'assets/flags/${item.alphabeticCode!.toLowerCase()}.png',
                              width: 30,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.error);
                              },
                            ),
                            title: Text(
                              item.entity!,
                              style: italicTextStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: request!.data['currencyCountry'] ==
                                        item.alphabeticCode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              item.currency!,
                              style: italicTextStyle.copyWith(
                                fontSize: 15,
                                // fontWeight: FontWeight.bold,
                                color: request!.data['currencyCountry'] ==
                                        item.alphabeticCode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
