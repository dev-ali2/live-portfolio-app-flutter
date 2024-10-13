import 'package:flutter/material.dart';

import "package:simple_icons/simple_icons.dart";

class SocialLinks {
  static String resumeLink =
      'https://drive.google.com/drive/folders/11kIMpZkp6n5uMbAVmKYMmR3UviT5BnZN?usp=drive_link';
  static String whatsappLink = 'https://wa.me/923032464554';
  static Uri email = Uri(scheme: 'mailto', path: 'inbox.meharali@gmail.com');
  static List socialLinks = [
    'https://github.com/dev-ali2',
    'https://www.linkedin.com/in/developerali',
    'https://x.com/devali02',
    'https://www.facebook.com/meharAli24',
    'https://www.instagram.com/mehar_ali24'
  ];
  static List socialLinksShorts = [
    'dev-ali2', //github
    'developerali', // linked in
    'devali02', //twitter
    'meharAli24', //facebook
    'mehar_ali24', //instagram
  ];
  static List<IconData> socialIcons = [
    SimpleIcons.github,
    SimpleIcons.linkedin,
    SimpleIcons.twitter,
    SimpleIcons.facebook,
    SimpleIcons.instagram
  ];
}
