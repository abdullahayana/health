import 'dart:convert';
import 'package:http/http.dart' as http;

class DoctorApi{
  static Future<List<dynamic>> get() async {
    final response = await http.get(Uri.parse('http://healthdragon.atwebpages.com/api/v1/doctors'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];

    } else {
      throw Exception('Failed to load doctors');
    }
  }
  static Future<void> add(List data) async {
    final response = await http.post(
      Uri.parse('http://healthdragon.atwebpages.com/api/v1/doctors'),
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json",},
    );
  }
  static Future<void> update(id,List data) async {
    final response = await http.patch(
      Uri.parse('http://healthdragon.atwebpages.com/api/v1/doctors/$id'),
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json",},
    );}
    static Future<void> delete(id) async {
    final response = await http.delete(
      Uri.parse(  'http://healthdragon.atwebpages.com/api/v1/doctors/$id'),
    );
  }
}

