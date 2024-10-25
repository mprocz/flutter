import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:invertexto/service/invertexto_service.dart';

class PorExtensoPage extends StatefulWidget {
  const PorExtensoPage({super.key});

  @override
  State<PorExtensoPage> createState() => _PorExtensoPage();
}

class _PorExtensoPage extends State<PorExtensoPage> {
  String? campo;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/invertexto.png', fit: BoxFit.contain, height: 40,),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade700,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Digite um número",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: ((value) {
                setState(() {
                  campo = value;
                });
              })
            ),
            Expanded(
              child: FutureBuilder(
                future: converteNumeroPorExtenso(campo),
                builder: (context, snapshot) {
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if(snapshot.hasError){
                        return Container();
                      } else {
                        return exibeResultado(context, snapshot);
                      }
                  }
                },
              ),
            )
          ],
        ),
        ),
    );
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot){
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: snapshot.data["text"],
          labelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(),
        ),
      ),      
    );
  }

}