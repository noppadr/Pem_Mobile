import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'result_screen.dart';

late List<CameraDescription> cameras;

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  // Ubah _controller menjadi nullable (bisa null)
  CameraController? _controller;
  // Ini adalah Future yang akan kita tunggu
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Panggil _initCamera dan simpan Future-nya
    _initializeControllerFuture = _initCamera();
  }

  // _initCamera sekarang mengembalikan Future<void>
  Future<void> _initCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras.isEmpty) {
        throw Exception('No cameras found');
      }
      
      _controller = CameraController(
        cameras[0], // Gunakan kamera utama
        ResolutionPreset.medium,
        enableAudio: false, // Matikan audio jika tidak perlu
      );
      
      // Initialize controller dan tunggu sampai selesai
      await _controller!.initialize();

    } catch (e) {
      // Jika error, Future-nya akan melempar error
      debugPrint('Error initializing camera: $e');
      rethrow; // Lempar ulang error agar FutureBuilder bisa menangkapnya
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<String> _ocrFromFile(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    textRecognizer.close();
    return recognizedText.text;
  }

  Future<void> _takePicture() async {
    // Kita tidak perlu 'await _initializeControllerFuture' di sini
    // karena FutureBuilder sudah menjamin _controller-nya siap.

    // Cukup pastikan _controller tidak null
    if (_controller == null) return;

    try {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Memproses OCR, mohon tunggu...'),
          duration: Duration(seconds: 2),
        ),
      );

      final XFile image = await _controller!.takePicture();
      final ocrText = await _ocrFromFile(File(image.path));

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(ocrText: ocrText),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saat mengambil / memproses foto: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Gunakan FutureBuilder untuk "menunggu" inisialisasi
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        
        // --- 1. Saat Masih Loading ---
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // --- 2. Jika Gagal Inisialisasi ---
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error Kamera')),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                // Tampilkan pesan error ke user!
                child: Text('Gagal menginisialisasi kamera: ${snapshot.error}. Coba restart aplikasi atau HP Anda.'),
              ),
            ),
          );
        }

        // --- 3. Jika Sukses ---
        // Baru tampilkan kamera jika sudah 100% siap
        return Scaffold(
          appBar: AppBar(title: const Text('Kamera OCR')),
          body: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: CameraPreview(_controller!),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  onPressed: _takePicture,
                  icon: const Icon(Icons.camera),
                  label: const Text('Ambil Foto & Scan'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}