// ignore_for_file: use_build_context_synchronously

// Flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Screens
import '/pages/landing.dart';
// Services
import '/services/appsflyer_service.dart';
// Widgets
import '/widgets/responsive/create_route.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  double authorOpacity = 1, nameOpacity = 1;

  @override
  void initState() {
    super.initState();

    asyncInit();
    handleOpacityAnimation();
  }

  void asyncInit() async {
    await Future.delayed(const Duration(milliseconds: 2800));

    Navigator.pushReplacement(
      context,
      createRoute(const Landing(), "landing.dart"),
    );

    // Handle DeepLink
    await ref.read(appsFlyerServiceProvider).initialize();
  }

  void handleOpacityAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() => authorOpacity = 0);
    await Future.delayed(const Duration(milliseconds: 400));
    setState(() => nameOpacity = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(),
          AnimatedOpacity(
            opacity: authorOpacity,
            duration: const Duration(seconds: 1),
            child: const Text(
              "Lucca Gabriel",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w200,
                letterSpacing: 2,
              ),
            ),
          ),
          const SizedBox(height: 10),
          AnimatedOpacity(
            opacity: nameOpacity,
            duration: const Duration(seconds: 1),
            child: const Text(
              "PORTIFOLIO",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
