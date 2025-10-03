void main() {
  List<Map<String, dynamic>> riwayat = [];

  // simulasi beberapa input
  hitungBMI(170, 65, riwayat);
  hitungBMI(165, 75, riwayat);
  hitungBMI(180, 85, riwayat);

  // tampilkan riwayat menggunakan perulangan
  tampilkanRiwayat(riwayat);
}
void hitungBMI(
  double tinggiCm,
  double beratKg,
  List<Map<String, dynamic>> riwayat,
) {
  // konversi tinggi dari cm ke m
  double tinggiM = tinggiCm / 100;

  // hitung BMI
  double bmi = beratKg / (tinggiM * tinggiM);

}
