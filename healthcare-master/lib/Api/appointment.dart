import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class AppointmentApi{

  //get
   static Future<List<dynamic>> get(status) async {
     String authId=FirebaseAuth.instance.currentUser!.uid;

    final response = await http.get(Uri.parse('http://healthdragon.atwebpages.com/api/v1/appointments?userId[eq]=$authId&status[eq]=$status'));
    if (response.statusCode == 200) {
       return json.decode(response.body)['data'];

    } else {
      throw Exception('Failed to load customers');
    }
  }
  // add
  static Future<void> add(time,date) async {
     String authId=FirebaseAuth.instance.currentUser!.uid;
     final response = await http.post(
       Uri.parse('http://healthdragon.atwebpages.com/api/v1/appointments'),
       body: jsonEncode({
         "userId": authId,
         "doctorId": "E49wH08QJ3dJpTfQmo3LNal7m5T2",
         "time": time,
         "date": date,
         "status": "upcoming"
       }),
       headers: {
         "Content-Type": "application/json",
       },
     );
   }
  //update
   static Future<void> update(id) async {
     String authId=FirebaseAuth.instance.currentUser!.uid;
     final response = await http.patch(
       Uri.parse('http://healthdragon.atwebpages.com/api/v1/appointments/$id'),
       body: jsonEncode({
         'status':'cancel'
       }),
       headers: {
         "Content-Type": "application/json",
       },
     );
   }
   //delete
   static Future<void> delete(id) async {
     final response = await http.delete(
         Uri.parse(  'http://healthdragon.atwebpages.com/api/v1/appointments/$id'),
     );
   }
}

