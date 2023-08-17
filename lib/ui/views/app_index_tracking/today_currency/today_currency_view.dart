import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './today_currency_view_model.dart';

class TodayCurrencyView extends StatelessWidget {
  const TodayCurrencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodayCurrencyViewModel>.reactive(
      viewModelBuilder: () => TodayCurrencyViewModel(),
      onViewModelReady: (TodayCurrencyViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        TodayCurrencyViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async {
            // model.navigationService.back();
            if (model.globalVar.backPressed == 'backNormal') {
              model.quitApp(context);
            }
            return false;
          },
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Terakhir diperbarui : ',
                    style: regularTextStyle,
                    children: [
                      TextSpan(
                        text: model.otherFunction.timeStampConverter(model
                            .globalVar.myResponseModel!.timeLastUpdateUnix!),
                        style: boldTextStyle.copyWith(
                          color: greenColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Update berikutnya : ',
                    style: regularTextStyle,
                    children: [
                      TextSpan(
                        text: model.otherFunction.timeStampConverter(model
                            .globalVar.myResponseModel!.timeNextUpdateUnix!),
                        style: boldTextStyle.copyWith(
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Tukaran : ',
                    style: regularTextStyle,
                    children: [
                      TextSpan(
                        text: 'Rp . ${model.globalVar.allCurrencyModel!.iDR}',
                        style: boldTextStyle.copyWith(
                          color: redColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: model.globalVar.jsonAllCurrency != null
                      ? SingleChildScrollView(
                          child: Column(
                            children: model.globalVar.allCurrencyModel!
                                .toJson()
                                .entries
                                .map(
                              (e) {
                                // make e.key to be uppercase
                                String key = e.key.toString().toUpperCase();
                                String lowerKey =
                                    e.key.toString().toLowerCase();
                                var row = model.globalVar.jsonAllCurrency
                                    .firstWhere(
                                        (currency) =>
                                            currency['AlphabeticCode'] == key,
                                        orElse: () => null);
                                // Map<String, dynamic> rowMap = row;
                                if (row != null) {
                                  // model.log.i(row['Currency']);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    // add icon to card
                                    child: Card(
                                        child: ListTile(
                                      leading: Image.asset(
                                        'assets/flags/$lowerKey.png',
                                        width: 50,
                                        height: 50,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(Icons.error);
                                        },
                                      ),
                                      title: Text(
                                        row['Entity'],
                                        style: boldTextStyle,
                                      ),
                                      subtitle: Text(
                                        row['Currency'],
                                        style: regularTextStyle,
                                      ),
                                      trailing: Text(
                                        e.value.toString(),
                                        style: boldTextStyle.copyWith(
                                          color: redColor,
                                        ),
                                      ),
                                    )),
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ).toList(),
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
