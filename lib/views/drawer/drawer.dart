import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          //header
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/bianglala.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("WAHANA SAAT INI :",
                            style: TextStyle(fontSize: 10)),
                        Text("BIANGLALA", style: TextStyle(fontSize: 13)),
                      ],
                    ),
                    IconButton(
                        icon: Icon(Icons.edit, size: 20, color: Colors.blue),
                        onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.stacked_bar_chart),
            title: Text("GANTI WAHANA SAAT INI"),
          ),
          ListTile(
            leading: Icon(Icons.switch_left),
            title: Text("GANTI JENIS ANTRIAN"),
          ),
          Divider(),
          
          ListTile(
            leading: Icon(Icons.stacked_bar_chart),
            title: Text("LIHAT SEMUA ANTRIAN"),
          ),
          Divider(),

          //akun
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("AKUN"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("PENGATURAN"),
          ),
        ],
      ),
    );
  }
}
