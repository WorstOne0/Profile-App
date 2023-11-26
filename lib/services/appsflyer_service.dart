// ignore_for_file: empty_catches

// Dart
import 'dart:io';
// Flutter Packages
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';

class AppsFlyerService {
  AppsFlyerService({required this.ref});

  Ref ref;

  late AppsflyerSdk appsflyerSdk;

  Future<void> initialize() async {
    try {
      String devToken = FlutterConfig.get('APPS_FLYER_DEV_TOKEN');
      String iOSAppId = "";

      AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
        afDevKey: devToken,
        appId: Platform.isIOS ? iOSAppId : "",
        showDebug: true,
        timeToWaitForATTUserAuthorization: 50,
        disableAdvertisingIdentifier: false,
        disableCollectASA: false,
      );

      appsflyerSdk = AppsflyerSdk(appsFlyerOptions);

      appsflyerSdk.onDeepLinking(onDeepLinking);

      await appsflyerSdk.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: true,
      );
    } catch (error) {}
  }

  void onDeepLinking(DeepLinkResult deepLinkResult) {
    if (deepLinkResult.status == Status.FOUND) {
      String? action = deepLinkResult.deepLink?.campaign;

      // Var 'success' just to make the switch a pattern
      // ignore: unused_local_variable
      bool success = switch (action) {
        "" => true,
        _ => false,
      };
    }
  }

  // *** Actions ***
}

final appsFlyerServiceProvider = Provider<AppsFlyerService>((ref) => AppsFlyerService(ref: ref));
