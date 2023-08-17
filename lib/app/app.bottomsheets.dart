// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/views/app_index_tracking/custom_currency/konversi_dialog/pilih_negara_bottom_sheet/pilih_negara_bottom_sheet_view.dart';

enum BottomSheetType {
  pilihNegaraBottomSheetView,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.pilihNegaraBottomSheetView: (context, request, completer) =>
        PilihNegaraBottomSheetView(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
