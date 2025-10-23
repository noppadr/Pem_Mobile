import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  final String ocrText;
  const ResultScreen({super.key, required this.ocrText});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late FlutterTts flutterTts;
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _initializeTts();
  }

  Future<void> _initializeTts() async {
    flutterTts = FlutterTts();

    // Set bahasa ke Bahasa Indonesia
    await flutterTts.setLanguage("id-ID");

    // Konfigurasi tambahan (opsional)
    await flutterTts.setSpeechRate(0.5); // Kecepatan bicara (0.0 - 1.0)
    await flutterTts.setVolume(1.0); // Volume (0.0 - 1.0)
    await flutterTts.setPitch(1.0); // Nada suara (0.5 - 2.0)

    // Listener untuk mendeteksi status pembacaan
    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        isSpeaking = false;
      });
    });
  }

  Future<void> _speakText() async {
    if (widget.ocrText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak ada teks untuk dibacakan')),
      );
      return;
    }

    if (isSpeaking) {
      // Jika sedang berbicara, hentikan
      await flutterTts.stop();
      setState(() {
        isSpeaking = false;
      });
    } else {
      // Mulai membacakan teks
      setState(() {
        isSpeaking = true;
      });
      await flutterTts.speak(widget.ocrText);
    }
  }

  @override
  void dispose() {
    // Hentikan TTS dan bersihkan resource
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil OCR'),
        actions: [
          IconButton(
            icon: Icon(
              isSpeaking ? Icons.stop : Icons.volume_up,
              color: isSpeaking ? Colors.red : null,
            ),
            onPressed: _speakText,
            tooltip: isSpeaking ? 'Hentikan Pembacaan' : 'Bacakan Teks',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SelectableText(
            widget.ocrText.isEmpty
                ? 'Tidak ada teks ditemukan.'
                : widget.ocrText,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'speak',
            onPressed: _speakText,
            backgroundColor: isSpeaking ? Colors.red : null,
            child: Icon(isSpeaking ? Icons.stop : Icons.volume_up),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'home',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
                (route) => false,
              );
            },
            child: const Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
