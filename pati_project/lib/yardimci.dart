import 'dart:io';

Future<List<List<dynamic>>> dosyadanVeriOku(String dosyaAdi) async {
  final dosya = File(dosyaAdi); // Dosyayı tanımlıyoruz
  final satirlar = await dosya.readAsLines(); // Satırları okuyoruz
  return satirlar.map((satir) {
    // Satırdaki verileri virgüle göre ayır ve uygun tipe çevir
    return satir.split(',').map((eleman) {
      return double.tryParse(eleman.trim()) ?? int.parse(eleman.trim());
    }).toList();
  }).toList();
}
