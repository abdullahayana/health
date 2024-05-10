import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Api/appointment.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class shedule_card extends StatefulWidget {
  final int id;
  final String mainText;
  final String subText;
  final String image;
  final String date;
  final String time;
  final String confirmation;

  shedule_card(
      {
        required this.id,
        required this.mainText,
      required this.subText,
      required this.date,
      required this.confirmation,
      required this.time,
      required this.image});

  @override
  State<shedule_card> createState() => _shedule_cardState();
}

class _shedule_cardState extends State<shedule_card> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(children: [
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.mainText,
                          style: GoogleFonts.poppins(
                              fontSize: 17.sp, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.subText,
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 99, 99, 99)),
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(widget.image),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover)),
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 0.8500,
            child: Row(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.07,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/callender2.png"),
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Text(
                widget.date,
                style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 99, 99, 99)),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.07,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/watch.png"),
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Text(
                widget.time,
                style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 99, 99, 99)),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.07,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/elips.png"),
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              Text(
                widget.confirmation,
                style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 99, 99, 99)),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.04500,
                  width: MediaQuery.of(context).size.width * 0.3800,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 233, 233),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () { widget.confirmation == 'canceled' ?
                          AppointmentApi.delete(widget.id)
                              : AppointmentApi.update(widget.id);
                           setState(() {

                           });
                          },
                          style: TextButton.styleFrom(
                            // Add styling here
                            textStyle: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 61, 61, 61),
                            ),
                          ),
                          child: widget.confirmation == 'canceled' ? Text("delete") : Text("Cancel")
                          ,
                        ),

                      ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04500,
                  width: MediaQuery.of(context).size.width * 0.3800,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 4, 190, 144),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Add your reschedule button logic here
                          },
                          style: TextButton.styleFrom(
                            // Add styling here
                            textStyle: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 252, 252, 252),
                            ),
                          ),
                          child: const Text("Reschedule",style: TextStyle(color: Colors.white),),
                        ),

                      ]),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
