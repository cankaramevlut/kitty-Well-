import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pati_project/constant/constant.dart';
import 'package:pati_project/splash.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Kitty Well',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Constant.beyaz),
      home: const Splash(),
    );
  }
}
