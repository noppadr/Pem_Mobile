import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Prak 1 - Langkah 4: Implementasi title row
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /* soal 1 */
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* soal 2 */
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Wisata Gunung di Batu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          /* soal 3 */
          const Icon(Icons.star, color: Colors.red),
          const Text('41'),
        ],
      ),
    );

    // Prak 2 - Langkah 2: widget buttonSection
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Prak 3 - Langkah 1: buat widget textSection
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Gunung Bromo merupakan salah satu destinasi gunung favorit di Jawa Timur '
        'bagi para pencinta alam dan wisata petualangan. Dengan ketinggian sekitar 2.329 meter di atas permukaan laut, '
        'gunung ini menawarkan panorama kawah aktif yang menakjubkan serta pemandangan lautan pasir dan pegunungan sekitarnya. '
        'Akses menuju kawasan Bromo relatif mudah, dan wisatawan dapat menikmati keindahan matahari terbit dari Penanjakan '
        'dengan perjalanan singkat menggunakan jeep atau berjalan kaki. '
        'Wisata ini sangat cocok bagi mereka yang ingin merasakan keindahan alam vulkanik tanpa pendakian berat. '
        '\n\nDibuat oleh: Nova Diana Ramadhan (2341760104)',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Nova Diana Ramadhan (2341760104)',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo')),
        // Ganti body menjadi titleSection
        // Prak 2 - Langkah 3: tambah body dengan buttonSection
        // Prak 3 - Langkah 2: tambah body dengan textSection
        body: Column(
          children: [
            // Prak 4 - Langkah 2: menambahkan aset gambar ke dalam body
            Image.asset(
              'images/sea.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

// Prak 2 - Langkah 1: Implementasi button row
Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}
