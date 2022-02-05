import 'package:flutter/material.dart';

class Homepagesupp extends StatefulWidget {
  const Homepagesupp({Key key}) : super(key: key);

  @override
  _HomepagesuppState createState() => _HomepagesuppState();
}

class _HomepagesuppState extends State<Homepagesupp> {
  final List<Product> productsList = [
    Product(
        name: 'Bambu',
        profileImg: 'images/kastamonu bambu.jpg',
        bio: 'sdfsdfdsfds'),
    Product(
        name: 'Akçaağaç',
        profileImg: 'images/unnamed.jpg',
        bio: 'aaaaaaaaaaaa'),
    Product(
        name: 'Klasik Ceviz', profileImg: 'images/CEVİZ.jpg', bio: 'ddddddd'),
    Product(
        name: 'Venedik Cevizi', profileImg: 'images/sign.jpg', bio: 'asdsadsa'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: new ListView.builder(
            itemCount: productsList.length,
            itemBuilder: (BuildContext context, int index) =>
                buildTripCard(context, index)),
      ),
    );
  }

  String text = 'Sipariş Ver';
  Widget buildTripCard(BuildContext context, int index) {
    final product = productsList[index];
    return new Container(
      child: Card(
        color: Colors.brown[300],
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
                        style: new TextStyle(fontSize: 27.0),
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
                            title: const Text('Siparişiniz Alınmıştır'),
                            content: const Text('Devam etmek ister misiniz?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'İptal et'),
                                child: const Text('İptal et'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Tamam');
                                  text = 'İptal et';
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
