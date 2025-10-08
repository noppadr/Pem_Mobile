void tampilkanIntro() {
  print("=== Game Tebak Angka ===");
  print("Saya sudah memilih angka antara 1 sampai 100.");
  print("Coba tebak!");
}

void tampilkanPetunjuk(int tebakan, int angkaRahasia) {
  if (tebakan < angkaRahasia) {
    print("Terlalu kecil! Coba lagi.\n");
  } else if (tebakan > angkaRahasia) {
    print("Terlalu besar! Coba lagi.\n");
  }
}


