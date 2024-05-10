import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/Homepage.dart';
import 'package:medical/Screens/Views/doctor_details_screen.dart';
import 'package:medical/Screens/Widgets/doctorList.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:medical/Api/doctor.dart';

class doctor_search extends StatefulWidget {
  const doctor_search({super.key});

  @override
  State<doctor_search> createState() => _doctor_searchState();
}

class _doctor_searchState extends State<doctor_search> {
  List<dynamic> doctors=[];
  @override
  void initState() {
    super.initState();
    loadDoctors();
  }
  loadDoctors() async{

    List<dynamic> fetchedDoctors = await DoctorApi.get();
    setState(() {
      doctors = fetchedDoctors;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: Homepage()));
          },
          child: Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/icons/back1.png"),
            )),
          ),
        ),
        title: Text(
          "Top Doctors",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/icons/more.png"),
              )),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: ListView.builder(
    itemCount: doctors.length,
    itemBuilder: (BuildContext context, int index) {
      final doctor=doctors[index];
      return    GestureDetector(
      onTap: () {
    Navigator.push(
    context,
    PageTransition(
    type: PageTransitionType.rightToLeft,
    child: DoctorDetails(doctor: doctor,)));
    },
    child: doctorList(
    distance: "800m Away",
    image:  doctor['image'],
    maintext:  doctor['name'],
    numRating: "4.7",
    subtext:  doctor['specialty']),
    );
    },

    )

    ));
  }
}
