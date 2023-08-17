// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/views/app_index_tracking/custom_currency/konversi_dialog/konversi_dialog_view.dart';

enum DialogType {
  konversiDialogView,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.konversiDialogView: (context, request, completer) =>
        KonversiDialogView(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
