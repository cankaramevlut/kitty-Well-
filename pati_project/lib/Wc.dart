import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Wc extends ConsumerWidget {
  const Wc({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Kitty Well',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Yazıyı kalın yapar
            color: Colors.black, // Yazı rengini siyah yapar
          ),
        ),
        centerTitle: true, // Başlığı ortalar
      ),
      body: const Center(
        child: Text('Merhaba'),
      ),
    );
  }
}
