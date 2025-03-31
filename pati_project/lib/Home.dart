import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Kedi bilgilerini tutan sınıf
class KediBilgileri {
  final double kilo;
  final int porsiyon;
  final int hareket;

  KediBilgileri({
    required this.kilo,
    required this.porsiyon,
    required this.hareket,
  });
}

// Verileri sağlayan provider
final kediBilgileriProvider = Provider<KediBilgileri>((ref) {
  // Verilerin son elemanlarını alıyoruz
  List<double> kilolar = [4.3, 4.5, 4.3, 4.8, 4.9, 4.2, 4.3, 4.5];
  List<int> porsiyonlar = [3, 2, 4, 3, 2, 3, 4, 3];
  List<int> hareketler = [80, 70, 75, 80, 85, 85, 90, 70];

  // Son verileri alıyoruz
  double sonKilo = kilolar.last;
  int sonPorsiyon = porsiyonlar.last;
  int sonHareket = hareketler.last;

  return KediBilgileri(
    kilo: sonKilo,
    porsiyon: sonPorsiyon,
    hareket: sonHareket,
  );
});

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Provider'dan kedi bilgilerini çekiyoruz
    final kediBilgileri = ref.watch(kediBilgileriProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Kitty Well',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Kedinin Fotoğrafı ve Adı
                const Column(
                  children: [
                    CircleAvatar(
                      radius: 50, // Fotoğrafın boyutu
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // Kedinin fotoğrafını buraya ekleyin
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Mia",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                // Kedinin Bilgileri
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Kilo, Porsiyon ve Hareket bilgilerini dinamik olarak alıyoruz
                      Text(
                        "Kilo: ${kediBilgileri.kilo} kg",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Porsiyon: ${kediBilgileri.porsiyon}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Hareket: %${kediBilgileri.hareket}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Sağlık Grafiği
            const Text(
              "Sağlık Grafiği",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Grafik Buraya Gelecek",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
