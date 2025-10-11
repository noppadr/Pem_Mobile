-- PRAKTIKUM 1: MEMBANGUN LAYOUT DI FLUTTER --
Langkah 1: Buat Project Baru
membuat sebuah project flutter baru dengan nama layout_flutter
![Langkah 1: Buat Project Baru](images/langkah01.png)

Langkah 2: Buka file lib/main.dart
![Langkah 2: Buka file lib/main.dart](images/langkah02.png)

Langkah 3: Identifikasi layout diagram

Langkah 4: Implementasi title row
membuat kolom bagian kiri pada judul
![Langkah 4: Implementasi title row](images/langkah04.png)

-- PRAKTIKUM 2: IMPLEMENTASI BUTTON ROW --
Langkah 1: Buat method Column _buildButtonColumn
![Langkah 1: Buat method Column _buildButtonColumn](images/prak2-langkah1.png)

Langkah 2: Buat widget buttonSection
![Langkah 2: Buat widget buttonSection](images/prak2-langkah2.png)

Langkah 3: Tambah button section ke body
![Langkah 3: Tambah button section ke body](images/prak2-langkah3.png)


-- PRAKTIKUM 3: IMPLEMENTASI TEXT SECTION --
Langkah 1: Buat widget textSection
memasukkan teks ke dalam Container dan menambahkan padding di sepanjang setiap tepinya
![Langkah 1: Buat widget textSection](images/prak2-langkah1.png)

Langkah 2: Tambah variabel text section ke body
![Langkah 2: Tambah variabel text section ke body](images/prak3-langkah2.png)

-- PRAKTIKUM 4: IMPLEMENTASI IMAGE SECTION --
Langkah 1: Menyiapkan aset gambar
membuat folder images di root project layout_flutter. Memasukkan file gambar tersebut ke folder images, lalu set nama file tersebut ke file pubspec.yaml
![Langkah 1: Menyiapkan aset gambar](images/prak4-langkah1.png)

Langkah 2: Tambahkan gambar ke body
menambahkan aset gambar ke dalam body
![Langkah 2: Tambahkan gambar ke body](images/prak4-langkah2.png)

Langkah 3: Ubah menjadi ListView
semua elemen diatur dalam ListView, bukan Column, karena ListView mendukung scroll yang dinamis saat aplikasi dijalankan pada perangkat yang resolusinya lebih kecil.
![Langkah 3: Ubah menjadi ListView](images/prak4-langkah3.png)







