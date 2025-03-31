import 'package:flutter/material.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qr extends StatelessWidget {
  const Qr({super.key});

  // Wi-Fi bilgilerini alıp QR kodu için bir veri döndüren fonksiyon
  Future<String> getWifiInfo() async {
    String? ssid =
        await WifiInfo().getWifiName(); // Bağlı olunan Wi-Fi ağının adı (SSID)
    String password =
        "your_wifi_password"; // Wi-Fi şifresini burada alabilirsiniz, statik bir değer de kullanabilirsiniz
    return 'WIFI:T:WPA;S:$ssid;P:$password;;'; // Wi-Fi bilgilerini içeren QR kodu verisi
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kitty Well',
          style: TextStyle(fontWeight: FontWeight.bold), // Başlık metni kalın
        ),
        centerTitle: true, // AppBar başlığını ortalar
        backgroundColor:
            const Color.fromARGB(255, 4, 155, 255), // AppBar arka plan rengi
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: getWifiInfo(), // Wi-Fi bilgilerini alıyoruz
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Bir hata oluştu');
            } else {
              String qrData = snapshot.data ??
                  "Wi-Fi bilgisi alınamadı"; // QR kodu için veri

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Ortalamak için ekledim
                children: [
                  const Text(
                    'Oluşturulan QR Kodu Kameraya Okutunuz',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold, // Yazıları kalın yapıyoruz
                    ),
                  ),
                  const SizedBox(height: 20),
                  // QR kodu gösteriyoruz
                  QrImageView(
                    data: qrData, // 'data' parametresi
                    version: QrVersions.auto,
                    size: 300.0,
                  ),
                  const SizedBox(height: 20),
                  // Wi-Fi bilgilerini metin olarak gösteriyoruz
                  Text(
                    'Bağlı olduğunuz Wi-Fi: ${snapshot.data}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold, // Wi-Fi metnini kalın yapıyoruz
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
      backgroundColor: Colors.white, // Sayfa arka plan rengi
    );
  }
}
