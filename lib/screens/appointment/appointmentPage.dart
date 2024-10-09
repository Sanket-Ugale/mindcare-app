import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mindcare/const/api_Urls.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/screens/appointment/appointmentSchedulePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  List specialists = [];
  bool isLoadingMentor = false;
  getSpecialists() async {
    setState(() {
      isLoadingMentor = true;
    });
    var uri =
        Uri.parse(domain_url+"/auth/mentor/profile/");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        specialists = items["payload"];
      });
    } else {
      throw Exception('Failed to load specialists');
    }
    setState(() {
      isLoadingMentor = false;
    });
    // print("Specialists: $specialists");
    // print("specialists.length: ${specialists.length} ");
    print("specialists[0]: ${specialists[0]}");
  }

  @override
  void initState() {
    super.initState();
    getSpecialists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 35,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 0, 55, 67),
                Color.fromARGB(255, 0, 91, 111),
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: isLoadingMentor
              ? Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                      color: color1, size: 55),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Find Your",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                Text("Specialist",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Image(
                                image: AssetImage(
                                  'assets/images/appointment1.png',
                                ),
                                height: 150,
                                width: 150)
                          ],
                        ),
                        Text(
                          "Book an appointment with a Mental Health Specialist.",
                          style: TextStyle(color: color1),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            cursorColor: Colors.white,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Search for a Specialist",
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Categories",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          90, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.telegram,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Psychiatrist",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          90, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.local_hospital,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Psychologist",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          90, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Icon(
                                      Icons.health_and_safety,
                                      color: color1,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Therapist",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Specialist Doctors",
                          style: TextStyle(color: color1, fontSize: 25),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: specialists.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child:  Container(
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(6, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.white30),
                                  ),
                                  child: Row(
                                      children: [
                                        Hero(
                                          tag: specialists[index]["mentor_profile_id"],
                                          child: CircleAvatar(
                                            backgroundColor: color1,
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                                domain_url + specialists[index]["image"],
                                                scale: 1.0),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              specialists[index]["name"],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              specialists[index]
                                                  ["specialization"],
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                             Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                                Text(
                                                  specialists[index]["location"],
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "4.5",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Color.fromARGB(
                                                      255, 251, 255, 0),
                                                  size: 15,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        Icon(
                                            Icons.add_circle_rounded,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                          
                                      ],
                                    ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder:(context ) =>
                                      AppointmentSchedulePage(
                                        id: specialists[index]["mentor_profile_id"],
                                        name:specialists[index]["name"],
                                        specialization: specialists[index]["specialization"],
                                         image: specialists[index]["image"],
                                          rating:specialists[index]["rating"],
                                          experiance:specialists[index]["experience"],
                                        //  qualification: specialists[index]["qualification"], 
                                        availability: specialists[index]["availibility"], 
                                          about:specialists[index]["about"],
                                      )
                                    
                                    ));

                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
