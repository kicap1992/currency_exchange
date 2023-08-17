import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../app/app.router.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_text.dart';
import './app_index_tracking_view_model.dart';

class AppIndexTrackingView extends StatelessWidget {
  const AppIndexTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppIndexTrackingViewModel>.reactive(
      viewModelBuilder: () => AppIndexTrackingViewModel(),
      onViewModelReady: (AppIndexTrackingViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        AppIndexTrackingViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                model.header,
                style: boldTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            backgroundColor: mainColor,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ExtendedNavigator(
              navigatorKey: StackedService.nestedNavigationKey(3),
              router: AppIndexTrackingViewRouter(),
              // initialRoute: AppIndexTrackingViewRoutes.danaSosialAdminView,
            ),
          ),
          bottomNavigationBar: StylishBottomBar(
            items: [
              for (var item in model.bottomNavBarList)
                BottomBarItem(
                  icon: Icon(item['icon'],
                      color: model.currentIndex ==
                              model.bottomNavBarList.indexOf(item)
                          ? mainColor
                          : backgroundColor),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item['name'],
                      style: regularTextStyle.copyWith(
                        color: model.currentIndex ==
                                model.bottomNavBarList.indexOf(item)
                            ? mainColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                  backgroundColor:
                      model.currentIndex == model.bottomNavBarList.indexOf(item)
                          ? Colors.white
                          : Colors.grey,
                ),
            ],
            currentIndex: model.currentIndex,
            hasNotch: true,
            backgroundColor: mainColor,
            onTap: (value) {
              model.handleNavigation(value);
            },
            option: BubbleBarOptions(
                barStyle: BubbleBarStyle.horizotnal,
                bubbleFillStyle: BubbleFillStyle.fill,
                opacity: 0.3),
          ),
        );
      },
    );
  }
}
