import 'package:flutter/material.dart';

class ColorSetter {
  static Color getUsernameColor(int rating) {
    if (rating <= 1199)
      return Colors.grey;
    else if (rating <= 1399)
      return Colors.green;
    else if (rating <= 1599)
      return Colors.teal.shade300;
    else if (rating <= 1899)
      return Colors.blue.shade500;
    else if (rating <= 2099)
      return Color(0xFFEE82EE);
    else if (rating <= 2299)
      return Colors.yellow.shade400;
    else if (rating <= 2399)
      return Colors.yellow.shade600;
    else if (rating <= 2599)
      return Colors.red.shade300;
    else if (rating <= 2999)
      return Colors.red.shade500;
    else
      return Colors.red.shade900;
  }

  static String getUserLevel(int rating) {
    if (rating == 0)
      return 'Unrated';
    else if (rating <= 1199)
      return 'Newbie';
    else if (rating <= 1399)
      return 'Pupil';
    else if (rating <= 1599)
      return 'Specialist';
    else if (rating <= 1899)
      return 'Expert';
    else if (rating <= 2099)
      return 'Candidate Master';
    else if (rating <= 2299)
      return 'Master';
    else if (rating <= 2399)
      return 'Internation Master';
    else if (rating <= 2599)
      return 'Grandmaster';
    else if (rating <= 2999)
      return 'International Grandmaster';
    else
      return 'Legendary Grandmaster';
  }
}
