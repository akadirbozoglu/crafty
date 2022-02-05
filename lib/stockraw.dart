import 'package:flutter/material.dart';

class StockRaw extends StatefulWidget {
  const StockRaw({Key key}) : super(key: key);

  @override
  _StockRawState createState() => _StockRawState();
}

class _StockRawState extends State<StockRaw> {
  final List<Product> productsList = [
    Product(
        name: 'Tahta',
        profileImg: 'images/tahta.jpg',
        bio: '150 adet sipariş edildi'),
    Product(
        name: 'Sunta',
        profileImg: 'images/sunta.jpg',
        bio: '100 adet sipariş edildi'),
    Product(
        name: 'Plymouth',
        profileImg: 'images/plywood.png',
        bio: '200 adet sipariş edildi'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Crafty Home'),
        backgroundColor: Colors.brown[900],
      ),
      body: Container(
        child: new ListView.builder(
            itemCount: productsList.length,
            itemBuilder: (BuildContext context, int index) =>
                buildTripCard(context, index)),
      ),
    );
  }

  String text = 'Durum';
  Widget buildTripCard(BuildContext context, int index) {
    final product = productsList[index];
    return new Container(
      child: Card(
        color: Colors.brown[200],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                child: Row(children: <Widget>[
                  Container(
                    height: (MediaQuery.of(context).size.height) / 4,
                    width: (MediaQuery.of(context).size.width) / 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(product.profileImg),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6), BlendMode.dstATop),
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        product.name,
                        style: new TextStyle(fontSize: 28.0),
                      ),
                      Text(product.bio),
                      FlatButton(
                        color: Colors.deepOrange,
                        child: Text(
                          text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Sipariş detayları'),
                            content: Column(
                              children: const <Widget>[
                                Flexible(
                                    child: ListTile(
                                        title: Text(
                                            'Tedarikçi: İstanbul Ticaret'))),
                                Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.home),
                                    title: Text(
                                        'Adres: Organize San. Böl. 6.Cadde ( Gulf Petrol Yanı, 38070 Melikgazi'),
                                  ),
                                ),
                                Flexible(
                                  child: ListTile(
                                    title: Text('Taşımada'),
                                    trailing: Icon(Icons.local_shipping),
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Siparişi iptal et'),
                                child: const Text('Siparişi iptal et'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Tamam');
                                  text = 'Siparişi iptal et';
                                },
                                child: const Text('Tamam'),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  String name;
  String profileImg;
  String bio;

  Product({this.name, this.profileImg, this.bio});
}
