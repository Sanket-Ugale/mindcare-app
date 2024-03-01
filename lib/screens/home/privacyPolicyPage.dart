import 'package:flutter/material.dart';
import 'package:mindcare/const/colors.dart';


class privacyPolicyPage extends StatefulWidget {
  @override
  State<privacyPolicyPage> createState() => _privacyPolicyPageState();
}

class _privacyPolicyPageState extends State<privacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height ,
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
        child: Container(
          // margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.only(top: 35,bottom: 5,left: 5,right: 5),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(30),
                  color: Colors.white54,
                ),
          child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white54,
                          child: Icon(
                            Icons.arrow_back,
                            color: color2,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(
                              context); // This pops the current route off the stack
                        },
                      ),
                    SectionTitle('Privacy Policy'),
                    PrivacyPolicy(),
                    SectionTitle('Terms and Conditions'),
                    TermsAndConditions(),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrivacyPolicyPoint(
            "Data Collection and Usage:",
            [
              "Clearly state what types of data your app collects, including heart rate, blood pressure, steps, activity, captured images, chat interactions, and quiz answers.",
              "Specify the purpose of collecting each type of data, such as monitoring physical activity, assessing mental health, and improving app functionality.",
            ],
          ),
          PrivacyPolicyPoint(
            "User Consent:",
            [
              "Clearly outline that users provide explicit consent for the collection and processing of their data when they use the app.",
              "Explain how users can withdraw their consent and the potential impact on app functionality.",
            ],
          ),
          PrivacyPolicyPoint(
            "Security Measures:",
            [
              "Describe the security measures in place to protect user data from unauthorized access, disclosure, alteration, and destruction.",
              "Mention encryption protocols, access controls, and any other relevant security measures implemented.",
            ],
          ),
          PrivacyPolicyPoint(
            "Data Sharing and Third Parties:",
            [
              "Clearly state whether the collected data will be shared with third parties and for what purposes.",
              "Provide a list of specific third parties with whom data may be shared, such as analytics services or healthcare providers.",
            ],
          ),
          PrivacyPolicyPoint(
            "Data Retention:",
            [
              "Specify the duration for which user data will be retained.",
              "Explain the criteria used to determine the retention period.",
            ],
          ),
          PrivacyPolicyPoint(
            "User Rights:",
            [
              "Outline users' rights regarding their personal data, including the right to access, correct, delete, or port their data.",
              "Provide instructions on how users can exercise these rights.",
            ],
          ),
          PrivacyPolicyPoint(
            "Data Processing and Profiling:",
            [
              "Explain any automated decision-making processes or profiling based on user data.",
              "Clarify the implications of such processes on users and their rights.",
            ],
          ),
          PrivacyPolicyPoint(
            "Updates to Privacy Policy:",
            [
              "State that the privacy policy may be updated, and users will be notified of any changes.",
              "Encourage users to regularly review the privacy policy for updates.",
            ],
          ),
          PrivacyPolicyPoint(
            "Compliance with Laws:",
            [
              "Ensure that the privacy policy complies with relevant data protection laws and regulations, such as GDPR, HIPAA, or other applicable standards.",
            ],
          ),
          PrivacyPolicyPoint(
            "Contact Information:",
            [
              "Provide contact information for users to reach out for questions, concerns, or requests related to their privacy.",
            ],
          ),
        ],
      ),
    );
  }
}

class PrivacyPolicyPoint extends StatelessWidget {
  final String title;
  final List<String> points;

  PrivacyPolicyPoint(this.title, this.points);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: points.map((point) => PrivacyPolicyText(point)).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class PrivacyPolicyText extends StatelessWidget {
  final String text;

  PrivacyPolicyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16),
    );
  }
}

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TermsAndConditionsText(
            "Include a separate section outlining the terms and conditions of using the app, covering aspects such as user obligations, limitations of liability, and dispute resolution.",
          ),
        ],
      ),
    );
  }
}

class TermsAndConditionsText extends StatelessWidget {
  final String text;

  TermsAndConditionsText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16),
    );
  }
}
