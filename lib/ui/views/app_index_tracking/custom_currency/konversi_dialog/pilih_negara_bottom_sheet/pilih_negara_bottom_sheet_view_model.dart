import '../../../../../../app/app.logger.dart';
import '../../../../../../app/core/custom_base_view_model.dart';

class PilihNegaraBottomSheetViewModel extends CustomBaseViewModel {
  final log = getLogger('PilihNegaraBottomSheetViewModel');
  Future<void> init(data) async {
    // log.i(globalVar.allInfoModel);
    log.i(data['bool']);
  }
}
