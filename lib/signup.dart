import 'package:flutter/material.dart';
import 'login.dart';
import 'database.dart';
import 'Todo.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameControl = new TextEditingController();
  TextEditingController surnameControl = new TextEditingController();
  TextEditingController emailControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();
  TextEditingController addressControl = new TextEditingController();
  String dropdownValue;
  String dropdownValue1;
  String dropdownValue2;
  int atribute;

  //final _formKey = GlobalKey<FormState>();
  Future<List<User>> future;
  int id;

  @override
  initState() {
    super.initState();
    future = RepositoryServiceTodo.getAllTodos();
  }

  void createTodo() async {
    /*if (_formKey.currentState.validate()) {
      _formKey.currentState.save();*/
      int count = await RepositoryServiceTodo.todosCount()+1;
      final todo = User(count, nameControl.text, surnameControl.text, emailControl.text,
          passwordControl.text, dropdownValue, dropdownValue1, addressControl.text, dropdownValue2);
      await RepositoryServiceTodo.addTodo(todo);
      setState(() {
        id = todo.id;
        future = RepositoryServiceTodo.getAllTodos();
      });
   // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Crafty Home'),
        backgroundColor: Colors.brown[900],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/login.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.6), BlendMode.dstATop))),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 70,
                child: TextField(
                  controller: nameControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '??sim',
                    prefixIcon: Icon(Icons.account_circle_outlined),
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
              Container(
                width: 300,
                height: 70,
                child: TextField(
                  controller: surnameControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Soyisim',
                    prefixIcon: Icon(Icons.account_circle_outlined),
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
              Container(
                width: 300,
                height: 70,
                child: TextField(
                  controller: emailControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-posta Adresi',
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
              Container(
                width: 300,
                height: 70,
                child: TextField(
                  controller: passwordControl,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '??ifre',
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
                value: dropdownValue,
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
                  '??stanbul',
                  '??zmir',
                  'Kars',
                  'Kastamonu',
                  'Kayseri',
                  'K??rklareli',
                  'K??r??ehir',
                  'Kocaeli',
                  'Konya',
                  'K??tahya',
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
                  "??ehir se??in",
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
                value: dropdownValue1,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                underline: Container(
                  height: 3,
                  color: Colors.black,
                ),
                items: <String>[
                  'Akk????la',
                  'B??nyan',
                  'Develi',
                  'Felahiye',
                  'Hac??lar',
                  '??ncesu',
                  'Kocasinan',
                  'Melikgazi',
                  '??zvatan',
                  'P??narba????',
                  'Sar??o??lan',
                  'Sar??z',
                  'Talas',
                  'Tomarza',
                  'Yahyal??',
                  'Ye??ilhisar',
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
                  "??l??e Se??in",
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
              Container(
                width: 300,
                height: 70,
                child: TextField(
                  controller: addressControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adres',
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
              DropdownButton<String>(
                focusColor: Colors.white,
                value: dropdownValue2,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                underline: Container(
                  height: 3,
                  color: Colors.black,
                ),
                items: <String>[
                  'M????teri',
                  '??al????an',
                  'Tedarik??i',
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
                  "Niteli??inizi se??in",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onChanged: (String value) {
                  setState(() {
                    dropdownValue2 = value;
                  });
                },
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
                onPressed: () async {
                  if(dropdownValue2=='M????teri'){
                   atribute = 0;
                  }
                  if(dropdownValue2=='Tedarik??i'){
                    atribute = 1;
                  }
                  if(dropdownValue2=='??al????an'){
                    atribute = 2;
                  }
                  await createTodo();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                            Login(userNo: atribute,)));
                },
                child: Text(
                  "??ye Ol",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

