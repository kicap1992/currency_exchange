import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './loading_screen_view_model.dart';

class LoadingScreenView extends StatelessWidget {
  const LoadingScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoadingScreenViewModel>.reactive(
      viewModelBuilder: () => LoadingScreenViewModel(),
      onViewModelReady: (LoadingScreenViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        LoadingScreenViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
