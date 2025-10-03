void main() {
  // membuat pola segitiga
  for (int i = 1; i <= 5; i++) {
    String baris = '';
    for (int j = 1; j <= i; j++) {
      baris += '* ';
    }
    print(baris);
  }

  print('');

  // membuat pola segitiga terbalik
  for (int i = 5; i >= 1; i--) {
    String baris = '';
    for (int j = 1; j <= i; j++) {
      baris += '* ';
    }
    print(baris);
  }
}
