import 'dart:ui';

import 'package:flutter/material.dart';

import 'Todo.dart';
import 'database.dart';
import 'login.dart';

class profil extends StatefulWidget {
  final int userNo;
  const profil({Key key,this.userNo}) : super(key: key);

  @override
  _profilState createState() => _profilState();
}

class _profilState extends State<profil> {
  String dropdownValue;
  String dropdownValue1;
  TextEditingController emailControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();
  TextEditingController addressControl = new TextEditingController();
  int _selectedIndex = 0;
  User profiluser;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  initState()  {
    super.initState();
    _initState();
  }
    void _initState() async{
    profiluser= await getUser();
    dropdownValue = profiluser.city;
    dropdownValue1 = profiluser.ilce;
  }
  Future<User> getUser() async{
    User user= await RepositoryServiceTodo.getTodo(widget.userNo);
    return user;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orangeAccent[200],
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    '${profiluser.name}',
                    style: new TextStyle(fontSize: 28.0),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    '${profiluser.surname}',
                    style: new TextStyle(fontSize: 28.0),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 70,
                  child: TextField(
                    controller: emailControl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${profiluser.email}',
                      prefixIcon: Icon(Icons.alternate_email_rounded),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 70,
                  child: TextField(
                    controller: passwordControl,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Şifre',
                      prefixIcon: Icon(Icons.vpn_key_outlined),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                DropdownButton<String>(
                  focusColor: Colors.white,
                  value: profiluser.city,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  underline: Container(
                    height: 3,
                    color: Colors.black,
                  ),
                  items: <String>[
                    'Isparta',
                    'Mersin',
                    'İstanbul',
                    'İzmir',
                    'Kars',
                    'Kastamonu',
                    'Kayseri',
                    'Kırklareli',
                    'Kırşehir',
                    'Kocaeli',
                    'Konya',
                    'Kütahya',
                    'Malatya',
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
                    "${profiluser.city}",
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
                DropdownButton<String>(
                  focusColor: Colors.white,
                  value: profiluser.ilce,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  underline: Container(
                    height: 3,
                    color: Colors.black,
                  ),
                  items: <String>[
                    'Akkışla',
                    'Bünyan',
                    'Develi',
                    'Felahiye',
                    'Hacılar',
                    'İncesu',
                    'Kocasinan',
                    'Melikgazi',
                    'Özvatan',
                    'Pınarbaşı',
                    'Sarıoğlan',
                    'Sarız',
                    'Talas',
                    'Tomarza',
                    'Yahyalı',
                    'Yeşilhisar',
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
                    "${profiluser.ilce}",
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 70,
                  child: TextField(
                    controller: addressControl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText:
                          '${profiluser.address}',
                      prefixIcon: Icon(Icons.home_outlined),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  minWidth: 150,
                  color: Colors.deepOrange[800],
                  textColor: Colors.white,
                  disabledColor: Colors.black,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      _update();
                    });

                  },
                  child: Text(
                    "Kaydet",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  minWidth: 150,
                  color: Colors.blue[800],
                  textColor: Colors.white,
                  disabledColor: Colors.black,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.black,
                  onPressed: () {
                    setState(() {
                      _delete();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              Login(userNo: 2,)));
                    });
                  },
                  child: Text(
                    "Profili Sil",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _update()async{
    if( emailControl.text.isEmpty==true){
      await RepositoryServiceTodo.updateRaw('email',profiluser.email,widget.userNo);
    }else{
      await RepositoryServiceTodo.updateRaw('email',emailControl.text,widget.userNo);
    }
    if( passwordControl.text.isEmpty==true){
      await RepositoryServiceTodo.updateRaw('password',profiluser.password,widget.userNo);
    }else{
      await RepositoryServiceTodo.updateRaw('password',passwordControl.text,widget.userNo);
    }
    await RepositoryServiceTodo.updateRaw('city',dropdownValue,widget.userNo);
    await RepositoryServiceTodo.updateRaw('ilce',dropdownValue1,widget.userNo);
    if( addressControl.text.isEmpty==true){
      await RepositoryServiceTodo.updateRaw('address',profiluser.address,widget.userNo);
    }else{
      await RepositoryServiceTodo.updateRaw('address',addressControl.text,widget.userNo);
    }
    profiluser = await RepositoryServiceTodo.getTodo(widget.userNo);
  }
  void _delete()async{
    await RepositoryServiceTodo.deleteTodo(widget.userNo);
  }
}
