import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/themes/app_colors.dart';
import '../../../../widgets/my_textformfield.dart';
import './konversi_dialog_view_model.dart';

class KonversiDialogView extends StatelessWidget {
  // final bool isKonversi;
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const KonversiDialogView({
    Key? key,
    // this.isKonversi = false,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<KonversiDialogViewModel>.reactive(
      viewModelBuilder: () => KonversiDialogViewModel(),
      onViewModelReady: (KonversiDialogViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        KonversiDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: model.currencyWidget == null
                          ? const Text('- Pilih Mata Uang -')
                          : model.currencyWidget!,
                    ),
                    IconButton(
                      onPressed: () {
                        model.pilihNegara(true);
                      },
                      icon: const Icon(Icons.edit, color: mainColor),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MyTextFormField(
                  hintText: model.hintText ?? 'Pilih Mata Uang Konversi',
                  keyboardType: TextInputType.number,
                  controller: model.nilaiTukaranController,
                  focusNode: model.nilaiTukaranFocusNode,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: model.konversiWidget == null
                            ? const Text('- Pilih Mata Uang -')
                            : model.konversiWidget!),
                    IconButton(
                      onPressed: () {
                        model.pilihNegara(false);
                      },
                      icon: const Icon(Icons.edit, color: mainColor),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      model.konversi(completer);
                    },
                    child: const Text('Konversi'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
