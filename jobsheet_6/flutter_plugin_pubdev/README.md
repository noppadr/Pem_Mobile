# Manajemen Plugin - Flutter Project

A new Flutter project.

Mata Kuliah : Pemrograman Mobile Week 6

Nama       : Nova Diana Ramadhan
Kelas      : SIB 3D  
No Absen   : 19

---

## Praktikum 1
**Langkah 1: Membuat project baru**
![Screenshot](images/langkah01.png)

**Langkah 2: Menambahkan Plugin**
Menambahkan plugin auto_size_text
![Screenshot](images/langkah02.png)

**Langkah 3: Membuat file red_text_widget.dart**
![Screenshot](images/langkah03.png)

**Langkah 4: Tambah Widget AutoSizeText**
![Screenshot](images/langkah04.png)
Terjadi error karena:
1. Widget AutoSizeText belum diimport sehingga flutter tidak mengenali widget tersebut karena berasal dari package external auto_size_text
2. Variable text belum dideklarasikan sedangkan sudah memanggil text, tetapi kelas RedTextWidget tidak memiliki parameter bernama text, sehingga flutter tidak tahu nilai apa yang harus ditampilkan

Mengatasi error dengan mengubah kode menjadi seperti berikut:
![Screenshot](images/langkah4.1.png)

**Langkah 5: Buat Variabel text dan parameter di constructor**
![Screenshot](images/langkah05.png)

**Langkah 6: Menambahkan widget di main.dart**
![Screenshot](images/Langkah06.png)

Run aplikasi tersebut dan hasilnya akan seperti berikut
![Screenshot](images/Langkah6.1.png)


## TUGAS PRAKTIKUM
1. Selesaikan Praktikum tersebut, lalu dokumentasikan dan push ke repository Anda berupa screenshot hasil pekerjaan beserta penjelasannya di file README.md!
2. Jelaskan maksud dari langkah 2 pada praktikum tersebut!
Jawab: Langkah ke-2 bertujuan untuk menambahkan plugin eksternal bernama auto_size_text pada aplikasi flutter ini. Plugin ini digunakan untuk membuat teks yang dapat menyesuaikan ukurannya dengan ukuran layar perangkat yang digunakan. Dengan menggunakan plugin ini, teks yang ditampilkan pada aplikasi akan lebih mudah dibaca dan lebih menarik bagi pengguna.
3. Jelaskan maksud dari langkah 5 pada praktikum tersebut!
Jawab: Langkah ke-5 bertujuan untuk membuat variabel text dan parameter di constructor. Variabel text digunakan untuk menyimpan teks yang akan ditampilkan pada aplikasi, sedangkan parameter di constructor digunakan untuk mengatur nilai awal dari variabel text. Dengan menggunakan parameter di constructor, kita dapat mengatur nilai awal dari variabel text saat objek dari kelas ini dibuat.
4. Pada langkah 6 terdapat dua widget yang ditambahkan, jelaskan fungsi dan perbedaannya!
Jawab: Dua container tersebut memiliki fungsi yang sama yaitu sebagai wadah tampilan, namun berbeda dalam isi dan tampilannya
- Container kuning berisi RedTextWidget, yaitu widget kustom yang menampilkan teks berwarna merah.
- Container hijau berisi Text, yaitu widget bawaan Flutter untuk menampilkan teks biasa.
5. Jelaskan maksud dari tiap parameter yang ada di dalam plugin auto_size_text berdasarkan tautan pada dokumentasi ini !
- text : Teks yang akan ditampilkan pada widget.
- style : Style teks yang akan ditampilkan pada widget, mengatur tampilan teks (warna, ukuran font, tebal, dll)
- maxLines : Jumlah maksimal baris teks yang dapat ditampilkan pada widget. Jika teks melebihi jumlah baris ini, teks akan dipotong dan ditambahkan tanda tanda "..." di akhir.
- overflow : Menentukan tindakan yang diambil ketika teks melebihi batas baris yang ditentukan oleh maxLines. Nilai yang dapat diisi adalah TextOverflow.clip, TextOverflow.ellipsis, atau TextOverflow.fade.
6. Kumpulkan laporan praktikum Anda berupa link repository GitHub kepada dosen!