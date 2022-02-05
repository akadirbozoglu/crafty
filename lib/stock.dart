import 'package:flutter/material.dart';
import 'stockmeet.dart';
import 'stockorder.dart';
import 'stockraw.dart';
import 'stockstock.dart';

class Stock extends StatefulWidget {
  @override
  _StockState createState() => _StockState();
}

class _StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Crafty Home",
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Crafty Home')),
          backgroundColor: Colors.brown[900],
        ),
        body: ListView(children: <Widget>[
          Card(
              child: ListTile(
            leading: Icon(Icons.storefront_sharp),
            title: Text('Stoklar'),
            trailing: Icon(Icons.navigate_next_rounded),
            subtitle: Text(
                'Mevcut stoklardaki malzeme ve üretilmiş şeyleri listeler'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StockStock()));
            },
            isThreeLine: true,
          ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.payments),
              title: Text('Siparişler'),
              trailing: Icon(Icons.navigate_next_rounded),
              subtitle: Text(
                  'Müşteri tarafından sipariş edilen malzemeleri listeler'),
              isThreeLine: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StockOrder()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.shopping_bag_rounded),
              title: Text('Tedarik'),
              trailing: Icon(Icons.navigate_next_rounded),
              subtitle:
                  Text('Tedarik talebi oluşturulan malzemeleri listeler.'),
              isThreeLine: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StockRaw()));
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.group),
              title: Text('Toplantılar'),
              trailing: Icon(Icons.navigate_next_rounded),
              subtitle: Text('Tedarik toplantılarını listeler.'),
              isThreeLine: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DynamicEvent()));
              },
            ),
          )
        ]),
      ),
    );
  }
}
