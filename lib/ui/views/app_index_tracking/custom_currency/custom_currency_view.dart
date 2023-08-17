import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SvgPicture.asset(
                    'assets/flags_svg/${viewModel.currencyInfoModel!.alphabeticCode!.toLowerCase()}.svg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    placeholderBuilder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SvgPicture.asset(
                    'assets/flags_svg/${viewModel.konversiInfoModel!.alphabeticCode!.toLowerCase()}.svg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    placeholderBuilder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
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
                              viewModel
                                  .conversionResultModel!.timeLastUpdateUnix!),
                          style: boldTextStyle.copyWith(
                            color: greenColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Update berikutnya : ',
                      style: regularTextStyle,
                      children: [
                        TextSpan(
                          text: viewModel.otherFunction.timeStampConverter(
                              viewModel
                                  .conversionResultModel!.timeNextUpdateUnix!),
                          style: boldTextStyle.copyWith(
                            color: mainColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.error,
                            color: redColor,
                          );
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          viewModel.currencyInfoModel!.entity!,
                          style: boldTextStyle.copyWith(
                            color: redColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Text(
                          '( ${viewModel.currencyInfoModel!.alphabeticCode} )',
                          style: italicTextStyle.copyWith(
                            color: redColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
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
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Konversi Tukaran : ',
                      style: regularTextStyle,
                      children: [
                        TextSpan(
                          text:
                              '1 ${viewModel.currencyInfoModel!.alphabeticCode}',
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
                    height: 15,
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
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.error,
                          color: orangeColor,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          viewModel.konversiInfoModel!.entity!,
                          style: boldTextStyle.copyWith(
                            color: orangeColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Text(
                          '( ${viewModel.konversiInfoModel!.alphabeticCode} )',
                          style: italicTextStyle.copyWith(
                            color: orangeColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
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
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: Text(
              'Sila Klik Icon Untuk\nKonversi Tukaran Mata Uang',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
