import 'package:flutter/material.dart';
import 'package:realtime_monitoring/views/user_access/login/login.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Support(
          content: "Tentang Aplikasi Laporan Pengaduan",
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false);
          },
          child: Support(
            content: "Logout",
          ),
        ),
      ],
    );
  }
}

class Support extends StatelessWidget {
  final String content;
  const Support({
    Key key,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ],
    );
  }
}
