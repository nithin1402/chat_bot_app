import 'dart:math';

import 'package:flutter/material.dart';

class AppConstants{

  static final List<Map<String,dynamic>> defaultQuestions = [
    {
      "title" : "Most Popular",
      "ques" : [
        {
          "icon" : Icons.ac_unit,
          "color" : Colors.primaries[Random().nextInt(Colors.primaries.length-1)],
          "ques" : "What is AI"
        },
        {
          "icon" : Icons.face,
          "color" : Colors.primaries[Random().nextInt(Colors.primaries.length-1)],
          "ques" : "Tell me a joke"
        },
        {
          "icon" : Icons.account_tree_sharp,
          "color" : Colors.primaries[Random().nextInt(Colors.primaries.length-1)],
          "ques" : "Explain me the concept of Machine Learning"
        },
        {
          "icon" : Icons.cloudy_snowing,
          "color" : Colors.primaries[Random().nextInt(Colors.primaries.length-1)],
          "ques" : "How does Climate change work?"
        },
      ]
    },
    {
      "title" : "Trending",
      "ques" : [
        {
          "icon" : Icons.favorite,
          "color" : Colors.primaries[Random().nextInt(Colors.primaries.length-1)],
          "ques" : "What is meaning of life?"
        },
        {
          "icon" : Icons.face,
          "color" : Colors.primaries[Random().nextInt(Colors.primaries.length-1)],
          "ques" : "Tell me a joke"
        },
      ]
    },
    {
      "title" : "Instagram",
      "ques" : [
        {
          "icon" : Icons.social_distance,
          "color" : Colors.primaries[Random().nextInt(Colors.primaries.length-1)],
          "ques" : "Who is most followed person in instagram?"
        },
        {
          "icon" : Icons.face,
          "color" : Colors.primaries[Random().nextInt(Colors.primaries.length-1)],
          "ques" : "Tell me a joke"
        },
      ]
    },
  ];

}