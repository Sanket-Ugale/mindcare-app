import 'package:flutter/material.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => QuotesPageState();
}

class QuotesPageState extends State<QuotesPage> {
  List quotes=[
    {
      "title": "Quote Title",
      "description": "You don't have to be positive all the time. It's perfectly okay to feel sad, angry, frustrated, scared, or anxious. Having feelings doesn't make you a negative person. It makes you human.",
      "author": "ori Deschene",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Quote Title",
      "description": "You are braver than you believe, stronger than you seem, and smarter than you think.",
      "author": "A.A. Milne",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Quote Title",
      "description": "The only way out is through.",
      "author": "Robert Frost",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Quote Title",
      "description": "You were given this life because you are strong enough to live it.",
      "author": "Unknown",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Quote Title",
      "description": "Your present circumstances don't determine where you can go; they merely determine where you start.",
      "author": "Nido Qubein",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Quote Title",
      "description": "The only way to do great work is to love what you do.",
      "author": "Steve Jobs",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Quote Title",
      "description": "The best way to predict the future is to create it.",
      "author": "Peter Drucker",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Quote Title",
      "description": "The only limit to our realization of tomorrow will be our doubts of today.",
      "author": "Franklin D. Roosevelt",
      "image": "https://source.unsplash.com/featured/300x203",
    },

  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Scrollbar(
        // trackVisibility: true,

        child: PageView.builder(
          
          scrollDirection: Axis.vertical,
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(94, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("\"${quotes[index]["description"]}\"", style: const TextStyle(fontSize: 15,color: Colors.white),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("- ${quotes[index]["author"]}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}