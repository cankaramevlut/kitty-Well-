import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pati_project/mama.dart';
import 'package:pati_project/tasma.dart';
import 'package:pati_project/wc.dart';
import 'package:pati_project/home.dart';

var sayfaListesi = [const Home(), const Mama(), const Wc(), const Tasma()];
final secilenIndexProvider = StateProvider<int>((ref) => 0);

class Gezgin extends ConsumerWidget {
  const Gezgin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secilenIndex = ref.watch(secilenIndexProvider);

    return Scaffold(
      body: sayfaListesi[secilenIndex], // Seçilen sayfa buraya geliyor
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: secilenIndex,
        onTap: (index) {
          ref.read(secilenIndexProvider.notifier).state =
              index; // Sayfa değişimi
        },
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: "Mama"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service), label: "Wc"),
          BottomNavigationBarItem(
              icon: Icon(Icons.monitor_heart), label: "Tasma"),
        ],
      ),
    );
  }
}
