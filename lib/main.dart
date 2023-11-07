import 'package:flutter/material.dart'; 
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};
  MainApp({super.key}) {
    biodata['name'] = 'Aurora Borealis';
    biodata['email'] = 'aurora@borealis.com';
    biodata['phone'] = '+6282329302137';
    biodata['image'] = 'AURORA.png';
    biodata['hobby'] = 'Menyebar';
    biodata['addr'] = 'Antartica';
    biodata['desc'] =
        'Aurora atau cahaya kutub adalah fenomena alam yang menghasilkan pancaran cahaya yang menyala-nyala dan menari-nari di langit malam pada lapisan ionosfer dari sebuah planet sebagai akibat adanya interaksi antara medan magnetik yang dimiliki planet tersebut dengan partikel bermuatan yang dipancarkan oleh Matahari (angin surya).Fenomena ini hanya bisa dinikmati di negara yang jauh dari garis khatulistiwa, salah satu negara yang fenomena alamnya bagus untuk dilihat adalah Selandia Baru. Di bumi, aurora terjadi di daerah di sekitar Kutub Utara dan Kutub Selatan magnetiknya. Aurora yang ada di langit bagian kutub selatan disebut Aurora Australis, sedangkan Aurora yang ada di langit bagian kutub utara bumi disebut Aurora Borealis';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(title: const Text("Aplikasi Biodata")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            teksKotak(Colors.blueAccent, biodata['name'] ?? ''),
            Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
            SizedBox(height: 10),
            Row(
              children: [
                btnContact(Icons.alternate_email, Colors.cyan[700],
                    "mailto:${biodata['email']}"),
                btnContact(Icons.mark_email_unread_rounded, Colors.lightBlue,
                    "https://wa.me/${biodata['phone']}"),
                btnContact(
                    Icons.phone, Colors.purple, "tel:${biodata['phone']}")
              ],
            ),
            SizedBox(height: 10),
            textAttribute("Hobby", biodata['hobby'] ?? ''),
            textAttribute("Alamat", biodata['addr'] ?? ''),
            SizedBox(height: 10),
            teksKotak(Colors.black12, 'Deskripsi'),
            SizedBox(height: 10),
            Text(
              biodata['desc'] ?? '',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            )
          ]),
        ),
      ),
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        teks,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
      ),
    );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
      children: [
        Container(
          width: 80,
          child: Text("-$judul",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        Text(":", style: TextStyle(fontSize: 18)),
        Text(teks, style: TextStyle(fontSize: 18)),
      ],
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }

  void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil: $uri');
    }
  }
}
