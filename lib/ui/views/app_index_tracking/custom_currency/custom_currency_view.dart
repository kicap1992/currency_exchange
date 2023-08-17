import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './custom_currency_view_model.dart';

class CustomCurrencyView extends StatelessWidget {
  const CustomCurrencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomCurrencyViewModel>.reactive(
      viewModelBuilder: () => CustomCurrencyViewModel(),
      onViewModelReady: (CustomCurrencyViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        CustomCurrencyViewModel model,
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
              body: model.conversionResultModel == null
                  ? const Center(
                      child: Text(
                        'Sila Klik Icon Untuk\nKonversi Tukaran Mata Uang',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : const TheDataWidget(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // model.navigationService.back();
                  model.myDialog();
                },
                // icon exchange currency
                child: const Icon(Icons.swap_horiz),
              )),
        );
      },
    );
  }
}

class TheDataWidget extends ViewModelWidget<CustomCurrencyViewModel> {
  const TheDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, CustomCurrencyViewModel viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Terakhir diperbarui : ',
            style: regularTextStyle,
            children: [
              TextSpan(
                text: viewModel.otherFunction.timeStampConverter(
                    viewModel.conversionResultModel!.timeLastUpdateUnix!),
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
                text: viewModel.otherFunction.timeStampConverter(
                    viewModel.conversionResultModel!.timeNextUpdateUnix!),
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
        Row(
          children: [
            const Text('Mata Uang : ', style: regularTextStyle),
            const SizedBox(
              width: 3,
            ),
            Image.asset(
              'assets/flags/${viewModel.currencyInfoModel!.alphabeticCode!.toLowerCase()}.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              viewModel.currencyInfoModel!.entity!,
              style: boldTextStyle.copyWith(
                color: redColor,
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              '( ${viewModel.currencyInfoModel!.alphabeticCode} )',
              style: italicTextStyle.copyWith(
                color: redColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            text: 'Jumlah Tukaran : ',
            style: regularTextStyle,
            children: [
              TextSpan(
                text:
                    '${viewModel.currencyInfoModel!.alphabeticCode} ${viewModel.otherFunction.commaFormat(int.parse(viewModel.nilaiTukaran!))}',
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
        RichText(
          text: TextSpan(
            text: 'Konversi Tukaran : ',
            style: regularTextStyle,
            children: [
              TextSpan(
                text: '1 ${viewModel.currencyInfoModel!.alphabeticCode}',
                style: boldTextStyle.copyWith(
                  color: redColor,
                ),
              ),
              const TextSpan(
                text: ' = ',
                style: regularTextStyle,
              ),
              TextSpan(
                text:
                    '${viewModel.conversionResultModel!.conversionRate} ${viewModel.konversiInfoModel!.alphabeticCode}',
                style: boldTextStyle.copyWith(
                  color: orangeColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text('Uang Konversi: ', style: regularTextStyle),
            const SizedBox(
              width: 3,
            ),
            Image.asset(
              'assets/flags/${viewModel.konversiInfoModel!.alphabeticCode!.toLowerCase()}.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              viewModel.konversiInfoModel!.entity!,
              style: boldTextStyle.copyWith(
                color: orangeColor,
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              '( ${viewModel.konversiInfoModel!.alphabeticCode} )',
              style: italicTextStyle.copyWith(
                color: orangeColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            text: 'Nilai Konversi : ',
            style: regularTextStyle,
            children: [
              TextSpan(
                text:
                    '${viewModel.konversiInfoModel!.alphabeticCode} ${viewModel.conversionResultModel!.conversionResult}',
                style: boldTextStyle.copyWith(
                  color: orangeColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
