import 'dart:convert';
import 'package:api_integration_sample/number_fact_resp/number_fact_resp.dart';
import 'package:http/http.dart' as http;

Future<NumberFactResp> numberFactResp({required String number}) async {
  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/albums/$number"),
  );
  final bodyJosn = jsonDecode(response.body) as Map<String, dynamic>;
  final data = NumberFactResp.fromJson(bodyJosn);
  return data;
}
