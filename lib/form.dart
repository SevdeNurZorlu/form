import 'package:flutter/material.dart';

class form extends StatefulWidget {
  @override
  _formState createState() => _formState();
}

class _formState extends State<form> {

  String _adSoyad, _sifre, _email;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Form"), backgroundColor: Colors.purple),
        floatingActionButton: FloatingActionButton(onPressed: () {

        },
          child: Icon(Icons.save),),
        body: Padding(padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            autovalidate: true,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Adınız ve Soyadınız",
                    labelText: "Ad Soyad",
                    border: OutlineInputBorder(),

                  ),

                  validator: (String girilenVeri) {
                    if (girilenVeri.length < 6) {
                      return "Lütfen adınızı tam girin";
                    }
                    else {
                      return null;
                    }
                  },
                  onSaved: (deger) => _adSoyad = deger,
                ),
                SizedBox(height: 20,),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Email Adresiniz",
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (String girilenVeri) {
                    if (!girilenVeri.contains(("@"))) {
                      return "Geçersiz Email";
                    }
                    else {
                      return null;
                    }
                  },
                  onSaved: (deger) => _email = deger,
                ),
                SizedBox(height: 20,),


                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Şifreniz",
                    labelText: "Şifre",
                    border: OutlineInputBorder(),
                  ),
                  validator: (String girilenVeri) {
                    if (girilenVeri.length < 6) {
                      return "En az 6 karakter Girmelisiniz";
                    }
                    else
                      return null;
                  },
                  onSaved: (deger) => _sifre = deger,
                ),
                SizedBox(height: 20,),

                RaisedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text("KAYDET"),
                  color: Colors.purple,
                  disabledColor: Colors.green,
                  onPressed: () {
                    _girisBilgileriniOnayla;
                  },

                )


              ],
            ),), //Butün elemanları 20 px sarmalıyor
        )

    );
  }

  void _girisBilgileriniOnayla() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint("girilen mail :$_email sifre: $_sifre ad soyad $_adSoyad");
    }
  }
}