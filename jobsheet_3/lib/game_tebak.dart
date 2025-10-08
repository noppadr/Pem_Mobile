import 'dart:math';
import 'input_handler.dart';
import 'utils.dart';
class GameTebakAngka {
  final int angkaRahasia;
  int percobaan = 0;

  GameTebakAngka() : angkaRahasia = Random().nextInt(100) + 1;

  void mulai() {
    tampilkanIntro();

    int tebakan = 0;

    while (tebakan != angkaRahasia) {
      tebakan = bacaInputAngka("Masukkan tebakan Anda: ");
      percobaan++;

      if (tebakan == angkaRahasia) {
        print("Selamat! Anda berhasil menebak angka $angkaRahasia dalam $percobaan percobaan.");
        break;
      }

      tampilkanPetunjuk(tebakan, angkaRahasia);
    }
  }
}
