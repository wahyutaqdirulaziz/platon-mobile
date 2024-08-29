part of 'splash.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
      Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 191,
                height: 191,
                child: Image.network(
                    "https://platon.co.id/_next/image?url=%2FGlobalLogo.png&w=256&q=75")),
          ],
        ),
      ),
    );
  }
}
