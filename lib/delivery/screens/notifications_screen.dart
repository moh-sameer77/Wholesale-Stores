import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/notification_model.dart';


class std_notificatio extends StatefulWidget {
  const std_notificatio({
    super.key,
  });

  @override
  State<std_notificatio> createState() => _std_notificatioState();
}

class _std_notificatioState extends State<std_notificatio> {
  static final List<notlist> Nlist = [
    notlist(
        "Message",
        "Description "),
    notlist(
        "Tilte2",
        "Computer Science is a rich and diverse discipline. Areas of interest to computer scientists range "
            "from theoretical studies to the practical development of software for business and industry. Computer scientists skills, "
            "especially in problem-solving, have wide applicability in academic "),
    notlist(
        "Tilte3",
        "Computer Science is a rich and diverse discipline. Areas of interest to computer scientists range "
            "from theoretical studies to the practical development of software for business and industry. Computer scientists skills, "
            "especially in problem-solving, have wide applicability in academic ")
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [HiderWidget(context), ListviewMade()],
          ),
        ),
      ),
    );
  }

  SizedBox ListviewMade() {
    return SizedBox(
      height: 540,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: Nlist.length,
        itemBuilder: (BuildContext context, int index) {
          return catgeory(Nlist[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  Column HiderWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: (() => Navigator.pop(context)),
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          ],
        ),
        Text(
          "Notfication",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromARGB(255, 0, 0, 0))),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  InkWell catgeory(notlist cat) {
    return InkWell(
      onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: false,
          builder: (context) => Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 196, 196, 196),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 15, right: 15),
                child: Column(
                  children: [
                    Text(
                      cat.title,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xff7195E1))),
                    ),
                    const Divider(height: 10, color: Color(0xff7195E1)),
                    Text(
                      cat.content,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xff7195E1))),
                    ),
                  ],
                ),
              )),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)))),
      child: Container(
        width: 250,
        height: 60,
        decoration: const BoxDecoration(
            color: Color(0xff7195E1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Text(
            cat.title,
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255))),
          ),
        ),
      ),
    );
  }
}
