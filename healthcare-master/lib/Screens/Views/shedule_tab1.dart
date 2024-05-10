import 'package:flutter/material.dart';
import 'package:medical/Api/appointment.dart';
import 'package:medical/Screens/Widgets/shedule_card.dart';

class shedule_tab1 extends StatefulWidget  {
  const shedule_tab1({super.key});

  @override
  State<shedule_tab1> createState() => _shedule_tab1State();
}

class _shedule_tab1State extends State<shedule_tab1>  {
  List<dynamic> appointments =  [];
  @override
  void initState() {
    super.initState();
   loadAppointments();
  }
  void loadAppointments() async {
    List<dynamic> fetchedAppointments = await AppointmentApi.get('upcoming');
    setState(() {
      appointments = fetchedAppointments;
    });
  }
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body:  ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (BuildContext context, int index) {
         final appointment = appointments[index];
          return Column(
            children: [
             const SizedBox(height: 20),
              shedule_card(
                id:appointment["id"] ,
                confirmation: "Upcomimg",
                mainText: appointment["doctor"]['name'],
                subText: appointment["doctor"]['specialty'],
                date: appointment["date"],
                time: appointment["time"],
                image: appointment["doctor"]['image'],
              ),
            ],
          );
        },
      ),
    );
  }
}
