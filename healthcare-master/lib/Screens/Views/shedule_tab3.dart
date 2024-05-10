import 'package:flutter/material.dart';
import 'package:medical/Api/appointment.dart';
import 'package:medical/Screens/Widgets/shedule_card.dart';

class shedule_tab3 extends StatefulWidget  {
  const shedule_tab3({super.key});

  @override
  State<shedule_tab3> createState() => _shedule_tab1State();
}

class _shedule_tab1State extends State<shedule_tab3>  {
  List<dynamic> appointments =  [];
  @override
  void initState() {
    super.initState();
    loadAppointments();
  }
  void loadAppointments() async {
    List<dynamic> fetchedAppointments = await AppointmentApi.get('cancel');
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
                confirmation: "canceled",
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
