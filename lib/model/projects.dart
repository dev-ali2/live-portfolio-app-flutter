import 'package:simple_icons/simple_icons.dart';

class MyProjects {
  static List<Map> projects = [
    {
      'banner': 'assets/images/portfolio/aazadi_banner_portfolio.png',
      'type': 'Project',
      'name': 'Aazadi',
      'descriptionLine': 'Privacy focused vpn app',
      'features': [
        'One click connect',
        'Only high speed locations around the globe',
        'Multiple themes to make it truly yours',
        'NO bombardment of ads!',
        'Clean and modern design',
        'Easy to use for even a non techy person',
        'Clear privacy policy',
        'No data sharing to third parties',
      ],
      'techUsed': [
        'Flutter',
        'Supabase',
        'Useful APIs',
        'MVC architecture using Get X',
        'Open Vpn servers',
        'Admob integration',
        'Google\'s in-app purchases '
      ],
      'availableOn': [
        {
          'icon': SimpleIcons.googleplay,
          'platformName': ' Play Store',
          'link':
              'https://play.google.com/store/apps/details?id=com.aazadi.dev.ali'
        },
      ]
    },
    {
      'banner': 'assets/images/portfolio/convoconnect2.png',
      'type': 'Open Source',
      'name': 'Convo Connect',
      'descriptionLine': 'Talk in your Favorite Person\'s language ',
      'features': [
        'Real time chat message translation',
        'Choose your favorite language',
        'Send images in High quality',
        'Unsend a message anytime',
        'Auto translation of received messages in your selected language',
        'Sleek design with 6 built in color themes',
        'Auto dark and light mode based on device settings'
      ],
      'techUsed': [
        'Flutter for UI',
        'Dart for logic',
        'Firebase as message storage',
        'One Signal for notifications',
        'High speed/low latency API for translations'
      ],
      'availableOn': [
        {
          'icon': SimpleIcons.github,
          'platformName': ' Github',
          'link': 'https://github.com/dev-ali2/convo-connect-chat-app-android'
        },
      ]
    },
    {
      'banner': 'assets/images/portfolio/fitflick.png',
      'type': 'Project',
      'name': 'Fit Flick',
      'descriptionLine': 'Your ultimate companion for personalized workouts',
      'features': [
        'Clean Minimal UI',
        'Various Workout Options',
        'Custom Schedules',
        'Set specific fitness goals',
        'Perform workout Based on Calories, Distance, or Timer',
        'Complete Guide on Selected Workout Type',
        'Exercise Videos Included'
      ],
      'techUsed': [
        'Flutter for UI',
        'Dart for logic',
        'Firebase cloudstore',
        'One Signal for notifications',
        'Youtube API for workouts',
        'Provider for seamless state management'
      ],
      'availableOn': [
        {
          'icon': SimpleIcons.github,
          'platformName': ' Pending...',
          'link': 'https://github.com/dev-ali2'
        },
      ]
    },
    {
      'banner': 'assets/images/portfolio/ecommerce.png',
      'type': 'Open Source',
      'name': 'E-commere store App',
      'descriptionLine':
          'E-commerce store made in flutter with firebase as backend',
      'features': [
        'Modern Design',
        'All Store related features included',
      ],
      'techUsed': [
        'Flutter for UI',
        'Dart for logic',
        'Firebase as backend (Firebase logic is not included in code)',
        'One Signal for notifications',
      ],
      'availableOn': [
        {
          'icon': SimpleIcons.github,
          'platformName': ' Github',
          'link': 'https://github.com/dev-ali2/ecommerce-store'
        },
      ]
    },
    {
      'banner': 'assets/images/portfolio/musicplayer.png',
      'type': 'Open Source',
      'name': 'Music Player UI',
      'descriptionLine': 'Minimal looking music Player UI',
      'features': [
        'Modern Design',
        'Clean minimal UI',
        'Seperate Dark and light modes',
        'View by categories like Songs, Artists, Albums etc...',
      ],
      'techUsed': [
        'Flutter for UI',
      ],
      'availableOn': [
        {
          'icon': SimpleIcons.github,
          'platformName': ' Github',
          'link': 'https://github.com/dev-ali2'
        },
      ]
    },
    {
      'banner': 'assets/images/portfolio/portfoliosite.png',
      'type': 'Open Source',
      'name': 'Portfolio site',
      'descriptionLine': 'Live Portfolio site in Flutter',
      'features': [
        'Smooth Animations',
        'Select btw light and dark mode upon clicking the logo',
        'Multiplatform support (Android, Web)',
        'Responsive bertween mobile, Tablet and desktop',
      ],
      'techUsed': [
        'Flutter for UI',
        'Dart for logic',
        'Provider for state management',
      ],
      'availableOn': [
        {
          'icon': SimpleIcons.github,
          'platformName': 'Github',
          'link': 'https://github.com/dev-ali2'
        },
      ]
    }
  ];
}
