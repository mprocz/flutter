import 'dart:convert';

import 'package:http/http.dart' as http;

final String _token = "15489|yihSBRfHbxNTsPHYtanKgzXBCmqsiQZl";

Future<Map> converteNumeroPorExtenso(String? _valor) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/number-to-words?token=$_token&number=$_valor&language=pt&currency=BRL"));
  return json.decode(response.body);
}

Future<Map> buscaCep(String? _cep) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/cep/$_cep?token=$_token"));
  return json.decode(response.body);
}

Future<Map> buscaFeriados(String? _ano, String? _uf) async {
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/holidays/$_ano?token=$_token&state=$_uf"));
  return json.decode(response.body);
}