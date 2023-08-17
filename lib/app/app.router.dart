// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:curreny_exchange/ui/views/app_index_tracking/app_index_tracking_view.dart'
    as _i3;
import 'package:curreny_exchange/ui/views/app_index_tracking/custom_currency/custom_currency_view.dart'
    as _i7;
import 'package:curreny_exchange/ui/views/app_index_tracking/today_currency/today_currency_view.dart'
    as _i6;
import 'package:curreny_exchange/ui/views/loading_screen/loading_screen_view.dart'
    as _i5;
import 'package:curreny_exchange/ui/views/splash_screen/splash_screen_view.dart'
    as _i2;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const splashScreenView = '/';

  static const appIndexTrackingView = '/app-index-tracking-view';

  static const all = <String>{
    splashScreenView,
    appIndexTrackingView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i2.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.appIndexTrackingView,
      page: _i3.AppIndexTrackingView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.AppIndexTrackingView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.AppIndexTrackingView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AppIndexTrackingViewRoutes {
  static const loadingScreenView = '';

  static const todayCurrencyView = 'today-currency-view';

  static const customCurrencyView = 'custom-currency-view';

  static const all = <String>{
    loadingScreenView,
    todayCurrencyView,
    customCurrencyView,
  };
}

class AppIndexTrackingViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      AppIndexTrackingViewRoutes.loadingScreenView,
      page: _i5.LoadingScreenView,
    ),
    _i1.RouteDef(
      AppIndexTrackingViewRoutes.todayCurrencyView,
      page: _i6.TodayCurrencyView,
    ),
    _i1.RouteDef(
      AppIndexTrackingViewRoutes.customCurrencyView,
      page: _i7.CustomCurrencyView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i5.LoadingScreenView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoadingScreenView(),
        settings: data,
      );
    },
    _i6.TodayCurrencyView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.TodayCurrencyView(),
        settings: data,
      );
    },
    _i7.CustomCurrencyView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.CustomCurrencyView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAppIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.appIndexTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedLoadingScreenViewInAppIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AppIndexTrackingViewRoutes.loadingScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedTodayCurrencyViewInAppIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AppIndexTrackingViewRoutes.todayCurrencyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedCustomCurrencyViewInAppIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AppIndexTrackingViewRoutes.customCurrencyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAppIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.appIndexTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedLoadingScreenViewInAppIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(AppIndexTrackingViewRoutes.loadingScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedTodayCurrencyViewInAppIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(AppIndexTrackingViewRoutes.todayCurrencyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedCustomCurrencyViewInAppIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(AppIndexTrackingViewRoutes.customCurrencyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
