// ignore_for_file: use_build_context_synchronously

// Flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Screens
import '/pages/landing.dart';
// Services
import '/services/appsflyer_service.dart';
// Widgets
import '/widgets/create_route.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    asyncInit();
  }

  void asyncInit() async {
    // Logo show duration
    await Future.delayed(const Duration(seconds: 3));

    //
    Navigator.pushReplacement(
      context,
      createRoute(const Landing(), "landing.dart"),
    );

    // Handle DeepLink
    await ref.read(appsFlyerServiceProvider).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            "assets/images/background.jpg",
          ),
          fit: BoxFit.cover,
        )),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FractionallySizedBox(
                widthFactor: 0.7,
                child: Image.asset(
                  height: 180,
                  "assets/images/download.jpg",
                ),
              ),
              const SizedBox(height: 60),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SOLUÇÕES ",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "INTELIGENTES",
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "TELEMETRIA | RASTREAMENTO | GESTÃO DE SILOS",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
