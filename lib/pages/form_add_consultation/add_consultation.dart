import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:realtime_monitoring/config/configuration.dart';

class AddConsultation extends StatefulWidget {
  @override
  _AddConsultationState createState() => _AddConsultationState();
}

class _AddConsultationState extends State<AddConsultation> {
  final _controllerName = TextEditingController();
  final _controllerConsultation = TextEditingController();

  String _selectedClinic;

  List _clinic = [
    "KLINIK KESEHATAN GANDUL",
    "KLINIK KESEHATAN CINERE",
  ];

  String _selectedConsultation;

  List _consultation = [
    'Alergi',
    'Diabetes',
    'Kulit dan kelamin',
    'Gizi',
    'Kanker',
    'Kebidanan dan kandungan',
    'Gigi dan mulut',
    'Mata',
    'Seksualitas',
    'Telinga-hidung-tenggorok',
    'Tulang',
    'Kolesterol',
    'Jantung',
    'Flu',
    'Ginjal dan hati',
    'Virus',
    'Infeksi',
    'Psikologis',
    'Cedera luar',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // LOKASI KLINIK
          Container(
            width: 120,
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("LOKASI KLINIK",
                    style: GoogleFonts.openSans(
                        fontSize: 10,
                        color: blue,
                        fontWeight: FontWeight.bold)),
                DropdownButton(
                  isExpanded: true,
                  hint: (_selectedClinic == null)
                      ? Text("PILIH KLINIK")
                      : Text(_selectedClinic),
                  value: _selectedClinic,
                  items: _clinic.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedClinic = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Divider(height: 10, color: blue),

          // LOKASI KLINIK
          Container(
            width: 120,
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("JENIS KONSTULTASI",
                    style: GoogleFonts.openSans(
                        fontSize: 10,
                        color: blue,
                        fontWeight: FontWeight.bold)),
                DropdownButton(
                  isExpanded: true,
                  hint: (_selectedConsultation == null)
                      ? Text("PILIH JENIS KONSULTASI")
                      : Text(_selectedConsultation),
                  value: _selectedConsultation,
                  items: _consultation.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedConsultation = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Divider(height: 10, color: blue),

          //NAMA
          Container(
            width: 120,
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text("DATA DIRI",
                      style: GoogleFonts.openSans(
                          fontSize: 10,
                          color: blue,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),

                // NAMA
                TextField(
                  controller: _controllerName,
                  decoration: InputDecoration(
                    labelText: "Masukkan nama lengkap..",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                //KETERANGAN KELUHAN
                TextField(
                  controller: _controllerConsultation,
                  decoration: InputDecoration(
                    labelText: "Masukkan keterangan keluhan..",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: Text("KIRIM")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
