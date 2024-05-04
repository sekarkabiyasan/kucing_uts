import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// Aplikasi utama yang merupakan StatelesWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Kucing Cantik'; // Judul aplikasi
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Tambahkan logika pencarian di sini
              },
            ),
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(
                image: 'img/kucing1.png', // Gambar kucing
              ),
              TitleSection(
                name: 'Kucing Manis', // Nama kucing
                location: 'Kucing Gemoy', // Lokasi kucing
              ),
              ButtonSection(), // Bagian tombol
              EditTextSection(), // Bagian edit teks
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 129, 225, 129), // Warna latar belakang
      ),
    );
  }
}

// Bagian judul yang merupakan StatelessWidget
class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name; // Nama kucing
  final String location; // Lokasi kucing

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name, // Nama kucing
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location, // Lokasi kucing
                  style: const TextStyle(
                    color: Color.fromARGB(255, 3, 2, 2),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Color.fromARGB(255, 137, 47, 211),
          ),
          const Text('100'),
        ],
      ),
    );
  }
}

// Bagian tombol yang merupakan StatelessWidget
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor; // Warna tema
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

// Tombol dengan teks yang merupakan StatelessWidget
class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color; // Warna tombol
  final IconData icon; // Icon tombol
  final String label; // Label tombol

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label, // Label tombol
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
}

// Bagian edit teks yang merupakan StatefulWidget
class EditTextSection extends StatefulWidget {
  const EditTextSection({super.key});

  @override
  State<EditTextSection> createState() => _EditTextSectionState();
}

// State dari EditTextSection
class _EditTextSectionState extends State<EditTextSection> {
  late TextEditingController _controller; // Controller untuk TextField
  late String _description; // Deskripsi kucing

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _description =
        'Selamat datang di dunia kucing kami, tempat terbaik untuk menemukan berbagai jenis kucing yang lucu dan menggemaskan!';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Fungsi untuk menyimpan teks yang diedit
  void _saveText() {
    setState(() {
      _description = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Edit Description', // Label TextField
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: _saveText, // Aksi ketika tombol ditekan
            child: const Text('Save Description'), // Label tombol
          ),
          const SizedBox(height: 20),
          Text(
            'Description: $_description', // Deskripsi kucing
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Bagian gambar yang merupakan StatelessWidget
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image; // Gambar kucing

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image, // Gambar kucing
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}
