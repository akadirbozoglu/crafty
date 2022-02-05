import 'package:flutter/material.dart';

class meeting extends StatefulWidget {
  const meeting({Key key}) : super(key: key);

  @override
  _meetingState createState() => _meetingState();
}

class _meetingState extends State<meeting> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String dropdownValue = 'Mayıs';
  String dropdownValue1 = '25';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                DropdownButton<String>(
                  focusColor: Colors.white,
                  value: dropdownValue,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  underline: Container(
                    height: 3,
                    color: Colors.black,
                  ),
                  items: <String>[
                    'Ocak',
                    'Şubat',
                    'Mart',
                    'Nisan',
                    'Mayıs',
                    'Haziran',
                    'Temmuz',
                    'Ağustos',
                    'Eylül',
                    'Ekim',
                    'Kasım',
                    'Aralık',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "Ay seçin",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      dropdownValue = value;
                    });
                  },
                ),
                SizedBox(
                  width: 50,
                ),
                DropdownButton<String>(
                  focusColor: Colors.white,
                  value: dropdownValue1,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  underline: Container(
                    height: 3,
                    color: Colors.black,
                  ),
                  items: <String>[
                    '18',
                    '19',
                    '21',
                    '22',
                    '23',
                    '24',
                    '25',
                    '26',
                    '27',
                    '28',
                    '29',
                    '30',
                    '31',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  hint: Text(
                    "Gün seçin",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      dropdownValue1 = value;
                    });
                  },
                ),
              ],
            ),
            Container(
              height: 4,
            ),
            Card(
              color: Colors.deepOrange[100],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 30,
                    child: const ListTile(
                      leading: Icon(Icons.article_rounded),
                      title: Text('25 Mayıs Görüşme Talebi'),
                      subtitle: Text('Saat: 9.00-10.00'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text(
                          'REZERVE ET',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.orange[100],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 30,
                    child: const ListTile(
                      leading: Icon(Icons.article_rounded),
                      title: Text('25 Mayıs Görüşme Talebi'),
                      subtitle: Text('Saat: 10.00-11.00'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text(
                          'REZERVE',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.deepOrange[100],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 30,
                    child: const ListTile(
                      leading: Icon(Icons.article_rounded),
                      title: Text('25 Mayıs Görüşme Talebi'),
                      subtitle: Text('Saat: 11.00-12.00'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text(
                          'REZERVE',
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.orange[100],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 30,
                    child: const ListTile(
                      leading: Icon(Icons.article_rounded),
                      title: Text('25 Mayıs Görüşme Talebi'),
                      subtitle: Text('Saat: 13.00-14.00'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text(
                          'REZERVE ET',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.deepOrange[100],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 30,
                    child: const ListTile(
                      leading: Icon(Icons.article_rounded),
                      title: Text('25 Mayıs Görüşme Talebi'),
                      subtitle: Text('Saat: 14.00-15.00'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text(
                          'REZERVE ET',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.orange[100],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 30,
                    child: const ListTile(
                      leading: Icon(Icons.article_rounded),
                      title: Text('25 Mayıs Görüşme Talebi'),
                      subtitle: Text('Saat: 15.00-16.00'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text(
                          'REZERVE ET',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
            Card(
              color: Colors.deepOrange[100],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 30,
                    child: const ListTile(
                      leading: Icon(Icons.article_rounded),
                      title: Text('25 Mayıs Görüşme Talebi'),
                      subtitle: Text('Saat: 16.00-17.00'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text(
                          'REZERVE ET',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
