import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class Appointment{

  //get
   static Future<List<dynamic>> fetchAppointments(status) async {
     String authId=FirebaseAuth.instance.currentUser!.uid;

    final response = await http.get(Uri.parse('https://myapi-production-7cea.up.railway.app/api/v1/appointments?userId[eq]=$authId&status[eq]=$status'));
    if (response.statusCode == 200) {
       return json.decode(response.body)['data'];

    } else {
      throw Exception('Failed to load customers');
    }
  }
  // add
  static Future<void> addAppointment(time,date) async {
     String authId=FirebaseAuth.instance.currentUser!.uid;
     final response = await http.post(
       Uri.parse('https://myapi-production-7cea.up.railway.app/api/v1/appointments'),
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

     if (response.statusCode == 201) {
       // Appointment added successfully
       // You can navigate to another page or show a success message
     } else {
       // Handle error, maybe show an error message
       throw Exception('Failed to add appointment');
     }
   }
  //update
   static Future<void> updateAppointment(id) async {
     String authId=FirebaseAuth.instance.currentUser!.uid;
     final response = await http.patch(
       Uri.parse('https://myapi-production-7cea.up.railway.app/api/v1/appointments/$id'),
       body: jsonEncode({
         'status':'cancel'
       }),
       headers: {
         "Content-Type": "application/json",
       },
     );

     if (response.statusCode == 200) {
       // Appointment updated successfully
       // You can navigate to another page or show a success message
     } else {
       // Handle error, maybe show an error message
       throw Exception('Failed to update customer');
     }
   }
   //delete
   static Future<void> deleteAppointment(id) async {
     final response = await http.delete(
         Uri.parse(  'https://myapi-production-7cea.up.railway.app/api/v1/appointments/$id'),
     );

     if (response.statusCode == 200) {
       // Appointment deleted successfully
       // You can navigate to another page or show a success message
     } else {
       // Handle error, maybe show an error message
       throw Exception('Failed to delete customer');
     }
   }
}

