import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pati_project/constant/constant.dart';
import 'package:pati_project/gezgin.dart';

// Bir Provider tanımlayarak Riverpod ile state yönetimi ekleyebiliriz.
final splashScreenProvider = StateProvider<bool>((ref) => true);

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  ConsumerState<Splash> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      // Splash ekranını bitirmek için provider güncelleniyor
      ref.read(splashScreenProvider.notifier).state = false;
      // Ana sayfaya yönlendirme
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Gezgin()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.beyaz,
      body: Center(
        child: Image.asset('assets/images/intro.png'),
      ),
    );
  }
}
