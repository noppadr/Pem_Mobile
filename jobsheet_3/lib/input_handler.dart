import 'dart:io';

/// membaca input angka dari user dan melakukan validasi
int bacaInputAngka(String pesan) {
  while (true) {
    stdout.write(pesan);
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("Input tidak boleh kosong!");
      continue;
    }

    int? angka = int.tryParse(input);
    if (angka == null) {
      print("Masukkan angka yang valid!");
      continue;
    }

    return angka;
  }
}


