import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:invertexto/view/busca_cep_page.dart';
import 'package:invertexto/view/busca_feriados_page.dart';
import 'package:invertexto/view/por_extenso_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            GestureDetector(
              child: Row(
                children: const <Widget>[
                  SizedBox(width: 10,),
                  Icon(Icons.edit, color: Colors.white, size: 40,),
                  SizedBox(width: 20,),
                  Text(
                    "Por Extenso",
                    style: TextStyle(color: Colors.white, fontSize: 22)
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PorExtensoPage()));
              },
            ),
            SizedBox(height: 20,),
            GestureDetector(
              child: Row(
                children: const <Widget>[
                  SizedBox(width: 10,),
                  Icon(Icons.home, color: Colors.white, size: 40,),
                  SizedBox(width: 20,),
                  Text(
                    "Buscar CEP",
                    style: TextStyle(color: Colors.white, fontSize: 22)
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BuscaCepPage()));
              },
            ),
            SizedBox(height: 20,),
            GestureDetector(
              child: Row(
                children: const <Widget>[
                  SizedBox(width: 10,),
                  Icon(Icons.calendar_month, color: Colors.white, size: 40,),
                  SizedBox(width: 20,),
                  Text(
                    "Buscar Feriados",
                    style: TextStyle(color: Colors.white, fontSize: 22)
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BuscaFeriados()));
              },
            ),
          ],
        ),
        ),
    );
  }
}