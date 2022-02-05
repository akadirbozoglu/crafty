import 'package:crafty/homepagecust.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'homepage1.dart';
import 'stock.dart';
import 'signup.dart';
import 'database.dart';
import 'Todo.dart';

class Login extends StatefulWidget {
  final int userNo;
  Login({this.userNo});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();
  bool flag;
  Future<List<User>> future;
  int id;
  int userrrrr;

  @override
  initState() {
    super.initState();
    future = RepositoryServiceTodo.getAllTodos();
  }
  Future<int> checkUser(String email, String password) async {
    List<User> userlist= await RepositoryServiceTodo.getAllTodos();
    for(var i = 0; i < userlist.length; i++){
      if (userlist[i].email.compareTo(email)==0
          && userlist[i].password.compareTo(password)==0) {
        return userlist[i].id;
      }

    }
    return -1;
  }
  Future<int> getUser(int id) async{
    User user= await RepositoryServiceTodo.getTodo(id);
    if (user.attribute.compareTo('Müşteri')==0) {
      return 0;
    }
    else if (user.attribute.compareTo('Tedarikçi')==0) {
      return 1;
    }
    else{
      return 2;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[900],
      appBar: AppBar(
        title: Center(child: Text('Crafty Home')),
        backgroundColor: Colors.brown[900],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/sign.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop))),
        child: StreamBuilder(builder: (context, snapshot) {
          return OrientationBuilder(builder: (context, orientation) {
            return GridView.count(
              mainAxisSpacing: 0.0,
              crossAxisCount: orientation == Orientation.portrait ? 1 : 1,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 400,
                            height: 136,
                            child: Icon(
                              Icons.work_outlined,
                              color: Colors.white,
                              size: 360.0,
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 68,
                            child: TextField(
                              controller: emailControl,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'E-posta Adresi',
                                prefixIcon: Icon(Icons.account_circle_outlined),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 300,
                            height: 68,
                            child: TextField(
                              controller: passwordControl,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Şifre',
                                prefixIcon: Icon(Icons.vpn_key_outlined),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              minWidth: 150,
                              color: Colors.deepOrange[800],
                              textColor: Colors.white,
                              disabledColor: Colors.black,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.black,
                              onPressed: () async {
                                int userid = await checkUser(emailControl.text, passwordControl.text);
                                if(userid == -1){
                                  showToast(context,'Invalid Authocation');
                                }else{
                                  int userno= await getUser(userid);
                                  userrrrr = userid;
                                  final _pageOptions = [
                                    HomePage(userNO: userrrrr),
                                    HomePage1(userNO: userrrrr),
                                    Stock(),
                                  ];
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => _pageOptions[userno]));
                                  });
                                }
                              },
                              child: Text(
                                "Giriş yap",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          ),
                          Container(
                              child: Row(
                            children: <Widget>[
                              Text(
                                'Hesabınız yok mu?',
                                style: TextStyle(
                                  color: Colors.orange,
                                ),
                              ),
                              FlatButton(
                                child: Text(
                                  'Üye Ol',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Signup()));
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          });
        }),
      ),
    );
  }
  void showToast(BuildContext context, String output) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(output),
        action:
        SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

}

class nonAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(''),
      ),
      body: Container(
        child: Center(
            child: Text('WRONG NAME OR PASSWORD',
                style: TextStyle(color: Colors.red, fontSize: 25))),
      ),
    );
  }
}
