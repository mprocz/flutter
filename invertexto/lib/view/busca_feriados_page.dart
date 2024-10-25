import 'package:flutter/material.dart';
import 'package:invertexto/service/invertexto_service.dart';

class BuscaFeriados extends StatefulWidget {
  const BuscaFeriados({super.key});

  @override
  State<BuscaFeriados> createState() => _BuscaFeriadosState();
}

class _BuscaFeriadosState extends State<BuscaFeriados> {
  String? ano;
  String? uf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/imgs/invertexto.png', fit: BoxFit.contain, height: 40,)]
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade700,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: "Digite um Ano",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white, fontSize: 18), 
              onSubmitted: ((value) {
                setState(() {
                  ano = value;
                });
              })
            ),
            SizedBox(height: 10.0,),
            TextField(
              decoration: const InputDecoration(
                labelText: "Digite um Estado (UF)",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: ((value) {
                setState(() {
                  uf = value;
                });
              })
            ),
            Expanded(
              child: FutureBuilder(
                future: buscaFeriados(ano, uf),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          TextField(
              decoration: InputDecoration(
                labelText: '${snapshot.data[0]["date"]}, ${snapshot.data[0]["name"]}',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
        ],
      ),
    );
  }
}